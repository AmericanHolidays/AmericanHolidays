
<!DOCTYPE html>
<html class="">
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>American Holidays</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="includes/ah_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="includes/Ajax.js" type="text/javascript"></script> 
</head>
<body>
<cfscript>	
	request.HolidaysList = "New_Year,Martin_Luther_King_Day,Valentines_Day,Presidents_Day,Saint_Patricks_Day,Easter_Sunday,Mothers_Day,Memorial_Day,Fathers_Day,Independence_Day,Labor_Day,Columbus_Day,Halloween,Veterans_Day,Thanksgiving,Christmas";
dirPages="C:\ColdFusion8\wwwroot\AHS\includes\pages";
</cfscript>
	<cfoutput>
<div id="headerDiv">
	<h1>American Holidays</h1>
<form name="selectHolidaysForm" id="selectHolidaysForm" action="index.cfm" method="post">
<select name="selectHoliday" onchange="loadXMLDoc(this.value+'.html','divLoadSong')">
<option value="">Select Holiday</option>	
<cfloop list="#request.HolidaysList#" index="i">
    <option value="#i#">
    	#Replace(i,"_"," ","ALL")#
    </option>
</cfloop>
</select>
</form>
</div>
<div id="divLoadSong">

<cfloop list="#request.HolidaysList#" index="i">
	<cfsavecontent variable="pageVar">
<div id="songDiv">
	<h2>#Replace(i,"_"," ","ALL")# song</h2>
	<cfinclude template="includes/lyrics/#i#.htm">
</div>
<div id="musicDiv">
	<h2>Piano version</h2>
	<audio controls>
	<source src="includes/mp3piano/#i#.mp3" type="audio/mpeg">
	Your browser does not support the audio element.
	</audio>
	<h2>Band version</h2>
	by  <a href="http://www.rensmusic.com" title="Renaud Schmitt - rensmusic" target="_blank">Renaud Schmitt - rensmusic</a>
	<audio controls>
	<source src="includes/mp3band/#i#.mp3" type="audio/mpeg">
	Your browser does not support the audio element.
	</audio>

    <br><br>
	<a href="includes/charts/#i#.pdf" target="_blank" title="Download music charts #i#.pdf">
		<img src="includes/images/pdf.gif" title="Download music charts #i#.pdf">
		View music charts
	</a>
</div>
</cfsavecontent>
<cffile action="write" file="#dirPages#\#i#.html" output="#pageVar#">
</cfloop>


</div>
<div id="footerDiv">
Copyright © #DateFormat(Now(),"yyyy")# Lana & Alana Rudkovsky 
</div>
</cfoutput>

</body>
</html>