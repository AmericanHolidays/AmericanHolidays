
var xmlhttp

function loadXMLDoc(url, writediv)

{
xmlhttp=null
// code for Mozilla, etc.
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest()
  }
// code for IE
else if (window.ActiveXObject)
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP")
  }
if (xmlhttp!=null)
  {
  xmlhttp.onreadystatechange= function() {
  	state_Change(writediv);
  }

  xmlhttp.open("GET",url,true)
  xmlhttp.send(null)
  }
else
  {
  alert("Your browser does not support XMLHTTP.")
  }
}

function state_Change(writediv)
{
	
// if xmlhttp shows "loaded"
if (xmlhttp.readyState==4)
  {
  // if "OK"
  if (xmlhttp.status==200)
  {
  document.getElementById(writediv).innerHTML=xmlhttp.responseText;
  }
  else
  {
  //alert("Problem retrieving data:" + xmlhttp.statusText);
  document.getElementById(writediv).innerHTML=xmlhttp.statusText;
  }
  }
}
