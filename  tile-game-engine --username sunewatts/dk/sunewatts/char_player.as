package dk.sunewatts {

    public class char_player extends char { 
        
        public function char_player(myName:String, myEnemyType:String, xx:int, yy:int, xxMove:int=0, yyMove:int=0, mySpeed:int = 5, myLife:int = 1, myCharWidth:int = 10, myCharHeight:int = 10 ) { 
			super(myName, myEnemyType, xx, yy, xxMove, yyMove, mySpeed, myLife, myCharWidth, myCharHeight);
        } 

		//
		// functionality specific to the player: ladders, moving platforms
		//
		
		public function checkItems( ob ):Boolean {
		// tile and items logic, only for hero...
			
		// hit a killer tile?
		var killer:Object = helperClass.returnTileObject( ob.xtile, ob.ytile ); if (killer.special == "killer" && ob.status != "invincible") { loseLife(ob); return(true); }
	
		// save position in case of player death
		var tileBelow:Object = helperClass.returnTileObject( ob.xtile, ob.ytile + 1);
		if ((tileBelow.walkable == false || tileBelow.special == "cloud") && ob.status == "") { gl.v.lastGoodX = ob.xtile; gl.v.lastGoodY = ob.ytile; }
		
		// collected an item?
		var obItem:Object = new Object();
		obItem = gl.v.itemHolder.getChildByName("item_" + ob.xtile + "_" + ob.ytile);
		if (obItem) {
			if (gl.v.myItems[gl.v.thisMap][obItem.myNumber][3]) {
				gl.v.myItems[gl.v.thisMap][obItem.myNumber][3] = false;
				obItem.visible = false;
				gl.v.points += 100;
				helperClass.addEffect( "points100", ob.xchar, ob.ychar, 30);
				// Sound
				gl.v.mySoundHandler.playSound(1);
				// Refresh display						
				gl.v.tt.refreshDisplay();
							
				// met king?
				if (obItem.frame == 5) { gl.v.myCutScene.showCutScene(0); }
				// got panties?
				if (obItem.frame == 6) { trace ("done"); gl.v.myCurrentMap[1][8][15] = 1; }			
				}
			}
			return (true);
		}
		
		public function checkUpLadder( ob ) {
			var upLadder:Boolean = false;
			var downLadder:Boolean = false;
			var upBlock:Boolean = false;
			
			var downY:int = Math.floor((ob.ychar + ob.charHeight-1)/gl.tileH);
			var upY:int = Math.floor(((ob.ychar - ob.charHeight)-ob.speed)/gl.tileW);
						
			var upLadderTest:Object = helperClass.returnTileObject( ob.xtile, upY );
			var downLadderTest:Object = helperClass.returnTileObject( ob.xtile, downY );
			var upBlockTest:Object = helperClass.returnTileObject( ob.xtile, upY );
			
			if (upLadderTest.special == "ladder" ) { upLadder = true; } else { ob.climb = false; }
			if (downLadderTest.special == "ladder" ) { downLadder = true; }
			if (upBlockTest.walkable) { upBlock = true; }
					
			if (upLadder == true || upBlock == true) {
				if (upLadder || downLadder) { return( true ); }
				} else {
				// blocked
				ob.y = ob.ytile * gl.tileH + ob.charHeight;
				updateChar(ob, 0, -1);
				return(false);
			}
		}
				
		public function checkDownLadder( ob ) {
			var downY = Math.floor((ob.speed + ob.ychar + ob.charHeight) / gl.tileH);

			var downLadderTest:Object = helperClass.returnTileObject( ob.xtile, downY );
			if (downLadderTest.special == "ladder") {
			return (true); }
			else { fall (ob); }
		}

		public function climbLadder (ob, diry):Boolean {
			ob.climb=true;
			ob.jump=false;
			ob.ychar += ob.speed * diry;
			ob.xchar = (ob.xtile * gl.tileW) + gl.tileW/2;
			updateChar (ob, 0, diry);
			return (true);
		}

		public function loseLife(ob):void {
			helperClass.addEffect( "cloud01", ob.xchar, ob.ychar, 15);
			gl.v.lives--;
			ob.status = "dead";
			ob.counter = 40;
			ob.thisChar.gotoAndPlay("dead");
			gl.v.tt.refreshDisplay();
			gl.v.mySoundHandler.playSound(5);
			
			// reset player, return to last good position
			ob.jumpspeed = 0;
			ob.addy = 0;
			
			if (!ob.onMovingTile.name) {
				ob.xtile = gl.v.lastGoodX;
				ob.ytile = gl.v.lastGoodY;
				ob.xchar = ob.xtile * gl.tileW;
				ob.ychar = ob.ytile * gl.tileH;
			}
		}		


		      
    }
}