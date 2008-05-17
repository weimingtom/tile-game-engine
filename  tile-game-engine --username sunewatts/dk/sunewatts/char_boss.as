package dk.sunewatts {

    public class char_boss extends char_enemy { 
        
        public function char_boss(isDead:Boolean, myName:String, myEnemyType:String, xx:int, yy:int, xxMove:int=0, yyMove:int=0, mySpeed:int = 5, myLife:int = 1, myJumpPct:int = 0, myCharWidth:int = 10, myCharHeight:int = 10) { 
		
			super(isDead, myName, myEnemyType, xx, yy, xxMove, yyMove, mySpeed, myLife, myJumpPct, myCharWidth, myCharHeight);
        
        } 
        
        //
        // behaviour specific to boss enemies
        //
    
    	public function bossAction( ob:Object ) {
    	
    	if ( ob.name == "blue_boss" ) {
			if ( Math.random() > 0.97 ) {
				//ob.thisChar.gotoAndPlay("shoot");
				helperClass.addBullet(2, ob.xchar-ob.charWidth, ob.ychar + gl.tileW, 0, 1, 10, 50);
			}
		}
    	
    	}
 

 		public override function hurtEnemy(ob:Object, i:int):void {
			ob.thisChar.gotoAndPlay("hit");
			gl.v.points += 100;
			gl.v.tt.showText(gl.v.mapName[gl.v.thisMap], gl.v.points.toString(), gl.v.lives.toString() );
			helperClass.addEffect( "cloud01", ob.xchar, ob.ychar, 30 );
			helperClass.addEffect( "points100", ob.xchar, ob.ychar - 10, 30 );
			
			if (--ob.life == 0) {
				// OK, we killed the boss
				ob.dead = true;
				gl.v.myEnemies[gl.v.thisMap][i][0] = true;
				// show some effects
				helperClass.addEffect( "cloud01", ob.xchar, ob.ychar, 10 );
				helperClass.addEffect( "points5000", ob.xchar, ob.ychar, 120 );
				ob.thisChar.gotoAndPlay("dead");
				// turn on the prize item
				gl.v.myItems[2][0][3] = true;
				// and rebuild item stack so it appears
				gl.v.itemHolder.buildItemStack(2);
			}
		}       
        	
 
    }
}