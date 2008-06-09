package dk.sunewatts {

    import flash.display.Sprite;
    import flash.text.*;


    public class textOut extends Sprite
    {
        public var myTextBox01:TextField = new TextField();
		public var myTextBox02:TextField = new TextField();
		public var myTextBox03:TextField = new TextField();
		
		public var thisFont:Font = new myFont();			// references font in .fla library
		public var format1:TextFormat = new TextFormat();
		public var format2:TextFormat = new TextFormat();
		public var format3:TextFormat = new TextFormat();


        public function textOut()
        {
        	// draw a black background:
			var square:Sprite = new Sprite();
			square.graphics.beginFill(0x00);
			square.graphics.drawRect(-(5* 500), -5, 500 * 10, 500);
			square.graphics.endFill();
			square.alpha = .5;
			addChild(square);

			myTextBox01.y = 8;
            addChild(myTextBox01);

			myTextBox02.y = 8;
			myTextBox02.x = 5;
            addChild(myTextBox02);

			myTextBox03.y = 8;
			myTextBox03.x = 0;
            addChild(myTextBox03);            
        }

		public function showText( myText:String, myScore:String, myLives:String):void {

			// room name
			myTextBox01.width = gl.canvasW;
            myTextBox01.height = 30;
            myTextBox01.defaultTextFormat = format1;
			myTextBox01.embedFonts = true;
			myTextBox01.text = myText;

            format1.font = thisFont.fontName;
            format1.color = 0xFFFFFF;
            format1.align = "center";
            format1.size = 8;
            myTextBox01.setTextFormat(format1);
			
			// score
			myTextBox02.width = gl.canvasW;
            myTextBox02.height = 30;
            myTextBox02.defaultTextFormat = format2;
			myTextBox02.embedFonts = true;
			myTextBox02.text = "P: " + myScore;	

            format2.font = thisFont.fontName;
            format2.color = 0x3399FF;
            format2.align = "left";
            format2.size = 8;
            myTextBox02.setTextFormat(format2);
					
			// lives
			myTextBox03.width = gl.canvasW;
            myTextBox03.height = 30;
            myTextBox03.defaultTextFormat = format3;
			myTextBox03.embedFonts = true;
			myTextBox03.text = "L: " + myLives;

            format3.font = thisFont.fontName;
            format3.color = 0xCC0000;
            format3.align = "right";
            format3.size = 8;
            myTextBox03.setTextFormat(format3);

		}
		
		public function refreshDisplay():void {
			showText(gl.v.mapName[gl.v.thisMap], gl.v.points.toString(), gl.v.lives.toString());
		}
    }
}