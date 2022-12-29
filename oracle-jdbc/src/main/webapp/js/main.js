$(function(){
	const borderDanger = 'border-danger';
	
	document.querySelector('#submitForm input:first-of-type').focus();
	
	
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