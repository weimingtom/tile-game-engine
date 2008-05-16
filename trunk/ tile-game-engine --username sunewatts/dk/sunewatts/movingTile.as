package dk.sunewatts {

   import flash.display.*;

   public class movingTile extends MovieClip {

      public var speed:int = new int();
      public var dirX:int = new int();
      public var dirY:int = new int();
      public var minX:int = new int();
      public var maxX:int = new int();
      public var minY:int = new int();
      public var maxY:int = new int();
      
      public var xchar:int = new int();
      public var ychar:int = new int();

      public var charHeight:int = new int();
      public var charWidth:int = new int();

      public var downY:int = new int();
      public var upY:int = new int();
      public var leftX:int = new int();
      public var rightX:int = new int();

      public var upleft:Boolean = new Boolean();
      public var downleft:Boolean = new Boolean();
      public var upright:Boolean = new Boolean();
      public var downright:Boolean = new Boolean();
      
      public var xtile:int = new int();
      public var ytile:int = new int();      
      
      public var movingTileHolder:movingTileClip = new movingTileClip(); // references movieclip in .fla library

      public function movingTile(myNumber:int, myFrame:int, myXTile:int, myYTile:int, mySpeed:int, myDirX:int, myDirY:int, myWidth:int = 16, myHeight:int = 16) {

	  charWidth = myWidth;
	  charHeight = myHeight;
	  
	  xchar = gl.tileH * myXTile + charWidth;
	  ychar = gl.tileH * myYTile + charHeight;

	  speed = mySpeed;
	  dirX = myDirX;
	  dirY = myDirY;
/*	  minX = myMinX;
	  maxX = myMaxX;
	  minY = myMinY;
	  maxY = myMaxY;
*/	  
	  this.name = "movingTile" + myNumber.toString();
	  
  	  movingTileHolder.gotoAndStop(myFrame);
      addChild(movingTileHolder);

      }
   }
}