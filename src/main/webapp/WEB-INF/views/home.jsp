<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

 <head>                                                        
 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" > 
 	</script>
 	
 	<script type="text/javascript">
	$(document).ready(function() {
		  var hText = $("#jsonMessage").text();

		  $("#jsonMessage").click(function() {
		    $("#displayName").text(hText);
		  });
		});
	
 		function submitajax() { 
 			var methodURL = "/ajax/ajaxJsonRequest";  // context root = "ajax"
 			$.ajax({
 				type : "GET",
 				url  : methodURL,
 				data : $("#ajaxRestForm").serialize(),
 				success : function(data) {
 					$("#jsonMessage").text(data);
 				},
			    error: function (request, status, error) {
			        alert(request.responseText);
			       $("#jsonMessage").html(error);
			}
 		  })
 		}
 			
 	
 	</script>
 </head>

<body>
	<form id="ajaxRestForm" name="ajaxRestForm" action="/ajaxJsonRequest" method="post" >
		<input  type="text" name="message" id="message" />
    	<input  type="button" value="AJAX REQUEST" onClick="submitajax()"/>
    </form>
	<span id="jsonMessage" ></span>
	<span id="displayName" ></span>
</body>
</html>
