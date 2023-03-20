<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebcamTest.aspx.cs" Inherits="WebFormsSandbox.WebcamTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <button type="button" role="button" id="btnPicture" onclick="take_snapshot()">Take picture</button>
        </div>
        <div id="camera"></div>
        <div id="results">
            results
        </div>
    </form>
    <script src="/Scripts/webcam.js"></script>
    <script>
        Webcam.set({
            width: 320,
            height: 240,
            image_format: 'jpeg',
            jpeg_quality: 90
        });

        Webcam.attach("#camera");
    </script>
    <script>
		function take_snapshot() {
			// take snapshot and get image data
            Webcam.snap(function (data_uri) {
                // DEFAULT DEMO FROM WEBSITE: Display image in page
				//document.getElementById('results').innerHTML =
				//	'<h2>Here is your image:</h2>' +
    //                '<img src="' + data_uri + '"/>';
                // Here is your base64 encoded image bytes from data_uri:
                console.log(data_uri);
                console.log("{'imageData': '" + JSON.stringify(data_uri) + "'}");
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "WebcamTest.aspx/UploadImage",
                    data: "{'imageData': '" + JSON.stringify(data_uri) + "'}",
                    success: function () { alert("Upload success") },
                    error: function (e) { alert("Something went wrong. Message: " + e) }
                })
			} );
		}
	</script>
</body>
</html>
