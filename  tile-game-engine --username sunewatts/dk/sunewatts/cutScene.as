package dk.sunewatts {

    import flash.display.*;
    import flash.text.*;
	import flash.events.*;
	import flash.ui.*;

    public class cutScene extends MovieClip
    {
        public var myTextBox01:TextField = new TextField();
		public var format1:TextFormat = new TextFormat();		
		public var thisFont:Font = new myFont();
		public var showIndex:int = 0;
		public var masterIndex:int = new int();
	    public var thisCutScene:MovieClip = new cutScenes(); // movie clip from .fla
	    
		public var textOut:Array = 	[
									["HELLO - I watch over the locked grate","To open it, I need the star which is kept by the<br>BLUE BOSS","Go through the door and kill him with the cannon<br>It's your only chance!"]
									];

        public function cutScene()
        {
        }
        
        public function showCutScene(myNumber:int):void {
        
        	gl.v.gamePaused = true;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, key_press);
			
			masterIndex = myNumber;

          	// draw a black background:
			var square:Sprite = new Sprite();
			square.graphics.beginFill(0x00);
			square.graphics.drawRect(0, gl.canvasH / 2, gl.canvasW, gl.canvasH / 2);
			square.graphics.endFill();
			square.alpha = 1;
			addChild(square);

			// add movie from flash library
			thisCutScene.x = 10;
			thisCutScene.y = gl.canvasH /2 + 10;
			thisCutScene.gotoAndStop(2);
			addChild(thisCutScene);

			// add text box
			myTextBox01.width = gl.canvasW - 200;
            myTextBox01.height = 500;
            myTextBox01.x = 140;
            myTextBox01.y = gl.canvasH / 2 + 10;
            myTextBox01.multiline = true;
            myTextBox01.wordWrap = true;
            myTextBox01.defaultTextFormat = format1;
			myTextBox01.embedFonts = true;
			myTextBox01.htmlText = textOut[masterIndex][showIndex];
            format1.font = thisFont.fontName;
            format1.color = 0xFFFFFF;
            format1.align = "left";
            format1.size = 8;
            format1.leading = 5;
            myTextBox01.setTextFormat(format1);
			addChild (myTextBox01);	
                
		}
 
 
		public function key_press(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case Keyboard.SPACE :
				textForward();
				break;
			}
		}
		
		public function textForward():void {
			showIndex ++;
			if (showIndex < textOut[masterIndex].length) {
				// show next screen of text
				myTextBox01.htmlText = textOut[masterIndex][showIndex];
				myTextBox01.setTextFormat(format1);
			} else {
				// finished - clean up
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, key_press);
				removeChildAt(0);
				removeChildAt(1);
				thisCutScene.gotoAndStop(0); // TODO fix this
				showIndex = 0;		
				gl.v.gamePaused = false;
			}
		}


    }
}