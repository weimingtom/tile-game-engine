package dk.sunewatts {

   import flash.display.*;

   public class item extends MovieClip {

      public var frame:int = new int();
      public var xchar:int = new int();
      public var ychar:int = new int();
      public var xtile:int = new int();
      public var ytile:int = new int();
      
      public var myNumber:int = new int();

      private var myItems:itemHolder = new itemHolder(); // references movieclip in .fla library

      public function item(myFrame:int, xx:int, yy:int, addMyNumber:int) {

		xtile = xx;
		ytile = yy;
		
		myNumber = addMyNumber;
		
		this.name = "item_" + xtile + "_" + ytile;
		
        xchar = (xtile * gl.tileW) + gl.tileW/2;
        ychar = (ytile * gl.tileH) + gl.tileH/2;
	
	    this.x = xchar;
	    this.y = ychar;
      	frame = myFrame;
      
  	  	myItems.gotoAndStop(frame);
      	addChild(myItems);

      }
   }
}