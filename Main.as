package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Erivan Franklin
	 */
	public class Main extends MovieClip
	{
		
		private var BmpData:BitmapData;
		private var bitMap:Bitmap;
		private var mcBatman:MovieClip;
		
		
		//================================//
		var points:Array = new Array();
		var points2:Array = new Array();
		var pointNum:int = 250;
		var canvas:Sprite = new Sprite();
		var novaCor:uint;
		var cont  :int = 0;
		var myColor:ColorTransform = new ColorTransform();
		//================================//
		public function Main() 
		{
			
			
			//================================//
			addChild(canvas);
			for (var i:int = 0; i<pointNum; i++) {
				points.push(new Point(100,100+i));
				points2.push(new Point(30,30+i));
			} 
			addEventListener(Event.ENTER_FRAME, onLoop, false, 0, true);
			//================================//
			
			
			mcBatman = new mc_batman();
			BmpData = new BitmapData(900,500, true, 0x000000);//#FFFFFF
			BmpData.draw(mcBatman);
			bitMap = new Bitmap(BmpData);	
			//addEventListener(MouseEvent.MOUSE_DOWN, evtBotoes)
			//this.addChild(bitMap);
			
		}
		
		//private function evtBotoes(e:MouseEvent):void 
		//{
			//
			//myColor.color = Math.random() * 0xFFFFFF;
			//this.mc_transform.transform.colorTransform = myColor;
			//
		//}
		
		function onLoop(evt:Event):void {
			cont++;			
			canvas.graphics.clear();			
			if (cont <= stage.frameRate * 5) 
			{
				
				myColor.color = Math.random() * 0xFFFFFF;				
				canvas.graphics.lineStyle(5, myColor.color);//#009900
				cont = 0;
			}
			
			points[0].x = mouseX;
			points[0].y = mouseY;
			points2[10].x = mouseY;
			points2[10].y = mouseY;			
			
			canvas.graphics.moveTo(points[0].x, points[0].y);
			canvas.graphics.moveTo(points2[0].x, points2[0].y);
			for (var i:int = 1; i <pointNum; i++) {
				points[i].x += (points[i - 1].x - points[i].x) / 2;				
				//oints[i].x += 0.5;				
				points[i].y += ((points[i - 1].y) + 1 - points[i].y) / 2;				
				points2[i].x += (points[i-1].x - points[i].x) * 2;
				points2[i].y += ((points[i - 1].y) + 1 - points[i].y) * 2;
				points2[i].x = 30;
				points2[i].y = 30;				
				canvas.graphics.lineTo(points[i].x, points[i].y);
				canvas.graphics.lineTo(points2[i].x, points2[i].y);
				
			}
		}
		
	}

}