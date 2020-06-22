function copyText(){
    var copyText = document.getElementById("short-url").text;
   
  /* Alert the copied text */
//   copyText.select();
//   copyText.setSelectionRange(0, 99999);
var textArea = document.createElement("textarea");
textArea.style.display="hidden";
textArea.value = copyText;

document.body.appendChild(textArea);
textArea.style.display="hidden";
textArea.select();   
  document.execCommand("copy");
  alert("Copied the text: " + copyText);
//   document.documentElement("textarea");
}