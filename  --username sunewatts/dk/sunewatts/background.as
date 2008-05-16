package dk.sunewatts {

   import flash.display.*;

   public class background extends MovieClip {

      private var myBackground01:backgroundHolder = new backgroundHolder(); // references movieclip in .fla library
      private var myBackground02:backgroundHolder = new backgroundHolder(); 
      
      public function background(myNumber:int) {
      }
   	  public function buildBackground(myNumber:int):void {
      	// first, clean any old data
    	if (this.numChildren > 0) {
    		for (var ii:int = this.numChildren-1; ii >= 0; ii--) { this.removeChildAt(ii); }	
    	}
    	
    	myBackground01.gotoAndStop(myNumber);
  	  	myBackground02.gotoAndStop(myNumber);
  	  	
  	  	myBackground02.x = myBackground01.width;
  	  	
      	addChild(myBackground01);
      	addChild(myBackground02);
      	
      	this.scaleX = 2;
      	this.scaleY = 2;      
      }
   }
}