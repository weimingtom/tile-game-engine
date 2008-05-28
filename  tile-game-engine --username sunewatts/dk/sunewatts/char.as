package dk.sunewatts {

   import flash.display.*;
   
   public class char extends MovieClip {

      public var thisChar:MovieClip = new MovieClip(); // movie clip from .fla
	  public var helperClass:globalHelperClass = new globalHelperClass();

      public var xchar:int = new int();
      public var ychar:int = new int();
      public var xtile:int = new int();
      public var ytile:int = new int();
      public var charWidth:int = new int();
      public var charHeight:int = new int();
      public var speed:int = new int();
 	  public var jumpstart:int = -22;
 	  public var jumpspeed:int = 0;
      public var lasty:int = new int();
      public var addy:int = new int();
      public var counter:int = 0;
	  public var status:String = "";
	  public var enemyType:String = new String();
	  
 	  public var xMove:int = 1;
 	  public var yMove:int = 0;
 	  public var gravity:int = 2;
 	  public var pushMe:int = 0;
 	  public var jump:Boolean = false;
 	  public var climb:Boolean = false;
 	  public var onSlope:Boolean = false;
      public var lastFacing:String = new String();
 	  public var onMovingTile:Object = new Object();
      
      public var downY:int = new int();
      public var upY:int = new int();
      public var leftX:int = new int();
      public var rightX:int = new int();

      public var upleft:Boolean = new Boolean();
      public var downleft:Boolean = new Boolean();
      public var upright:Boolean = new Boolean();
      public var downright:Boolean = new Boolean();

      public function char(myName:String, myEnemyType:String, xx:int, yy:int, xxMove:int=0, yyMove:int=0, mySpeed:int = 5, myLife:int = 1, myCharWidth:int = 10, myCharHeight:int = 10) {
		
		xtile = xx;
		ytile = yy;
		
		charWidth = myCharWidth;
		charHeight = myCharHeight;
				
		xMove = xxMove;
		yMove = yyMove;
		
		enemyType = myEnemyType;
		
        xchar = (xtile * gl.tileW) + gl.tileW/2;
        ychar = (ytile * gl.tileH) + gl.tileH/2;
	
	    this.x = xchar;
	    this.y = ychar;
	    
	    speed = mySpeed;
		
		this.name = myName;
		
		// add graphics from .fla library: new zak(), new blue() ...
		switch (myName) {

			case "hero" :
			thisChar = new zak();
			break;	

			case "green_jumper" :
			thisChar = new gnuf();
			break;	

			case "bisse" :
			thisChar = new zak();
			break;	

			case "bird" :
			thisChar = new bird();
			break;
			
			case "blue" :
			thisChar = new blue();
			break;	

			case "blue_boss" :
			thisChar = new blue();
			break;	
			
			case "pope" :
			thisChar = new pope();
			break;	

			case "fat_blue" :
			thisChar = new fat_blue();
			break;	

			case "fat_red" :
			thisChar = new fat_red();
			break;	

			case "skully_green" :
			thisChar = new skully_green();
			break;
			
			case "ruth" :
			thisChar = new ruth();
			break;	
				
		}

        addChild(thisChar);
		
		// debug: show character bounding box
		var square:Sprite = new Sprite();
		square.graphics.beginFill(0x00);
		square.graphics.drawRect(-charWidth, -charHeight, charWidth * 2, charHeight * 2);
		square.graphics.endFill();
		square.alpha = .5;
		// addChild(square);


      }

	
    public function moveChar(ob:Object, dirx:int, diry:int, jumpNow:int, getSpeed:int):Boolean {

		ob.lasty = ob.ychar;
		
		// wind, push pads and jumps make us require separate x & y speeds
		var xSpeed:int = new int();
		var ySpeed:int = new int();
		
		var oldPush:int = ob.pushMe;
		
		// reduce momentum
		if (ob.pushMe > 0 ) { ob.pushMe--; }
		if (ob.pushMe < 0 ) { ob.pushMe++; }
		
		
		// jump- & push-pad logic
		var tileBelow:Object = helperClass.returnTileObject( ob.xtile, ob.ytile + 1);
		if (ob.jump == true && jumpNow > 0 && tileBelow.special == "spring") { ob.jump = true; ob.jumpspeed = -24; tileBelow.myTile.gotoAndPlay("spring01"); return(true); }
		if (tileBelow.specialInfo == "pushLeft" && ob.jumpspeed >= 0) { ob.pushMe = -12; }
		if (tileBelow.specialInfo == "pushRight" && ob.jumpspeed >= 0) { ob.pushMe = 12; }
		
		// ySpeed adjustment: jumps
		if (Math.abs(jumpNow) == 1) { ySpeed = ob.jumpspeed * jumpNow; xSpeed = ob.jumpspeed * jumpNow;
		} else { ySpeed = getSpeed; xSpeed = getSpeed; }


		// xSpeed adjustment: wind & push pads
		if (dirx == 0 && ob.pushMe != 0 && ob.jumpspeed >= 0) { (ob.pushMe + gl.v.wind) > 0 ? dirx = 1 : dirx = -1 }
		if (Math.abs(dirx) == 1 && !ob.jump ) { dirx > 0 ? xSpeed += (ob.pushMe + gl.v.wind) : xSpeed -= (ob.pushMe + gl.v.wind); }
		
		
		// just for fun - add a road runner effect after a sizable push pad boost
		if (xSpeed > 4 && Math.abs(ob.pushMe - oldPush) > 10) { helperClass.addEffect( "cloud01", ob.xchar+ob.charHeight, ob.ychar, 15 ); }
		
		
		// up and down
		helperClass.getMyCorners (ob.xchar, ob.ychar + ySpeed * diry, ob);
		if (diry == -1) {
			// going up
			if (ob.upleft && ob.upright) {
				ob.ychar += ySpeed * diry;
				} else {
				ob.ychar = ob.ytile * gl.tileH + ob.charHeight; ob.jumpspeed = 0; // hit tile above - placed right up to tile
		
				// hit a special type tile above?
				var specialBlockTest:Object = helperClass.returnTileObject( ob.xtile, ob.ytile -1 );
				if (specialBlockTest.special == "jumpBlock") { specialBlockTest.myTile.gotoAndPlay("jumpBlock01"); }
				if (specialBlockTest.special == "cannon") { specialBlockTest.myTile.gotoAndPlay("cannon01"); helperClass.addBullet(3, (ob.xtile + .5) * gl.tileW, (ob.ytile-2)*gl.tileH, 0, -1, 10, 30); }
				if (specialBlockTest.special == "destructible") {
					specialBlockTest.myTile.gotoAndPlay("destructible01");
					specialBlockTest.special = "";
					specialBlockTest.walkable = true;
					gl.v.myCurrentMap[gl.v.thisMap][ob.ytile - 1][ob.xtile] = 1; // modifies map - hit tile becomes empty tile for rest of game
				}
			}
		}
		
		if (diry == 1) {
			// going down
			if (ob.downleft && ob.downright && !checkIfOnCloud (ob) && !checkMovingTiles(ob, ySpeed * diry)) {
				ob.ychar += ySpeed * diry;
				} else {
				ob.jump = false;
				if (ob.onMovingTile.name) {
					ob.ychar = ob.onMovingTile.ychar - ob.onMovingTile.charHeight - ob.charHeight;
					} else {
					ob.ychar = (ob.ytile+1) * gl.tileH - ob.charHeight; // placed right down on tile
					// landed animation
					dirx < 0 ? ob.lastFacing = "left" : ob.lastFacing = "right";
					// player dies at lower bottom of map
					if (ob.name == "hero" && ob.ytile >= gl.v.myMap.mapHeight-1) { ob.loseLife( ob ); }
				}
			}
		}

		
		// left and right
		helperClass.getMyCorners (ob.xchar + xSpeed * dirx, ob.ychar, ob);
		if (dirx == -1) {
			if ((ob.downleft && ob.upleft) || ob.onSlope) {
				ob.climb = true;
				ob.xchar += xSpeed * dirx;
				// check for tile below
				if (ob.enemyType != "flyer" ) { fall(ob); }
				} else {
				ob.xchar = ob.xtile * gl.tileW + ob.charWidth; // placed right up to tile
				fall(ob);
			}
		}
		if (dirx == 1) {
			if ((ob.upright && ob.downright) || ob.onSlope) {
				ob.climb = true;
				ob.xchar += xSpeed * dirx;
				// check for tile below
				if (ob.enemyType != "flyer" ) { fall(ob); }
				} else {
				ob.xchar = (ob.xtile+1) * gl.tileW - ob.charWidth; // placed right up to tile
				fall(ob);
			}
		}
				
		// pass new values to character, check for map change
		updateChar (ob, dirx, diry);

		return (true);
	}

	public function updateChar( ob:Object, dirx:int, diry:int):Boolean {
		ob.x = ob.xchar;
		ob.y = ob.ychar;
				
		checkForSlopes( ob, diry, dirx );
			
		ob.xtile = Math.floor(ob.xchar/gl.tileW);
		ob.ytile = Math.floor(ob.ychar/gl.tileH);
		
		var showFrame:String = "";
		
		dirx < 0 ? showFrame = "left" : showFrame = "right";
		
		if (ob.name == "hero") {
			// player specific
			if (ob.jump && diry < 0) { dirx < 0 ? showFrame = "upLeft" : showFrame = "upRight"; }
			if (ob.jump && diry > 0) { dirx < 0 ? showFrame = "downLeft" : showFrame = "downRight"; }
			if (ob.climb) { showFrame = "climb"; }
			// has player stepped on a door?
			var queryTile:Object = helperClass.returnTileObject( ob.xtile, ob.ytile );
			if (queryTile.special == "door" ) { helperClass.changeMap ( ob, queryTile.specialInfo ); }
		}
		
		// only refresh if state has changed, otherwise animation doesn't cycle	
		if (showFrame != ob.lastFacing) {
			ob.thisChar.gotoAndStop(showFrame);
		}
		ob.lastFacing = showFrame;
				
		return (true);
	}
				
 
	function checkIfOnCloud (ob:Object):Boolean {
					
		var leftcloud:Boolean = false;
		var rightcloud:Boolean = false;
					
		var leftCloudTest:Object = helperClass.returnTileObject( ob.leftX, ob.downY );
		var rightCloudTest:Object = helperClass.returnTileObject( ob.rightX, ob.downY );
					
		if (leftCloudTest.special == "cloud" ) { leftcloud = true; }
		if (rightCloudTest.special == "cloud" ) { rightcloud = true; }
					
		if ((leftcloud || rightcloud) && ob.ytile != ob.downY){
		return(true);
		} else {
		return(false);
		}
					
	}

	public function checkMovingTiles(ob:Object, yOffset:int):* {
		// no monsters on moving platforms:
		//if (ob.name != "hero") { return (false); }
			
		if (ob.jumpspeed >= 0) {
			// if (1 == 1) {
				var heroYMax:int = ob.ychar + ob.charHeight + yOffset;
				var heroXMax:int = ob.xchar + ob.charWidth;
				var heroXMin:int = ob.xchar - ob.charWidth;
				var foundIt:Boolean = false;
				
				for (var i:int = 0; i < gl.v.myMovingTiles[gl.v.thisMap].length; i++) {
					var thisMovingTile:Object = gl.v.movingTileHolder.getChildByName( "movingTile" + i.toString() );
					var tileYMax:int = thisMovingTile.ychar + thisMovingTile.charHeight;
					var tileYMin:int = thisMovingTile.ychar - thisMovingTile.charHeight;
					var tileXMax:int = thisMovingTile.xchar + thisMovingTile.charWidth;
					var tileXMin:int = thisMovingTile.xchar - thisMovingTile.charWidth;
					
					//player was last above moving tile
					if (ob.lasty <= tileYMin) {
						//if players bottom point is in the moving tile
						if (heroYMax <= tileYMax && heroYMax >= tileYMin) {
							//and player has one corner on moving tile
							if (heroXMax > tileXMin && heroXMax < tileXMax ) {
								ob.onMovingTile = thisMovingTile;
								foundIt = true;
								break;
								} else if (heroXMin > tileXMin && heroXMin < tileXMax) {
								ob.onMovingTile = thisMovingTile;
								foundIt = true;
								break;
							}
						}
					}
				}
			return(foundIt); 
			}
		} 


	function checkForSlopes (ob:Object, diry:int, dirx:int):void {
		var direction:String;
		// is tile below us a slope?
		var checkSlopeUnder:Object = helperClass.returnTileObject(ob.xtile, ob.ytile+1);
		if ( checkSlopeUnder.special == "slope" && !ob.jump ) {
			ob.ytile += 1;
			ob.ychar += gl.tileH;
		}
		// are we standing on a slope?
		// we are not jumping up
		var checkSlope:Object = helperClass.returnTileObject(ob.xtile, ob.ytile);
		if (checkSlope.special == "slope" && diry != -1) {
			if (diry == 1) {
				ob.ychar = (ob.ytile+1) * gl.tileH - ob.charHeight;
			}
			// find position relative to current tile
			var xPos:int = ob.xchar - ob.xtile * gl.tileW;
			if (checkSlope.special == "slope") { ob.onSlope = true; };
			ob.jump = false;
			
			if (checkSlope.specialInfo == "up") {
				ob.addy = xPos;
				ob.y = (ob.ytile + 1) * gl.tileH - ob.charHeight - ob.addy;
				} else {
				ob.addy = gl.tileW - xPos;
				ob.y = (ob.ytile + 1) * gl.tileH - ob.charHeight - ob.addy;
			}
			} else {
			// we were on slope, but now we left
			// update y and ytile
			if ((ob.addy >= gl.tileW-1 && dirx == 1) || (ob.addy >= gl.tileW-1 && dirx == -1)) {
				ob.ychar -= gl.tileH;
				ob.addy = 0;
				ob.x = ob.xchar;
				ob.y = ob.ychar;
			}
			ob.onSlope = false;
		}
	}


		public function doJump(ob:Object):Boolean {
			ob.jumpspeed = ob.jumpspeed + ob.gravity;
			// limit jumpspeed to avoid going through solid tiles
			if (ob.jumpspeed > gl.tileH / 2 - 1) { ob.jumpspeed = gl.tileH / 2 - 1; }
			if (ob.jumpspeed<0) { moveChar(ob, 0, -1, -1, ob.speed);
		} else if (ob.jumpspeed>0) { moveChar(ob, 0, 1, 1, ob.speed); }
			return (true);
		}

				

		public function fall(ob:Object):void {
					
			ob.climb = false;
			//check if we have walked off the tile and should fall down
			//not while jumping
			if (!ob.jump) {
				// TODO fix for characters taller than 2 tile heights
				helperClass.getMyCorners(ob.x, ob.y+1, ob);
				//both tile below are empty
				if (ob.downleft && ob.downright && !checkIfOnCloud (ob)) {
					//falling down
					ob.jumpspeed = 0;
					ob.jump = true;
				}
			}
		}



				

   }
}