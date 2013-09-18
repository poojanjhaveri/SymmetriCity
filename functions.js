// JavaScript Document

		function drawSomeText(id) 
	  	{
        	var pjs = Processing.getInstanceById(id);
        	var text = document.getElementById('inputtext').value;
        	pjs.drawText(text);
		 }
		
		function reset(id) 
		{
        	var pjs = Processing.getInstanceById(id);
        	pjs.reset(); 
		}
		
		function setArea(id) 
		{
        	var pjs = Processing.getInstanceById(id);
        	var w1 = document.getElementById('width').value;
			var h1 = document.getElementById('height').value;
        	pjs.setArea(w1,h1); 
		}
		
		function changeBackgroundColor(id) 
		{
        	var pjs = Processing.getInstanceById(id);
			var color = document.getElementById('backkcolor').value;
			var rgb = hex2rgb(color);
        	pjs.setBackColor(rgb.r,rgb.g,rgb.b); 
		}
		
		function changeStrokeColor(id) 
		{
        	var pjs = Processing.getInstanceById(id);
			var color = document.getElementById('strokecolor').value;
			var rgb = hex2rgb(color);
        	pjs.setStrokeColor(rgb.r,rgb.g,rgb.b); 
		}
		
		function changeStrokeWidth(id) 
		{
        	var pjs = Processing.getInstanceById(id);
			var strokewidth = document.getElementById('strokewidth').value;
        	pjs.setStrokeWidth(strokewidth); 
		}
		
		function StrokeSpeed(id) 
		{
        	var pjs = Processing.getInstanceById(id);
        	pjs.setDefaultStrokeWidth(); 
		}
		
		function changeAlpha(id) 
		{
        	var pjs = Processing.getInstanceById(id);
			var alpha = document.getElementById('alpha').value;
        	pjs.setAlpha(alpha); 
		}
		
		function DefaultAlpha(id) 
		{
        	var pjs = Processing.getInstanceById(id);
        	pjs.setDefaultAlpha(); 
		}
		
		
		
		
		
		function hex2rgb(hex) {
  			if (hex[0]=="#") hex=hex.substr(1);
 			 if (hex.length==3) {
    			var temp=hex; hex='';
    			temp = /^([a-f0-9])([a-f0-9])([a-f0-9])$/i.exec(temp).slice(1);
    			for (var i=0;i<3;i++) hex+=temp[i]+temp[i];
  				}
  				var colorcut = /^([a-f0-9]{2})([a-f0-9]{2})([a-f0-9]{2})$/i.exec(hex).slice(1);
  				return {
    			r:   parseInt(colorcut[0],16),
    			g: parseInt(colorcut[1],16),
    			b:  parseInt(colorcut[2],16)
 				 }
				}

		function changeBrush(id)
		{
			var brushes = new Array();
			var pjs = Processing.getInstanceById(id);
			var x=document.getElementById("brushcontrol");
  			for (var i = 0; i < x.options.length; i++) {
        		 brushes[i]=x.options[i].selected;
  				}
			pjs.changeBrush(brushes);
		}
		
		
		
		function paintusingbrushes(id,boolean) 
		{
        	var pjs = Processing.getInstanceById(id);
        	pjs.setAutomaticGenerator(false); 
		}
		
		
		function symmetrygenerate(id,boolean) 
		{
        	var pjs = Processing.getInstanceById(id);
        	pjs.setAutomaticGenerator(true); 
		}
		
		function changeMultiplier(id,int1) 
		{
        	var pjs = Processing.getInstanceById(id);
			var m = document.getElementById("multiplier").value;
        	pjs.setMultiplier(m); 
		}
		
		
		
		function postToPHP(){
   
   			var data = document.getElementById("SymmetricPatternsJavascript").toDataURL();

			$.post("process.php", {
			imageData : data
			}, function(data) {		 
			document.body.style.backgroundImage='url(upload/canvas.png)';
			
	
			//window.location = data;
			});
		}
	