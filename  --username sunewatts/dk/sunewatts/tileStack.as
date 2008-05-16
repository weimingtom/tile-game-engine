package dk.sunewatts {

   import flash.display.*;

   public class tileStack extends Sprite {

	   public var myTiles:Array = new Array();

	   public var mapWidth:int = new int();
	   public var mapHeight:int = new int();

		   public function tileStack():void {
	       }
    
    	   		public function buildMap(nn:int, ar:Array):void {
    			// trace ("building map");
    				
    			// first, clean any old data
    			if (this.numChildren > 0) {
    				for (var ii:int = this.numChildren-1; ii >= 0; ii--) { this.removeChildAt(ii); }	
    			}
    				
           		mapWidth = ar[0].length;
		    	mapHeight = ar.length;
	   			var count:int = 0;
	   			var doorCount:int = 0;
	   			var myTiles:Array = new Array();
	   			var thisName:String = new String();
				var mySpecial:String = new String();
				var mySpecialInfo:String = new String();
					
				for (var y:int = 0; y < mapHeight; ++y) {
           			for (var x:int = 0; x < mapWidth; ++x) {						
					    	
				    	// place new tile into array
				    	var thisType:int = gl.tileTypes[ar[y][x]][1];
				    	thisName = "tile_" + x + "_" + y;
				    	mySpecial = gl.tileTypes[ar[y][x]][2];
				    	mySpecialInfo = gl.tileTypes[ar[y][x]][3];
					    	
				    	// if tile is a door, add information
				    	if (mySpecial == "door") {
							mySpecialInfo = gl.myDoors[nn][doorCount];
							doorCount++;
				    	}

				    	// jumpblock
				    	if (thisType == 19) {
							mySpecial = "destructible";
				    	}					    	

					    	
   						myTiles[count] = new tile(gl.tileTypes[ar[y][x]][0], thisType, thisName, mySpecial, mySpecialInfo);
						
				     	addChild (myTiles[count]);
     					myTiles[count].x = gl.tileW * x;
     					myTiles[count].y = gl.tileH * y;
           				count++;
     				}
     			}
 			}


    }
}