package dk.sunewatts {

   import flash.display.*;

   public class bullet extends MovieClip {
      
      public var xchar:int = new int();
      public var ychar:int = new int();
      public var xMove:int = new int();
      public var yMove:int = new int();
      public var speed:int = new int();
      public var counter:int = new int();
      public var charHeight:int = 5;
      public var charWidth:int = 5;
            
      public var bulletHolder:bulletClip = new bulletClip(); // references movieclip in .fla library

      public function bullet(myNumber:int, myXChar:int, myYChar:int, myXMove:int, myYMove:int, mySpeed:int, myCounter:int) {

	  xchar = myXChar;
	  ychar = myYChar;
	  
	  this.x = xchar;
	  this.y = ychar;
	  
	  xMove = myXMove;
	  yMove = myYMove;
	  
	  speed = mySpeed;
	  
	  counter = myCounter;
	    
	  
  	  bulletHolder.gotoAndStop(myNumber);
      addChild(bulletHolder);

      }
   }
}