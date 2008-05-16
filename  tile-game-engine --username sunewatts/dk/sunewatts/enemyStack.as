package dk.sunewatts {

   import flash.display.*;

   public class enemyStack extends MovieClip {

	   public var myEnemies:Array = new Array();

		   public function enemyStack():void {
			
	       }
    
   		   	public function buildStack(mapNumber:int):void {
    				
    			// first, clean any old data
    			if (this.numChildren > 0) {
    				for (var ii:int = this.numChildren-1; ii >= 0; ii--) { this.removeChildAt(ii); }	
    			}
  
  				// add enemies to fresh screen
				var mapEnemies:Array = new Array();
				mapEnemies = gl.v.myEnemies[mapNumber];
				for (var i:int = 0; i < mapEnemies.length; i++) {

					var myCharWidth:int = 10;
					var myCharHeight:int = 16;
					
					if (mapEnemies[i][1] == "blue") { myCharWidth = 22; myCharHeight = 31; }
					if (mapEnemies[i][1] == "ruth") { myCharWidth = 31; myCharHeight = 31; }
					if (mapEnemies[i][1] == "pope") { myCharWidth = 11; myCharHeight = 16; }
					if (mapEnemies[i][1] == "fat_blue") { myCharWidth = 11; myCharHeight = 19; }
					if (mapEnemies[i][1] == "fat_red") { myCharWidth = 11; myCharHeight = 19; }
					
					if ( mapEnemies[i][1] != "ruth" ) {
						myEnemies[i] = new char_enemy(mapEnemies[i][0], mapEnemies[i][1], mapEnemies[i][2], mapEnemies[i][3], mapEnemies[i][4], mapEnemies[i][5], mapEnemies[i][6], mapEnemies[i][7], mapEnemies[i][8], mapEnemies[i][9], myCharWidth, myCharHeight) ;
					} else {
						myEnemies[i] = new char_boss(mapEnemies[i][0], mapEnemies[i][1], mapEnemies[i][2], mapEnemies[i][3], mapEnemies[i][4], mapEnemies[i][5], mapEnemies[i][6], mapEnemies[i][7], mapEnemies[i][8], mapEnemies[i][9], myCharWidth, myCharHeight) ;
					}
					
					if (!mapEnemies[i][0]) { this.addChild (myEnemies[i]); }; // not dead - add enemy to stage		
				}
    			}

    }
}