package dk.sunewatts {

    public class char_enemy extends char { 
 
	  public var life:int = new int();
	  public var jumpPct:Number = new Number();
	  public var dead:Boolean = false;
	          
        public function char_enemy(isDead:Boolean, myName:String, myEnemyType:String, xx:int, yy:int, xxMove:int=0, yyMove:int=0, mySpeed:int = 5, myLife:int = 1, myJumpPct:int = 1, myCharWidth:int = 10, myCharHeight:int = 10) { 
		
		super(myName, myEnemyType, xx, yy, xxMove, yyMove, mySpeed, myLife, myCharWidth, myCharHeight);
		life = myLife;
		dead = isDead;
        jumpPct = 1 - myJumpPct / 100;
        
        } 
        
        	//
        	// functions specific to enemies
        	//
        	
        	public function enemyLogic ( ob:Object , i:int) {
					
			var doTurn:Boolean = true; // reverse direction?
			var newX:int = ob.xchar + ob.speed * ob.xMove;
			var newY:int = ob.ychar + ob.speed * ob.yMove;

			if (!ob.jump) {

				switch (ob.enemyType) {
							
					case "walker" :
					// left-right walker - walks on ground, platforms and slopes
					var groundTest:Object = helperClass.returnTileObject(Math.floor(newX / gl.tileW), ob.ytile+1 );
					
					// test for one lower corner on solid tile, the other in free air - will force jump to avoid flaky behaviour
					var groundTestLeftFoot:Object = helperClass.returnTileObject(Math.floor((newX - ob.charWidth) / gl.tileW), ob.ytile+1 );
					var groundTestRightFoot:Object = helperClass.returnTileObject(Math.floor((newX + ob.charWidth) / gl.tileW), ob.ytile+1 );
					var leftWalkable:Boolean = false;
					var rightWalkable:Boolean = false;
					
					if (!groundTestLeftFoot.walkable || groundTestLeftFoot.special == "cloud" || groundTestLeftFoot.special == "slope") { leftWalkable = true }
					if (!groundTestRightFoot.walkable || groundTestRightFoot.special == "cloud" || groundTestRightFoot.special == "slope") { rightWalkable = true }
					
					if (!groundTest.walkable || groundTest.special == "cloud" || groundTest.special == "slope") { doTurn = false; }
					// check for barrier in direction of travel
					helperClass.getMyCorners (newX, newY, ob);
					if ((!ob.upleft || !ob.upright || !ob.downleft || !ob.downright)) { doTurn = true; }
					if (ob.onSlope) { doTurn = false; }
					if (Math.random() > ob.jumpPct || leftWalkable != rightWalkable) { ob.jump = true; ob.jumpspeed = ob.jumpstart; ob.onMovingTile = new Object(); }
					// does not turn when accelerated by a push pad
					if ((ob.pushMe > 0 && ob.xMove > 0) || (ob.pushMe < 0 && ob.xMove < 0)) { doTurn = false; }
					// does not turn when on a moving tile
					if (ob.onMovingTile.name) { doTurn = false; }
					break;
							
					case "flyer" :
					doTurn = false;
					// check for barrier in direction of travel
					helperClass.getMyCorners (newX, newY, ob);
					if (ob.xMove != 0) { if ((!ob.downleft || !ob.downright)) { doTurn = true; }}
					if (ob.yMove != 0) { if ((!ob.downleft || !ob.upright)) { doTurn = true; }}
							
					// check for cloud in direction of travel
					var directionTest:Object = helperClass.returnTileObject( Math.floor(newX / gl.tileH), Math.floor(newY / gl.tileH) );
					if (directionTest.special == "cloud") { doTurn = true; }
					break;
							
				}
						
				// check for outside of map
				if (newX < gl.tileW || newX > (gl.v.myMap.mapWidth-1) * gl.tileW) { doTurn = true; }
				if (newY < gl.tileH || newY > gl.v.myMap.mapHeight * gl.tileH) { doTurn = true; }
				
						
				if (doTurn) {
					ob.xMove = -ob.xMove;
					ob.yMove = -ob.yMove;
				}
						
			}
					
			// move
			if (!ob.onMovingTile.name) {
				moveChar(ob, ob.xMove, ob.yMove, 0, ob.speed);
			}
				
			// jump?
			if ( ob.jump ) { doJump(ob) };

								
		}
				
		public function hurtEnemy(ob:Object, i:int):void {
			ob.thisChar.gotoAndPlay("hit");
			gl.v.points += 100;
			gl.v.tt.showText(gl.v.mapName[gl.v.thisMap], gl.v.points.toString(), gl.v.lives.toString() );
			helperClass.addEffect( "impact01", ob.xchar, ob.ychar, 30 );
			gl.v.mySoundHandler.playSound(3);
			if (--ob.life == 0) {
				ob.dead = true;
				gl.v.myEnemies[gl.v.thisMap][i][0] = true;
				helperClass.addEffect( "cloud01", ob.xchar, ob.ychar, 10 );
				helperClass.addEffect( "points100", ob.xchar, ob.ychar, 30 );
				ob.thisChar.gotoAndPlay("dead");
			}
		}
    }
}