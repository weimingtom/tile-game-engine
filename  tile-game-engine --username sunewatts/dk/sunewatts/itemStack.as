package dk.sunewatts {

   import flash.display.*;

   public class itemStack extends Sprite {

	   public var getItems:Array = new Array();

		   public function itemStack():void {
			
	       }
    
   		   	public function buildItemStack(mapNumber:int):void {
    				
    			// first, clean any old data
    			if (this.numChildren > 0) {
    				for (var ii:int = this.numChildren-1; ii >= 0; ii--) { this.removeChildAt(ii); }	
    			}
  
  				// add items to fresh screen
				//var mapItems:Array = new Array(); // *bug* array isn't cleared between maps
				for (var i:int = 0; i < gl.v.myItems[mapNumber].length; i++) {
					getItems[i] = new item(gl.v.myItems[mapNumber][i][0], gl.v.myItems[mapNumber][i][1], gl.v.myItems[mapNumber][i][2], i) ;
					if (gl.v.myItems[mapNumber][i][3]) { this.addChild (getItems[i]); } // item not yet collected - add it		
				}	
    			
    		}

    }
}