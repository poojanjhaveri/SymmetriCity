<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Symmetricity : Built with Processing and Processing.js</title>
		<link rel="icon"  type="image/x-icon" href="data:image/x-icon;base64,AAABAAEAEBAQAAEABAAoAQAAFgAAACgAAAAQAAAAIAAAAAEABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAQAAVzABAEAjBQAaDwYAWjUGAGE6CQBrQQ0ATS8PAFhAJwBUQC8AbFI6AHVXPACBZk4A4NrWAPb19QAAAAAAAMmZmZmZmgAJIwAAAAAAcMIjPjA+PjAKpxIuMDMzMAm0Ii4zMzMACaIiLt3dMAAJtyIuIzPQAAm0Un5yM+IzKLRkfncy4iIotRF+dyLkIiq0QX53F+EiGrQUTkd34iIatEVu7u5iIVrBVVRBRFRVbAtGZGZla2uwAMu7u7u8vADAAwAAgAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIABAADAAwAA" />
		<meta name="Generator" content="Processing" />
		<meta name="viewport" content="width=device-width,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes" />
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
		<!-- - - - - - - - - - - - - - - - - - - - - 
		+
		+    Wondering how this works? 
		+
		+    Go to: http://processing.org/
		+    and: http://processingjs.org/
		+
		+ - - - - - - - - - - - - - - - - - - - - -->
		<style type="text/css">
	
	body
	{
		color:#FFF;
		font-size:16px;
		background-repeat:repeat;
		background-image:url(upload/canvas.png);
		
	}
	canvas { 
		display: block; 
		outline: 0px; 
		margin-bottom: 1.5em; 
		box-shadow: 1px 1px 5px 5px #3FC;
		background-color:#000;
		
	}

 
 <script type="text/javascript">
 
 function hideAddressBar()
{
  if(!window.location.hash)
  {
      if(document.height < window.outerHeight)
      {
          document.body.style.height = (window.outerHeight + 50) + 'px';
      }
 
      setTimeout( function(){ window.scrollTo(0, 1); }, 50 );
  }
}
 
window.addEventListener("load", function(){ if(!window.pageYOffset){ hideAddressBar(); } } );
window.addEventListener("orientationchange", hideAddressBar );

 
</script>
		</style>
		<!--[if lt IE 9]>
			<script type="text/javascript">alert("Your browser does not support the canvas tag.");</script>
		<![endif]-->
        <script src="jquery.js"></script>  
		<script src="processing.js" type="text/javascript"></script>
        <script src="functions.js" type="text/javascript">	
      </script>
      	
	
      
      
      
		<script type="text/javascript">
// convenience function to get the id attribute of generated sketch html element
function getProcessingSketchId () { return 'SymmetricPatternsJavascript'; }
</script>
<script src="maxim.js" type="text/javascript"></script>

	</head>
	<body style="background-color:#000">
		<div id="content" align="center">
			<div align="center">
            <div align="center" > 
              <br>
                <br>
                <form class="form-horizontal">
             	Width : <input type="text" value="450" id="width"  class="input-small">
                Height : <input type="text" value="450" id="height"  class="input-small">
    			<button type="button" onclick="setArea('SymmetricPatternsJavascript')" class="btn btn-info">Set New Drawing Space</button>
                </form>
              <form class="form-horizontal">
                Background Color : <input id="backkcolor" type="color" onchange="changeBackgroundColor('SymmetricPatternsJavascript')" class="color"/></form>
               <p>
                <button type="button" onclick="reset('SymmetricPatternsJavascript')" class="btn btn-danger">Reset WorkArea</button>
                <button type="button" onclick="postToPHP()" class="btn btn-danger" >CAPTURE !</button>
                <a href="upload/canvas.png" download="SymmetryPatterns">Download this file</a>
                </p>
                
                 <p>
                <button type="button" onclick="paintusingbrushes('SymmetricPatternsJavascript')" class="btn btn-danger">Paint using Brushes</button>
                <button type="button" onclick="symmetrygenerate('SymmetricPatternsJavascript')" class="btn btn-danger">Automatic</button></p>
                
                </div>
                
				<canvas id="SymmetricPatternsJavascript" data-processing-sources="SymmetricPatternsJavascript.pde">
					<p>Your browser does not support the canvas tag.</p>
					<!-- Note: you can put any alternative content here. -->
				</canvas>
                <noscript>
					<p>JavaScript is required to view the contents of this page.</p>
				</noscript>
          
            <form class="form-inline">
          Select Brush &nbsp;&nbsp(You can also select multiple brushes by pressing ctrl / cmd) <br>
          <select  class="form-control" id="brushcontrol" onChange="changeBrush('SymmetricPatternsJavascript')" multiple="multiple" style="height:220px;" >
  			<option selected >Point Brush</option>
            <option >Horizontal Mirror Brush</option>
            <option >Vertical Mirror Brush</option>
            <option>Rectangle Brush</option>
  			<option>Line Brush</option>
  			<option>Elliptical Brush</option>
  			<option>Random Rectangulo</option>
  			<option>Four Fold Reflection</option>
            	<option>Four Lucky Corners</option>
                	<option>Circular Life</option>
                    	<option>Left-Right</option>
                        <option>Criss-Cross Rotating Lines</option>
		</select></form>
           <form class="form-horizontal">
 Stroke Color : <input id="strokecolor" type="color" onchange="changeStrokeColor('SymmetricPatternsJavascript')"/></form>
 <div style="background-color:#FFF;width:400px">
<font color="#000000">Symmetry Multiplier min:5 max:100:</font> <input type="range" id="multiplier" min="5" max="100" placeholder="5" onChange="changeMultiplier('SymmetricPatternsJavascript')"></div>
<br><br>
  <div class="form-horizontal">
 <input type="text" value="" id="strokewidth" placeholder="Stroke Brush Width" class="input-medium">
 <button type="button" onclick="changeStrokeWidth('SymmetricPatternsJavascript')" class="btn btn-info">Set</button>
 <button type="button" onclick="StrokeSpeed('SymmetricPatternsJavascript')" class="btn btn-info">Stroke Width ~ Mouse Speed</button> </div>
 
<br>
<div class="form-horizontal">
 <input type="text" value="" id="alpha" placeholder="value = mouse speed transparency">
 <button type="button" onclick="changeAlpha('SymmetricPatternsJavascript')" class="btn btn-info">Set</button>
 <button type="button" onclick="DefaultAlpha('SymmetricPatternsJavascript')" class="btn btn-info">Default</button> </div>
 
        </div>
        
        
        <br>
        
        
        
                <div class="form-horizontal">
               
                <input type="text" value="" id="inputtext" placeholder="Set text for center of workspace">
      			<button  type="button" class="btn btn-info" onclick="drawSomeText('SymmetricPatternsJavascript')">Change Text</button>
                <br><br>
               </div>
				
	
        </div>
        </div>
	</body>
</html>
