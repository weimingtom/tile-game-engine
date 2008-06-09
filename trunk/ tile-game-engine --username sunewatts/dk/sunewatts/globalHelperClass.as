package dk.sunewatts {

	import flash.geom.Rectangle;
	
	public class globalHelperClass {
		
		public function globalHelperClass () {
			// functions used by many classes
		}

		public function getMyCorners(x:int, y:int, ob:Object):void {
			ob.downY = Math.floor(y + ob.charHeight-1)/gl.tileH;
			ob.upY = Math.floor(y - ob.charHeight)/gl.tileH;
			ob.leftX = Math.floor(x - ob.charWidth)/gl.tileW;
			ob.rightX = Math.floor(x + ob.charWidth-1)/gl.tileW;
					
			// check if there are walls
			var upLeftType:Object = returnTileObject( ob.leftX, ob.upY);
			var downLeftType:Object = returnTileObject( ob.leftX, ob.downY);
			var upRightType:Object = returnTileObject( ob.rightX, ob.upY );
			var downRightType:Object = returnTileObject( ob.rightX, ob.downY );
					
			ob.upleft = upLeftType.walkable;
			ob.downleft = downLeftType.walkable;
			ob.upright = upRightType.walkable;
			ob.downright = downRightType.walkable;
		}
		
		public function returnTileObject( x:int, y:int ) {
			var tileObject:Object = new Object();
			if ( y < gl.v.myMap.mapHeight && y >= 0 && x < gl.v.myMap.mapWidth && x >= 0) {
				tileObject = gl.v.myMap.getChildAt(  y * gl.v.myMap.mapWidth + x );
				// var tileObject:Object = globals.vars.myMap.getChildByName( "tile_" + x + "_" + y ); // <- the same as above, but slower!
			}
			
			if (!tileObject.name) { tileObject = new tile(false, 1, "" ); } // return a solid block if outside map
			
			return(tileObject);
		}
		
		public function addEffect(label:String, xx:int, yy:int, duration:int):void {
					var ii:int = gl.v.myEffectStack.length;
					gl.v.myEffectStack.push(new effect ( label, xx, yy, duration ));
					gl.v.myEffectHolder.addChild(gl.v.myEffectStack[ii]);
				}
								
		public function addBullet(myNumber:int, xx:int, yy:int, xmove:int, ymove:int, mySpeed:int, duration:int):void {
					var ii:int = gl.v.myBulletStack.length;
					gl.v.myBulletStack.push(new bullet ( myNumber, xx, yy, xmove, ymove, mySpeed, duration ));
					gl.v.myBulletHolder.addChild(gl.v.myBulletStack[ii]);
		}

		public function changeMap( ob, splitMe:String ):void {
					
					var ar:Array = splitMe.split("_");
					
					gl.v.thisMap = ar[0];
					
					gl.v.lastGoodX = ob.xtile = ar[1];
					gl.v.lastGoodY = ob.ytile = ar[2];
					
					ob.xchar = ob.xtile * gl.tileW + ob.charWidth;
					ob.ychar = (ob.ytile+1) * gl.tileH - ob.charHeight;
					
					ob.x = ob.xchar;
					ob.y = ob.ychar;
					
					ob.jumpspeed = 0;
					ob.jump = true;
					
					trace ("To this: " + gl.v.thisMap + " : " + ar[1] + ", " + ar[2]);
										
					gl.v.myMap.buildMap(gl.v.thisMap, gl.v.myCurrentMap[gl.v.thisMap]);
										
					gl.v.myMap.cacheAsBitmap = true;
					
					gl.v.tt.refreshDisplay();
					
					gl.v.enemyHolder.buildStack(gl.v.thisMap);
					gl.v.itemHolder.buildItemStack(gl.v.thisMap);
					gl.v.movingTileHolder.buildMovingTileStack(gl.v.thisMap);
					
					// kill any bullets and effects from old screen
					for (var ii:int = 0; ii < gl.v.myBulletStack.length; ii++ )  {
						gl.v.myBulletStack[ii].counter = 1;
					}
					for (var nn:int = 0; nn < gl.v.myEffectStack.length; nn++ )  {
						gl.v.myEffectStack[nn].counter = 1;
					}
											
					gl.v.myBackgroundHolder.buildBackground(gl.v.thisMap % 3 + 2);
					
					gl.v.stageHolder.x = 0;
					gl.v.stageHolder.y = 0;
					
					scrollStage(ob, true);
					
				}

		public function isColliding(x1:int, y1:int, width1:int, height1:int, x2:int, y2:int, width2:int, height2:int):Boolean {
			var rect1:Rectangle = new Rectangle(x1, y1, width1, height1);
			var rect2:Rectangle = new Rectangle(x2, y2, width2, height2);
			var isIntersecting:Boolean=rect1.intersects(rect2);
			return (isIntersecting);
		}
		
		public function scrollStage(ob:Object, forceRefresh:Boolean = false):Boolean {
			if (ob.counter > 0 && ob.status == "dead") { return(false); }
			var trueY:int = ob.ychar - ob.addy; // respects the modifier when on a slope
			if (ob.xchar > gl.canvasW / 2 && ob.xchar < (gl.v.myMap.mapWidth * gl.tileW - (gl.canvasW / 2))) { 	gl.v.stageHolder.x = - ob.xchar + gl.canvasW/2; }
			if (trueY > gl.canvasH / 2 && trueY < (gl.v.myMap.mapHeight * gl.tileH - (gl.canvasH / 2))) { gl.v.stageHolder.y =  - trueY + gl.canvasH/2; }
			
			if (forceRefresh) {
				var thisX:int = - ob.xchar + gl.canvasW/2;
				var thisY:int = - ob.ychar + gl.canvasH/2;
				// consider edge-of-map cases, where the stage stops scrolling at canvas edge
				if (ob.xchar > gl.v.myMap.mapWidth * gl.tileW - (gl.canvasW / 2)) { thisX = -gl.v.myMap.mapWidth * gl.tileW + (gl.canvasW); }
				if (ob.xchar < gl.canvasW / 2) { thisX = 0; }
				if (ob.ychar > gl.v.myMap.mapHeight * gl.tileH - (gl.canvasH / 2)) { thisY = -gl.v.myMap.mapHeight * gl.tileH + (gl.canvasH); }
				if (ob.ychar < gl.canvasH / 2) { thisY = 0; }
				// refresh
				gl.v.stageHolder.x = thisX;
				gl.v.stageHolder.y = thisY;		
			}
			
			// scroll background
			gl.v.myBackgroundHolder.x = (gl.v.stageHolder.x % gl.v.myBackgroundHolder.width) / 2; // nice tiling code - scrolls at 50% fg rate	
			return (true);
		}
	
	}

}