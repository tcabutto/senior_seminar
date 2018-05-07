
function openQRCamera(node) {
  var reader = new FileReader();
  
  reader.onload = function() {
    node.value = "";
    qrcode.callback = function(res) {
      if(res instanceof Error) {
        alert("No QR code found. Please make sure the QR code is within the camera's frame and try again.");
      } 
      else {
        node.parentNode.previousElementSibling.value = res;
        //var system = res.split("=>")[1].replace("\"}","").substr(0,res.length);
        //var user = res.split("=>")[2].replace("\"}","").substr(1,res.length);
        var answer = confirm("You want to redeem the deal code:  " +res)
        if(answer == true){
          $.ajax("/deals/"+parseInt(system)+"/redeem");
        }
      }
    };
    qrcode.decode(reader.result);
  };
  reader.readAsDataURL(node.files[0]); 

}
function showQRIntro() {
  return confirm("Use your camera to take a picture of a QR code.");

}

function manualInput(){
  var input = document.getElementById('qr-code-input').value
  var reply = confirm("You want to redeem the deal code:  " +input)
  if(reply == true){
    $.ajax("/deals/"+input+"/redeem");
  }
}
