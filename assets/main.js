function copyText(){
var copyText = document.getElementById("short-url").text;
var textArea = document.createElement("textarea");
// textArea.style.display="hidden";
textArea.value = copyText;

document.body.appendChild(textArea);
// textArea.style.display="hidden";
textArea.select();   
document.execCommand("copy");
alert("Copied the text: " + copyText);
textArea.remove();
}