package dk.sunewatts {

   import flash.display.*;

   public class effect extends MovieClip {
      
      public var xchar:int = new int();
      public var ychar:int = new int();
      public var counter:int = new int();
            
      public var thisEffectClip:effectsClip = new effectsClip(); // references movieclip in .fla library

      public function effect(myLabel:String, myXChar:int, myYChar:int, myCounter:int) {

	  xchar = myXChar;
	  ychar = myYChar;
	  
	  this.x = xchar;
	  this.y = ychar;
	  
	  counter = myCounter;
	     
  	  thisEffectClip.gotoAndPlay(myLabel);
      addChild(thisEffectClip);

      }
   }
}