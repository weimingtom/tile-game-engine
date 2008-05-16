package dk.sunewatts {

   import flash.display.*;

   public class movingTileStack extends Sprite {

	   public var getTile:Array = new Array();

		   public function movingTileStack() {
			
	       }
    
   		   	public function buildMovingTileStack(mapNumber:int):void {
    				
    			// first, clean any old data
    			if (this.numChildren > 0) {
    				for (var ii:int = this.numChildren-1; ii >= 0; ii--) { this.removeChildAt(ii); }	
    			}
  
  				// add moving tiles to fresh screen
				for (var i:int = 0; i < gl.v.myMovingTiles[mapNumber].length; i++) {
					getTile[i] = new movingTile( i,
												 gl.v.myMovingTiles[mapNumber][i][0],
												 gl.v.myMovingTiles[mapNumber][i][1],
												 gl.v.myMovingTiles[mapNumber][i][2],
												 gl.v.myMovingTiles[mapNumber][i][3],
												 gl.v.myMovingTiles[mapNumber][i][4],
												 gl.v.myMovingTiles[mapNumber][i][5],
												 gl.v.myMovingTiles[mapNumber][i][6],
												 gl.v.myMovingTiles[mapNumber][i][7]
												 ); 
					getTile[i].name = "movingTile" + i.toString();
				this.addChild (getTile[i]);		
				}	
    			
    		}

    }
}