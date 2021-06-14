$(function() {
	/* 「同意する」チェックイベント */
	$('[type="checkbox"]').on('click', function(){
		if($('[type="checkbox"]').prop("checked")){
			$('[type="submit"]').css('background-color', '#ea352d');
		} else {
			$('[type="submit"]').css('background-color', '#c6c6c6');
		}
	});

	/* 「同意する」がチェックされていない場合submit=false */
	$('[type="submit"]').on('click', function(){
		if ($('[type="submit"]').css('background-color') == '#c6c6c6') {
			return false;
		}
	});
});