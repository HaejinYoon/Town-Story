package com.team1.service.board;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team1.domain.board.HelpFileVO;
import com.team1.domain.board.HelpVO;
import com.team1.mapper.board.HelpFileMapper;
import com.team1.mapper.board.HelpMapper;
import com.team1.mapper.board.HelpReReplyMapper;
import com.team1.mapper.board.HelpReplyMapper;
import com.team1.mapper.board.HelpUpMapper;
import com.team1.mapper.board.ReportMapper;

import lombok.Setter;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class HelpService {
	@Setter(onMethod_ = @Autowired)
	private HelpMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private HelpReplyMapper helpReplyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private HelpReReplyMapper helpReReplyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReportMapper reportMapper;

	@Setter(onMethod_ = @Autowired)
	private HelpFileMapper fileMapper;
	
	@Setter(onMethod_ = @Autowired)
	private HelpUpMapper upMapper;

	@Value("${aws.accessKeyId}")
	private String accessKeyId;

	@Value("${aws.secretAccessKey}")
	private String secretAccessKey;

	@Value("${aws.bucketName}")
	private String bucketName;
	
	@Value("${aws.staticUrl}")
	private String staticUrl;
	
	private Region region = Region.AP_NORTHEAST_2;
	private S3Client s3;
	
	@PostConstruct
	
	public void init() {
		// spring bean??? ????????? ??? ??? ????????? ???????????? ?????? ??????

		// ?????? ?????? ??????
		AwsBasicCredentials credentials = AwsBasicCredentials.create(accessKeyId, secretAccessKey);

		// crud ????????? s3 client ?????? ??????
		this.s3 = S3Client.builder().credentialsProvider(StaticCredentialsProvider.create(credentials)).region(region)
				.build();
	}

	// s3?????? key??? ???????????? ?????? ??????
	private void deleteObject(String key) {
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		s3.deleteObject(deleteObjectRequest);
	}
	
	// s3?????? key??? ?????? ?????????(put)
	private void putObject(String key, Long size, InputStream source) {
		PutObjectRequest putObjectRequest = PutObjectRequest.builder().bucket(bucketName).key(key).acl(ObjectCannedACL.PUBLIC_READ).build();
		RequestBody requestBody = RequestBody.fromInputStream(source, size);
		s3.putObject(putObjectRequest, requestBody);
		
	}

	@Transactional
	public void register(HelpVO board, MultipartFile[] files, String thumNail) throws IllegalStateException, IOException {
		System.out.println("thumbNail" + thumNail);
	
		register(board);
		
		//??????????????? ????????? ??????
		for (int i = 0; i<files.length; i++) {
			
			HelpFileVO fileVO = new HelpFileVO();
			
			MultipartFile file = files[i];
			
			System.out.println(file.getOriginalFilename());
			//????????? ????????? ?????? ???????????? ?????? ???????????? ???????????? ????????????.
			if(i==0 && thumNail == null) {
				
				fileVO.setIsThumbnail(1);
			//???????????? ???????????? ???????????? ???????????? ???????????? ??????
			} else if (file.getOriginalFilename().equals(thumNail)){
				
				fileVO.setIsThumbnail(1);
			} else {
				fileVO.setIsThumbnail(0);
			}
			
			fileVO.setFileName(file.getOriginalFilename());
			fileVO.setPostId(board.getId());
	
			
			if (file != null && file.getSize() > 0) {
				// 2.1 ????????? ??????, FILE SYSTEM, s3
				String key = "board/help-board/" + board.getId() + "/" + file.getOriginalFilename();
				putObject(key, file.getSize(), file.getInputStream());
				String url = "https://" + bucketName + ".s3." + region.toString() +".amazonaws.com/" +key;
				fileVO.setUrl(url);
				// insert into File table, DB
				fileMapper.insert(fileVO);
			}
			
		}
	}

	public List<HelpFileVO> getNamesByBoardId(Integer id) {
		return fileMapper.selectNamesByBoardId(id);
	}
	
	//????????? ???????????? url??? ????????????.
	@Transactional
	public boolean modify(HelpVO board, String[] removeFile, MultipartFile[] files, String thumbNail)
			throws IllegalStateException, IOException {
		
		System.out.println(thumbNail);
		modify(board);
		// write files
		// ?????? ??????
		if (removeFile != null) {
			for (String removeFileName : removeFile) {
				// file system, s3?????? ??????
				//String key = "board/help-board/" + board.getId() + "/" + removeFileName;
				String key = removeFileName.substring(staticUrl.length());
				System.out.println(removeFileName);
				System.out.println(key);
				deleteObject(key);
				// db table?????? ??????
				fileMapper.deleteByUrl(removeFileName);
			}
		}
		
		
		//??? ????????? ?????? (????????? ????????? ?????? ??????)
		for (MultipartFile file : files) {
			if (file != null && file.getSize() > 0) {
				// 1. write file to filesystem, s3
				
				HelpFileVO helpFileVO = new HelpFileVO();
				String key = "board/help-board/" + board.getId() + "/" + file.getOriginalFilename();
				putObject(key, file.getSize(), file.getInputStream());
				String url = "https://" + bucketName + ".s3." + region.toString() +".amazonaws.com/" +key;
				helpFileVO.setFileName(file.getOriginalFilename());
				helpFileVO.setUrl(url);
				helpFileVO.setPostId(board.getId());
				//helpFileVO.setIsThumbnail(0);
				
				if(file.getOriginalFilename().equals(thumbNail)) {
					helpFileVO.setIsThumbnail(1);
				} else {
					helpFileVO.setIsThumbnail(0);
				}
				
				fileMapper.insert(helpFileVO);
				// 2. db ????????? insert
				//fileMapper.delete(board.getId(), file.getOriginalFilename());
				//fileMapper.insert(board.getId(), file.getOriginalFilename());
			}
		}
		
		//??? ????????? ?????? ?????? (?????? ???????????? ????????? ??????)
		List<HelpFileVO> fileVO = fileMapper.selectNamesByBoardId(board.getId());
		
		for(HelpFileVO file : fileVO) {
			
			if(file.getFileName().equals(thumbNail)) {
				fileMapper.setThumbnailById(file.getId());
			} else {
				fileMapper.unsetThumbnailById(file.getId());
			}
			
		}
		
		return false;
	}

	public List<HelpVO> getList(Integer id) {
		return mapper.getList(id);
	}

	public HelpVO get(Integer id, Integer loginId) {
		return mapper.read(id, loginId);
	}

	public boolean register(HelpVO board) {
		return mapper.insert(board) == 1;
	}

	public boolean modify(HelpVO board) {
		return mapper.update(board) == 1;
	}
	
	@Transactional
	public boolean remove(Integer id) {
		
		//1.0 ???????????? ?????? ????????? ?????????
		helpReReplyMapper.deleteByBoardId(id);

		// 1.1 ???????????? ?????? ?????? ?????????
		helpReplyMapper.deleteByBoardId(id);
		// 1.2 ????????? ?????????
		upMapper.upDeleteByBoardId(id);
		//1.3 ???????????? ????????? 
		reportMapper.deleteByHelpId(id);

		// 2. ?????? ????????? , s3
		// file system?????? ??????
		// ????????? - ?????? ?????? ????????? ?????? ???????????? ??? ???????????? ??????
		List<HelpFileVO> files = fileMapper.selectNamesByBoardId(id);
		if (files != null) {
			for (HelpFileVO file : files) {
				//s3?????? ?????????.
				String key = "board/help-board/" + id + "/" + file.getFileName();
				deleteObject(key);
			}
		}
		// db?????? ??????
		fileMapper.deleteByBoardId(id);
		// 3. ????????? ?????????
		return mapper.delete(id) == 1;
	}
	
	

	public boolean upViews(Integer id) {
		return mapper.upViews(id) == 1;
	}

//	public boolean upUps(Integer id) {
//		return mapper.upUps(id) == 1;
//	}

	public List<HelpVO> getListSearchByContent(String search) {
//			, Integer page, Integer numberPerPage, Integer numberPerPagination) { ?????? ????????? ????????? ????????? ??????????????? ????????? ?????? (?????? ?????? ?????? ??????)
//		return mapper.getListSearchByTitle(search, from, numberPerPage, numberPerPagination);
		return mapper.getListSearchByContent(search);
	}
	
	public List<HelpVO> getListByConditions(String location, String tag, String query, Integer id) {
		return mapper.getListByConditions(location, tag, query, id);
	}

	public List<HelpFileVO> getFiles() {
		return mapper.getFiles();
	}

	public List<HelpFileVO> getFilesById(Integer id) {
		return mapper.getFilesById(id);
	}
	
	public List<HelpVO> getListByUserId(Integer id) {
		return mapper.getListByUserId(id);
	}
	

}
