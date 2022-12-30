$(function(){
	const borderDanger = 'border-danger';
	
	for(let i = document.querySelectorAll('#submitForm .form-control').length-1; i >= 0 ; i--) {
		if(document.querySelectorAll('#submitForm .form-control')[i].getAttribute('readonly') == null) {
			document.querySelectorAll('#submitForm .form-control')[i].focus();		
		}				
	}
	
	// 로그인 유효성 검사
	$('#submitBtn').click(function() {
		// name 빈값 검사
		if($('#memberName').val() == '') {
			$('#memberName').focus();
			$('#memberName').addClass(borderDanger);
			return;
		}
		
		// id 빈값 검사
		if($('#memberId').val() == '') {
			$('#memberId').focus();
			$('#memberId').addClass(borderDanger);
			return;
		}
		
		// pw 빈값 검사
		if($('#memberPw').val() == '') {
			$('#memberPw').focus();
			$('#memberPw').addClass(borderDanger);
			return;
		}
		
		// 비밀번호 변경 빈값 검사
		if($('#password').val() == '') {
			$('#password').focus();
			$('#password').addClass(borderDanger);
			return;
		}
		if($('#newMemberPw').val() == '') {
			$('#newMemberPw').focus();
			$('#newMemberPw').addClass(borderDanger);
			return;
		}
		if($('#newMemberPwCk').val() == '') {
			$('#newMemberPwCk').focus();
			$('#newMemberPwCk').addClass(borderDanger);
			return;
		}
		
		// board writer 검사
		if($('#boardTitle').val() == '') {
			$('#boardTitle').focus();
			$('#boardTitle').addClass(borderDanger);
			return;
		}
		if($('#boardContent').val() == '') {
			$('#boardContent').focus();
			$('#boardContent').addClass(borderDanger);
			return;
		}
		
		// 아이디, 이름, 비밀번호 공백 허용 안함 -> undefined(search)에러!, search함수 안의 값을 찾지 못함, 해결: && 앞에 조건이 false라면 뒤에 조건은 실행되지 않기에 AND조건을 줌 
		if($('#memberName').val() != null && $('#memberName').val().search(/\s/) != -1) {
			alert('Username: 공백을 제외하여 입력해주세요.');	
			return false;
		}
		
		if($('#memberId').val() != null && $('#memberId').val().search(/\s/) != -1) {
			alert('Userid: 공백을 제외하여 입력해주세요.');	
			return false;
		}
		
		if($('#memberPw').val() != null && $('#memberPw').val().search(/\s/) != -1) {
			alert('Password: 공백을 제외하여 입력해주세요.');	
			return false;
		}
		
		if($('#password').val() != null && $('#password').val().search(/\s/) != -1) {
			alert('Password: 공백을 제외하여 입력해주세요.');	
			return false;
		}
		
		if($('#newMemberPw').val() != null && $('#newMemberPw').val().search(/\s/) != -1) {
			alert('New Password: 공백을 제외하여 입력해주세요.');	
			return false;
		}
		
		// 게시글 입력 시 공백(스페이스)만 있으면 입력 불가 -> 해당 문자의 앞뒤 공백을 제거하여 비교하여 해결
		if($('#boardTitle').val() != null && $('#boardTitle').val().trim() == '') {
			alert('title: 내용을 입력하세요.');
			return false;
		}
		
		if($('#boardContent').val() != null && $('#boardContent').val().trim() == '') {
			alert('content: 내용을 입력하세요.');
			return false;
		}
		  
		$('#submitForm').submit();
	});
	
	// 키보드 입력 시 경고 제거
	$('#memberName').keyup(function() {
		$('#memberName').removeClass(borderDanger);
	})
	$('#memberId').keyup(function() {
		$('#memberId').removeClass(borderDanger);
	})
	$('#memberPw').keyup(function() {
		$('#memberPw').removeClass(borderDanger);
	})
	$('#password').keyup(function() {
		$('#password').removeClass(borderDanger);
	})
	$('#newMemberPw').keyup(function() {
		$('#newMemberPw').removeClass(borderDanger);
	})
	$('#newMemberPwCk').keyup(function() {
		$('#newMemberPwCk').removeClass(borderDanger);
	})
	$('#boardTitle').keyup(function() {
		$('#boardTitle').removeClass(borderDanger);
	})
	$('#boardContent').keyup(function() {
		$('#boardContent').removeClass(borderDanger);
	})
});