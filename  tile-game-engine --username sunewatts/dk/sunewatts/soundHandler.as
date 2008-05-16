package dk.sunewatts {

    import flash.display.*;
    import flash.media.Sound;
    import flash.net.URLRequest;

    public class soundHandler extends Sprite
    {
		public var soundArray:Array = new Array();
		public var mySound:Sound;
	    public var thisCutScene:MovieClip = new MovieClip(); // movie clip from .fla

        public function soundHandler():void {
        	/*	
        mySound = new Sound(new URLRequest("../audio/coin.mp3"));
        soundArray[0] = mySound;
        mySound = new Sound(new URLRequest("../audio/coin.mp3"));
        soundArray[1] = mySound;
        mySound = new Sound(new URLRequest("../audio/coin.mp3"));
        soundArray[2] = mySound;
        mySound = new Sound(new URLRequest("../audio/coin.mp3"));
        soundArray[3] = mySound;
        mySound = new Sound(new URLRequest("../audio/coin.mp3"));
        soundArray[4] = mySound;
        mySound = new Sound(new URLRequest("../audio/coin.mp3"));
        soundArray[5] = mySound;
        */
        }
        
        public function playSound():void {
        	//soundArray[0].play();
        }
    }
}