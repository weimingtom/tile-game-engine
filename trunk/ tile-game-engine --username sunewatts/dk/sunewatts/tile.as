package dk.sunewatts {

   import flash.display.*;

   public class tile extends MovieClip {

      public var walkable:Boolean = new Boolean();
      public var frame:int = new int();
      
      public var special:String = new String();
      public var specialInfo:String = new String();
      
      public var myTile:tileHolder = new tileHolder(); // references movieclip in .fla library

      public function tile(myWalkable:Boolean, frame:int, myName:String, mySpecial:String = "tile", mySpecialInfo:String = "" ) {
      
      this.walkable = myWalkable;
      this.name = myName;
      this.special = mySpecial;
      this.specialInfo = mySpecialInfo;
  	  myTile.gotoAndStop(frame);
      addChild(myTile);

      }
   }
}