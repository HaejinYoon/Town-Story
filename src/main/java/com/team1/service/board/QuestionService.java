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

import com.team1.domain.board.QuestionFileVO;
import com.team1.domain.board.QuestionPageInfoVO;
import com.team1.domain.board.QuestionVO;
import com.team1.mapper.board.QuestionFileMapper;
import com.team1.mapper.board.QuestionMapper;
import com.team1.mapper.board.QuestionReReplyMapper;
import com.team1.mapper.board.QuestionReplyMapper;
import com.team1.mapper.board.QuestionUpMapper;
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
public class QuestionService {

	@Setter(onMethod_ = @Autowired)
	private QuestionMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private QuestionFileMapper fileMapper;
	
	@Setter(onMethod_ = @Autowired)
	private QuestionReplyMapper questionReplyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private QuestionReReplyMapper questionReReplyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReportMapper reportMapper;
	
	@Setter(onMethod_ = @Autowired)
	private QuestionUpMapper upMapper;
	
	
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
		PutObjectRequest putObjectRequest = PutObjectRequest.builder()
				.bucket(bucketName).key(key).acl(ObjectCannedACL.PUBLIC_READ).build();
		
		
		RequestBody requestBody = RequestBody.fromInputStream(source, size);
		s3.putObject(putObjectRequest, requestBody);
		
	}
	public QuestionVO get(Integer id) {
		return mapper.read(id);
	}
	
	public boolean register(QuestionVO board) {
		
		return mapper.insert(board) == 1;
	}
	
	public List<QuestionVO> getList() {
		return mapper.getList();
	}
	public boolean modify(QuestionVO board) {
		return mapper.update(board) == 1;
	}
	
	public List<QuestionVO> getListPage(Integer page, Integer numberPerPage, String location, String tag, String query) {

		// sql?????? ????????? record ?????? ?????? (0-index)
		Integer from = (page - 1) * 10;

		return mapper.getListPage(from, numberPerPage, location, tag, query);
	}
	
	public QuestionPageInfoVO getPageInfo(Integer page, Integer numberPerPage, String location, String tag, String query) {
		// ??? ????????? ???
		Integer countRows = mapper.getCountRows(location, tag, query);

		// ????????? ????????? ??????
		Integer lastPage = (countRows - 1) / numberPerPage + 1;

		// ?????????????????? ?????? ?????? ??????
		Integer leftPageNumber = (page - 1) / 10 * 10 + 1;

		// ?????????????????? ?????? ????????? ??????
		Integer rightPageNumber = (page - 1) / 10 * 10 + 10;
		// ?????? ????????? ???????????? ???????????? ?????????
		rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;

		// ?????? ????????? ?????? ?????? ??????
		Boolean hasPrevButton = leftPageNumber != 1;

		// ?????? ????????? ?????? ?????? ??????
		Boolean hasNextButton = rightPageNumber != lastPage;

		QuestionPageInfoVO pageInfo = new QuestionPageInfoVO();

		pageInfo.setLastPage(lastPage);
		pageInfo.setCountRows(countRows);
		pageInfo.setCurrentPage(page);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setHasPrevButton(hasPrevButton);
		pageInfo.setHasNextButton(hasNextButton);

		return pageInfo;
	}
	
	@Transactional
	public void register(QuestionVO board, MultipartFile[] files) throws IllegalStateException, IOException {
		
		register(board);
		
		QuestionFileVO fileVO = new QuestionFileVO();
		for (int i = 0; i<files.length; i++) {
		
		MultipartFile file = files[i];
			
		
		fileVO.setPostId(board.getId());
		fileVO.setFileName(file.getOriginalFilename());
		
			if (file != null && file.getSize() > 0) {
				// 2.1 ????????? ??????, FILE SYSTEM, s3
				
				String key = "board/question-board/" + board.getId() + "/" + file.getOriginalFilename();
				putObject(key, file.getSize(), file.getInputStream());
				
				String url = "https://" + bucketName + ".s3." + region.toString() +".amazonaws.com/" +key;
				fileVO.setUrl(url);

				// insert into File table, DB
				fileMapper.insert(fileVO);
			}
		
		}
		
		
	}

	@Transactional
	public boolean modify(QuestionVO board, String[] removeFile, MultipartFile[] files)
			throws IllegalStateException, IOException {
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
		
		
		//????????? url ??????
		for (MultipartFile file : files) {
			if (file != null && file.getSize() > 0) {
				// 1. write file to filesystem, s3
				
				QuestionFileVO questionFileVO = new QuestionFileVO();
				
				// ?????? board/help-board/ ??? ??????????????? help ??? quesiton ?????? ??????????????? (??????) 
				String key = "board/quesiton-board/" + board.getId() + "/" + file.getOriginalFilename();
				putObject(key, file.getSize(), file.getInputStream());
				String url = "https://" + bucketName + ".s3." + region.toString() +".amazonaws.com/" +key;
				questionFileVO.setFileName(file.getOriginalFilename());
				questionFileVO.setUrl(url);
				questionFileVO.setPostId(board.getId());
				
				fileMapper.insert(questionFileVO);
				// 2. db ????????? insert
				//fileMapper.delete(board.getId(), file.getOriginalFilename());
				//fileMapper.insert(board.getId(), file.getOriginalFilename());
			}
		}
		return false;
	}

	public boolean remove(Integer id) {
		
		//1.0 ???????????? ?????? ????????? ?????????
		questionReReplyMapper.deleteByBoardId(id);
		
		// 1.1 ???????????? ?????? ?????? ?????????
		questionReplyMapper.deleteByBoardId(id);
		// 1.2 ????????? ?????????
		upMapper.upDeleteByBoardId(id);
		//1.3 ???????????? ????????? 
		reportMapper.deleteByQuestionId(id);

		// 2. ?????? ????????? , s3
		// file system?????? ??????
		// ????????? - ?????? ?????? ????????? ?????? ???????????? ??? ???????????? ??????
		List<QuestionFileVO> files = fileMapper.selectNamesByBoardId(id);
		if (files != null) {
			for (QuestionFileVO file : files) {
				//s3?????? ?????????.
				String key = "board/question-board/" + id + "/" + file.getFileName();
				deleteObject(key);
			}
		}
		// db?????? ??????
		fileMapper.deleteByBoardId(id);
		// 3. ????????? ?????????
		return mapper.delete(id) == 1;
	}
	
	public List<QuestionFileVO> getNamesByBoardId(Integer id) {
		return fileMapper.selectNamesByBoardId(id);
	}


	public List<QuestionVO> getListPageByNotice() {
		return mapper.getListPageByNotice();
	}
	
	public boolean upViews(Integer id) {
		return mapper.upViews(id) == 1;

	}
	
	public List<QuestionVO> getListByUserId(Integer Id){
		return mapper.getListByUserId(Id);
	}
}
