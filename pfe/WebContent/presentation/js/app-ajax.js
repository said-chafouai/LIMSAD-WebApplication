//$(document).ready(function() {
//        $('#userName').blur(function(event) {
//                var name = $('#userName').val();
//                $.get('GetUserServlet', {
//                        userName : name
//                }, function(responseText) {
//                        $('#ajaxGetUserServletResponse').text(responseText);
//                });
//        });
//});
//

$(document).ready(function() {
	$('#modifier').click(function() {
		$.ajax({
			url : 'Ajax',
			header:{
				accept : "text/html"
			},
			data : {
				userName : $('input[name=test]:checked').val()
			},
			success : function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			}
		});
	});
});

//$(document).ready(function() {
//	$('#userName').blur(function() {
//		$.ajax({
//			url : 'Ajax',
//			data : {
//				userName : $('#userName').val()
//			},
//			success : function(responseText) {
//				$('#ajaxGetUserServletResponse').text(responseText);
//			}
//		});
//	});
//});
