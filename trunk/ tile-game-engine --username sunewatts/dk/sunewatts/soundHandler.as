package dk.sunewatts {

    import flash.display.*;
    import flash.media.Sound;
    import flash.media.SoundTransform;
    import flash.net.URLRequest;

    public class soundHandler extends Sprite
    {
		public var soundArray:Array = new Array();
		public var mySound:Sound;
	    public var thisCutScene:MovieClip = new MovieClip(); // movie clip from .fla

        public function soundHandler():void {
        // disabled for now
		/*	
        mySound = new Sound(new URLRequest("../assets_audio/00_theme.mp3"));
        soundArray[0] = mySound;
        mySound = new Sound(new URLRequest("../assets_audio/04_coin.mp3"));
        soundArray[1] = mySound;
        mySound = new Sound(new URLRequest("../assets_audio/03_jump.mp3"));
        soundArray[2] = mySound;
        mySound = new Sound(new URLRequest("../assets_audio/02_hurt.mp3"));
        soundArray[3] = mySound;
        mySound = new Sound(new URLRequest("../assets_audio/05_bossDie.mp3"));
        soundArray[4] = mySound;
        mySound = new Sound(new URLRequest("../assets_audio/06_playerDie.mp3"));
        soundArray[5] = mySound;
        mySound = new Sound(new URLRequest("../assets_audio/07_jumpPad.mp3"));
        soundArray[6] = mySound;
        mySound = new Sound(new URLRequest("../assets_audio/08_cannon.mp3"));
        soundArray[7] = mySound;
		*/

        }
        
        public function playSound(num:int, loops:Boolean = false):void {
        	/*
        	var numLoops:int = 0;
        	var myVolume:Number = 0.5;

        	if (loops) { numLoops = 99999; myVolume = 1; } // theme plays at full volume
        	
        	soundArray[num].play(0, numLoops, new SoundTransform(myVolume, 0));
        	*/
        }
    }
}