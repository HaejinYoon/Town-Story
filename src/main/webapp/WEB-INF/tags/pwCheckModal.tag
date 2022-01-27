<%@ tag language="java" pageEncoding="EUC-KR"%>


<style>

#modal-find-button {
  	background-color: #264d73;
   	color: white;
	font-size: x-large;
}

#modal-find-goto-login {
    background-color: #264d73;
    color: white;
    font-size: x-large;
}

</style>

    <div id="pwModal" class="modal fade " tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content back-ground">

                <div class="modal-header header-color">
                    <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
                    <button type="button" id="pwModal-close" class="btn-close" data-bs-dismiss="modal">X</button>
                </div>
                <div class="modal-body" id="modal-body">

                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">가입 시 입력한 이메일</label>
                        <input type="text" class="form-control" id="modal-check-email">
                    </div>
                    <div id="result"></div>
                </div>
                <div class="modal-footer modal-end">
                	<button id="modal-find-goto-login" class="btn float-end">뒤로</button>
                    <button id="modal-find-button" class="btn float-end">찾기</button>
                </div>
            </div>
        </div>
    </div>
    <script>
    
    	function clearModal() {
    		
    		$("#modal-check-email").val("");
    		$("#result").empty();
			
		}
    
    	const appRoot = '${pageContext.request.contextPath}';	
    
        $("#pwModal-close").click(function () {
        	clearModal();
        	$("#pwModal").modal("hide");
            
        });

        $("#modal-find-goto-login").click(function () {
        	 clearModal();
        	$("#pwModal").modal("hide");   
            //login 페이지가 아닐 경우에만 로그인 모달을 다시 띄운다.
            if(window.location.pathname == '/controller1/user/login') {
            } else {
            	$('#myModal').modal('show');
            }
        });
        
        $("#modal-find-button").click(function () {
            //버튼 입력 막는다
            $("#modal-find-button").attr('disabled', true);

            //로딩창 띄운다.
            $("#result").append(`
            <div class="d-flex justify-content-center">
                <div class="spinner-border" role="status">
                    <span class="sr-only">Loading...</span>
                 </div>
            </div>`
            );

            let emailVal = $('#modal-check-email').val();
            $.ajax({
                type: 'post', //post 방식으로 전송
                url: appRoot + "/user/pwFind", //데이터를 주고받을 파일 주소
                timeout: 10000,
                data: {
                    email: emailVal
                },
                success: function (data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.

                    if (data == "success") {
                        $("#result").text("메일이 발송되었습니다.")
                    } else if (data == "fail") {
                        $("#result").text("존재하지 않는 이메일입니다!")
                    } else if (data == "error") {
                        $("#result").text("에러가 발생했습니다.")
                    } else {
                        $("#result").text("에러가 발생했습니다.")
                    }
                },
                error: function (error) {
                    $("#result").text("에러가 발생했습니다.")
                },

                complete: function () {
                    $("#modal-find-button").attr('disabled', false);
                }
            });


        })
    </script>