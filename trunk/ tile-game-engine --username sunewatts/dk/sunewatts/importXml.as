package dk.sunewatts {

   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.xml.*;

   public class importXml extends Sprite {
   public var xmlLoader:URLLoader = new URLLoader();
   public var externalArray:Array = new Array();
   public var heroX:int = 0;
   public var heroY:int = 0;
   public var doRefresh:String = "";
   public var mapOut:String = "";
   public var itemOut:String = "";
   public var movingTileOut:String = "";
   public var enemyOut:String = "";
   public var playerOut:String = "";
         
        public function importXml(myMap:String)
        {
			
			//var xmlData:XML = new XML();
			//xmlLoader.addEventListener(Event.COMPLETE, parseXML);
			//xmlLoader.load(new URLRequest(myMap));
			//xmlLoader.load(new URLRequest("../../Maps/map01.tmx"));
        }

        public function loadFile(myMap:String)
        {
			
			var xmlData:XML = new XML();
			xmlLoader.addEventListener(Event.COMPLETE, parseXML);
			xmlLoader.load(new URLRequest(myMap));
			//xmlLoader.load(new URLRequest("../../Maps/map01.tmx"));
        }

		public function parseXML(e:Event):void {
			var xmlData:XML = new XML(e.target.data);
			var myText:String = "";
			var myDimensions:XMLList = xmlData.layer.attributes();
			var myWidth:int = myDimensions[1].valueOf();
			var myHeight:int = myDimensions[2].valueOf();
			var thisWidth:int = 0;
			var thisHeight:int = 0;
			var thisTile:int = 0;
			var thisArray:Array = new Array();
			var singleRow:Array = new Array();
			var tileData:XMLList = xmlData.layer.data.tile.attributes();

			mapOut = "myRoom[*] = [\n[";
			enemyOut = "myEnemies[*] = [ ";
			itemOut = "myItems[*] = [ ";
			movingTileOut = "myMovingTiles[*] = [ ";

			for each (var tileOut:XML in tileData) {

				if (tileOut.name() == "gid") {
					thisTile = tileOut.valueOf();
					singleRow.push(tileOut.valueOf());
					if (thisTile < 10) { myText += "0"; }
					mapOut += thisTile;
					thisWidth++;
					if (thisWidth < myWidth) { mapOut += ", "; }
					if (thisWidth == myWidth ) { ++thisHeight;
					thisArray.push(singleRow);
					singleRow = new Array();
					if (thisHeight < myHeight) { mapOut += "],\n["; thisWidth = 0; } else { mapOut += "]\n]"; break; } }
				}
			}
			externalArray = thisArray;
		
			gl.v.myCurrentMap[0] = externalArray;
			gl.v.myEnemies[0] = new Array();
			gl.v.myItems[0] = new Array();
			gl.v.myMovingTiles[0] = new Array();

			
			// add monsters and moving platforms
			var mapWidth:int = externalArray[0].length;
		    var mapHeight:int = externalArray.length;
		    var myItem:int = 0;
			var thisEnemy:Array = new Array();
			var thisMovingTile:Array = new Array();
		    heroX = 0;
		    heroY = 0;
		    
			for (var y:int = 0; y < mapHeight; ++y) {
           			for (var x:int = 0; x < mapWidth; ++x) {
           				myItem = externalArray[y][x];
           				
           			    switch (myItem) {

	            		case 95 :
	            		// player start
	            		heroX = x;
	            		heroY = y;
	            		playerOut = "0_" + x + "_" + y;
	            		break;		            		
			    		
			    		case 96 :
	            		// coin
	            		var thisItem:Array = new Array(4,x,y, true);	            			
	            		gl.v.myItems[0].push(thisItem);
	            		itemOut += " [ " + thisItem + " ],";
			    		break;			    
           			               			    	
	            		case 97 :
	            		// horizontal monster - walk or fly
	            		if (externalArray[y+1][x]) { if (gl.tileTypes[externalArray[y+1][x]][0] && gl.tileTypes[externalArray[y+1][x]][2] != "cloud") {
	            			thisEnemy = new Array(false, "bird", "flyer", x, y, 1,0,4,1);
	            		} else {
	            		if (Math.random() >.5) { thisEnemy = new Array(false, "fat_red", "walker", x, y, 1,0,4,3,3);	} else { thisEnemy = new Array(false, "fat_blue", "walker", x, y, 1,0,6,1,3); }          			
	            		}
	            		}
	            		gl.v.myEnemies[0].push(thisEnemy);
	            		enemyOut += " [ " + thisEnemy + " ],";
			    		break;

	            		case 98 :
	            		// vertical monster
	            		thisEnemy = new Array(false, "bisse", "flyer", x, y, 0,1,4,1);	            			
	            		gl.v.myEnemies[0].push(thisEnemy);
	            		enemyOut += " [ " + thisEnemy + " ],";
			    		break;			    

	            		case 99 :
	            		// horizontal platform
	            		thisMovingTile = new Array( 2, x, y, 2, 1, 0, 16, 8 );	            			
	            		gl.v.myMovingTiles[0].push(thisMovingTile);
	            		movingTileOut += " [ " + thisMovingTile + " ]";
			    		break;
			    		
	            		case 100:
	            		// vertical platform
	            		thisMovingTile = new Array( 2, x, y, 4, 0, 1, 16, 8 );	            			
	            		movingTileOut += " [ " + thisMovingTile + " ],";
	            		gl.v.myMovingTiles[0].push(thisMovingTile);
			    		break;				    					    

           			    }
           			}
	       				
   			}
   			trace (playerOut);
			trace (mapOut + " ]");
			trace (enemyOut + " ]");
			trace (itemOut + " ]");
			trace (movingTileOut + " ]");
			
			dispatchEvent(new Event(doRefresh));
    
		}


   }
}