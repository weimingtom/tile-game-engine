package dk.sunewatts {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	

    public class gl extends MovieClip {
        public static var tileW:int = 32;
        public static var tileH:int = 32;

        public static var canvasW:int = 448;
        public static var canvasH:int = 352;

        // tile types
        public static var tileTypes:Array = new Array();
        tileTypes[1] = [true, 0, "", ""];
        tileTypes[1] = [true, 1, "", ""];
        tileTypes[2] = [false, 2, "", ""];
        tileTypes[3] = [true, 3, "spring", ""];
        tileTypes[4] = [true, 4, "cloud", ""];
        tileTypes[5] = [true, 5, "cloud", ""];
        tileTypes[6] = [true, 6, "cloud", ""];
        tileTypes[7] = [true, 7, "door", ""];
        tileTypes[8] = [false, 8, "", ""];
        tileTypes[9] = [true, 9, "ladder", ""];
        tileTypes[10] = [false, 10, "ladder", ""];
        tileTypes[11]= [false, 11, "", ""];
        tileTypes[12]= [false, 12, "", ""];
        tileTypes[13]= [false, 13, "", ""];
        tileTypes[14]= [false, 14, "", ""];
        tileTypes[15]= [false, 15, "", ""];
        tileTypes[16]= [false, 16, "", ""];
        tileTypes[17]= [false, 17, "", ""]; 
        tileTypes[18]= [false, 18, "jumpBlock", ""];
        tileTypes[19]= [true, 19, "", ""];
        tileTypes[20]= [false, 20, "destructible", ""];
        tileTypes[21]= [false, 21, "", ""];
        tileTypes[22]= [true, 22, "slope", "up"];
        tileTypes[23]= [true, 23, "slope", "down"];
        tileTypes[24]= [true, 24, "", ""];
        tileTypes[25]= [true, 25, "", ""];
        tileTypes[26]= [true, 26, "", ""];
        tileTypes[27]= [true, 27, "", ""];
        tileTypes[28]= [true, 28, "slope", "down"];
        tileTypes[29]= [true, 29, "slope", "up"];
        tileTypes[30]= [true, 30, "", ""];
        tileTypes[31]= [true, 31, "", ""];
        tileTypes[32]= [true, 32, "", ""];
        tileTypes[33]= [true, 33, "killer", ""];
        tileTypes[34]= [false, 34, "", ""];
        tileTypes[35]= [false, 35, "", ""];
        tileTypes[36]= [false, 36, "", ""];
        tileTypes[37]= [false, 37, "", ""];
        tileTypes[38]= [false, 38, "", ""];
        tileTypes[39]= [false, 39, "", ""];
        tileTypes[40]= [false, 40, "", ""];
        tileTypes[41]= [false, 41, "", ""];
        tileTypes[42]= [false, 42, "", ""];
        tileTypes[43]= [false, 43, "", ""];
        tileTypes[44]= [false, 44, "", ""];
        tileTypes[45]= [false, 45, "", ""];
        tileTypes[46]= [true, 46, "slope", "up"];
        tileTypes[47]= [true, 47, "slope", "down"];
        tileTypes[48]= [false, 48, "cannon", ""];
        tileTypes[49]= [true, 49, "door", ""]; // empty tile doorway
        tileTypes[50]= [true, 50, "cloud", "pushLeft"];
        tileTypes[51]= [true, 51, "cloud", "pushRight"];
        tileTypes[52]= [true, 52, "", ""];
        tileTypes[53]= [true, 53, "", ""];
        tileTypes[54]= [true, 54, "", ""];
        tileTypes[55]= [true, 55, "", ""];
        tileTypes[56]= [true, 56, "", ""];
        tileTypes[57]= [true, 57, "", ""];
        tileTypes[58]= [true, 58, "", ""];
        tileTypes[59]= [true, 59, "", ""];
        tileTypes[60]= [true, 60, "", ""];
        tileTypes[61]= [true, 61, "", ""];
        tileTypes[62]= [true, 62, "", ""];
        tileTypes[63]= [true, 63, "", ""];
        tileTypes[64]= [true, 64, "", ""];
        tileTypes[65]= [true, 65, "", ""];
        tileTypes[66]= [true, 66, "", ""];
        tileTypes[67]= [true, 67, "", ""];
        tileTypes[68]= [true, 68, "", ""];
        tileTypes[69]= [true, 69, "", ""];
        tileTypes[70]= [true, 70, "", ""];
        tileTypes[71]= [true, 71, "", ""];
        tileTypes[72]= [true, 72, "", ""];
        tileTypes[73]= [true, 73, "", ""];
        tileTypes[74]= [true, 74, "", ""];
        tileTypes[75]= [true, 75, "", ""];
        tileTypes[76]= [true, 76, "", ""];
        tileTypes[77]= [true, 77, "", ""];
        tileTypes[78]= [true, 78, "", ""];
        tileTypes[79]= [true, 79, "", ""];
        tileTypes[80]= [true, 80, "", ""];
        tileTypes[81]= [true, 81, "", ""];
        tileTypes[82]= [true, 82, "", ""];
        tileTypes[83]= [true, 83, "", ""];
        tileTypes[84]= [true, 84, "", ""];
        tileTypes[85]= [true, 85, "", ""];
        tileTypes[86]= [true, 86, "", ""];
        tileTypes[87]= [true, 87, "", ""];
        tileTypes[88]= [true, 88, "", ""];
        tileTypes[89]= [true, 89, "", ""];
        tileTypes[90]= [true, 90, "", ""];
        tileTypes[91]= [true, 91, "", ""];
        tileTypes[92]= [true, 92, "", ""];
        tileTypes[93]= [true, 93, "", ""];
        tileTypes[94]= [true, 94, "", ""];
        tileTypes[95]= [true, 95, "", ""];
        tileTypes[96]= [true, 96, "", ""];
        tileTypes[97]= [true, 97, "", ""];
        tileTypes[98]= [true, 98, "", ""];
        tileTypes[99]= [true, 99, "", ""];
        tileTypes[100]=[true,100, "", ""];

        // the rooms
        public static var mapNumber:int = 0;        
        public static var myRoom:Array = new Array();

myRoom[0] = [
[17, 12, 12, 12, 12, 12, 12, 12, 12, 17, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 17],
[14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 97, 1, 1, 1, 1, 1, 13],
[14, 1, 1, 1, 95, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 15, 1, 1, 1, 1, 1, 1, 1, 97, 1, 13],
[14, 1, 1, 5, 4, 10, 4, 4, 4, 4, 4, 10, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8],
[14, 1, 1, 1, 1, 9, 1, 1, 1, 13, 1, 9, 1, 1, 1, 1, 1, 1, 1, 96, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7],
[14, 1, 1, 1, 1, 9, 1, 1, 1, 13, 1, 9, 1, 1, 1, 1, 1, 1, 46, 35, 47, 1, 1, 1, 1, 1, 1, 1, 2, 13],
[14, 1, 1, 1, 1, 1, 1, 1, 1, 13, 1, 1, 1, 1, 1, 1, 1, 46, 42, 34, 43, 47, 1, 1, 1, 1, 1, 1, 1, 13],
[14, 1, 1, 1, 1, 1, 25, 30, 1, 13, 1, 1, 40, 41, 1, 1, 46, 42, 34, 34, 34, 43, 47, 1, 1, 1, 1, 1, 1, 13],
[14, 1, 97, 22, 2, 33, 2, 28, 30, 13, 1, 1, 44, 45, 97, 46, 42, 34, 34, 34, 34, 34, 43, 47, 1, 1, 1, 1, 1, 13],
[17, 15, 15, 15, 15, 15, 15, 15, 15, 17, 35, 35, 42, 43, 35, 42, 34, 34, 34, 34, 34, 34, 34, 43, 35, 35, 35, 3, 2, 13]
]

myRoom[1] = [
[17, 12, 12, 1, 1, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 17, 34, 34, 34, 34, 34, 34, 34, 34, 34],
[8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 97, 1, 1, 1, 1, 1, 13, 34, 34, 34, 34, 34, 34, 34, 34, 34],
[7, 95, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 97, 1, 13, 34, 34, 34, 34, 34, 34, 34, 34, 34],
[13, 4, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 13, 34, 34, 34, 34, 34, 34, 34, 34, 34],
[13, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 13, 34, 34, 34, 34, 34, 34, 34, 34, 34],
[13, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 13, 34, 34, 34, 34, 34, 34, 34, 34, 34],
[13, 1, 1, 1, 1, 5, 4, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 34, 34, 34, 34, 34, 34, 34, 34, 34],
[13, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 96, 1, 1, 7, 34, 34, 34, 34, 34, 34, 34, 34, 34],
[13, 1, 1, 1, 100, 1, 46, 35, 35, 35, 35, 35, 35, 35, 41, 17, 40, 35, 35, 35, 35, 34, 34, 34, 34, 34, 34, 34, 34, 34],
[17, 35, 35, 1, 1, 35, 42, 34, 34, 34, 34, 34, 34, 34, 45, 49, 44, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34]
]
 
myRoom[2] = [
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 12, 12, 2],
[2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
[2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
[2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
[2, 1, 1, 1, 1, 1, 1, 1, 97, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
[2, 4, 4, 4, 4, 10, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2],
[2, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
[2, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
[8, 1, 1, 1, 1, 9, 1, 48, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
[7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
] ;

myRoom[3] = [
[35, 35, 35, 41, 95, 40, 35, 35, 35, 35],
[34, 34, 34, 45, 1, 44, 34, 34, 34, 34],
[34, 34, 34, 45, 1, 44, 34, 34, 34, 34],
[34, 34, 34, 45, 1, 44, 34, 34, 34, 2],
[34, 34, 34, 45, 1, 44, 34, 34, 34, 2],
[34, 34, 34, 45, 1, 44, 34, 34, 2, 2],
[34, 34, 34, 45, 1, 44, 34, 34, 2, 2],
[2, 34, 34, 45, 1, 44, 34, 2, 2, 2],
[2, 34, 34, 45, 1, 44, 34, 2, 2, 2],
[2, 2, 34, 45, 1, 44, 2, 2, 2, 2],
[2, 2, 34, 45, 1, 44, 2, 2, 2, 2],
[2, 2, 2, 13, 96, 14, 2, 2, 2, 2],
[2, 2, 2, 13, 96, 14, 2, 2, 2, 2],
[2, 2, 2, 13, 96, 14, 2, 2, 2, 2],
[2, 2, 2, 13, 96, 16, 14, 2, 2, 2],
[2, 2, 2, 13, 1, 1, 14, 2, 2, 2],
[2, 19, 1, 13, 1, 1, 14, 1, 1, 2],
[2, 33, 33, 13, 1, 1, 14, 33, 33, 2],
[2, 2, 2, 13, 1, 1, 14, 2, 2, 2],
[2, 2, 2, 13, 96, 1, 14, 2, 2, 2],
[2, 2, 2, 13, 96, 1, 14, 2, 2, 2],
[2, 2, 2, 13, 96, 1, 14, 2, 2, 2],
[11, 11, 2, 13, 96, 1, 14, 2, 11, 2],
[11, 19, 1, 1, 1, 1, 14, 11, 11, 2],
[2, 1, 2, 50, 50, 50, 14, 2, 2, 2],
[2, 1, 2, 33, 33, 33, 14, 2, 2, 2],
[2, 1, 2, 12, 12, 12, 2, 2, 11, 2],
[11, 1, 11, 2, 2, 2, 11, 2, 2, 2],
[11, 1, 11, 11, 2, 2, 2, 2, 2, 2],
[17, 96, 17, 16, 16, 11, 11, 11, 16, 16],
[13, 96, 14, 2, 2, 2, 2, 2, 2, 2],
[13, 96, 14, 19, 1, 1, 1, 1, 11, 2],
[13, 96, 14, 1, 1, 1, 1, 1, 2, 2],
[13, 96, 14, 1, 1, 1, 1, 1, 2, 2],
[13, 1, 14, 23, 33, 33, 33, 22, 11, 2],
[13, 1, 14, 11, 2, 2, 2, 2, 2, 2],
[17, 1, 17, 16, 16, 16, 16, 16, 16, 16],
[13, 1, 1, 1, 1, 1, 1, 1, 1, 14],
[13, 1, 1, 17, 1, 1, 17, 1, 96, 14],
[13, 1, 1, 1, 1, 1, 1, 1, 96, 14],
[13, 1, 1, 1, 1, 1, 1, 1, 96, 14],
[13, 1, 1, 1, 1, 1, 1, 1, 1, 14],
[13, 51, 51, 51, 51, 51, 51, 1, 1, 14],
[13, 33, 33, 33, 14, 2, 2, 13, 1, 14],
[2, 12, 12, 12, 2, 2, 2, 13, 96, 14],
[2, 2, 2, 2, 2, 2, 2, 13, 96, 14],
[2, 2, 2, 2, 2, 2, 2, 13, 96, 14],
[2, 19, 2, 2, 2, 2, 19, 13, 96, 14],
[2, 1, 2, 2, 2, 2, 1, 2, 1, 2],
[2, 33, 2, 2, 2, 2, 33, 2, 1, 2],
[2, 15, 2, 2, 2, 2, 2, 2, 1, 2],
[13, 96, 15, 15, 15, 15, 15, 15, 1, 2],
[13, 1, 1, 1, 1, 1, 1, 1, 96, 2],
[13, 1, 1, 1, 1, 1, 1, 1, 50, 2],
[13, 100, 1, 1, 96, 1, 1, 1, 1, 2],
[13, 25, 30, 1, 5, 51, 1, 96, 1, 2],
[2, 12, 28, 30, 1, 1, 1, 50, 1, 8],
[11, 11, 11, 28, 1, 1, 1, 1, 1, 7],
[2, 11, 2, 11, 96, 25, 32, 1, 22, 12],
[2, 2, 2, 2, 3, 12, 12, 12, 2, 2] ];

myRoom[4] = [
[2, 2, 2, 2, 2, 2, 2, 2, 95, 14],
[14, 2, 2, 2, 2, 2, 2, 2, 1, 14],
[14, 2, 2, 2, 2, 2, 2, 2, 1, 14],
[14, 2, 2, 2, 2, 2, 2, 2, 1, 14],
[14, 100, 1, 1, 1, 1, 1, 1, 1, 14],
[14, 1, 1, 1, 1, 1, 1, 4, 4, 14],
[2, 1, 1, 1, 1, 1, 1, 1, 1, 14],
[2, 1, 1, 4, 4, 4, 1, 1, 1, 14],
[2, 1, 1, 1, 1, 1, 1, 1, 1, 14],
[2, 1, 1, 1, 97, 1, 1, 1, 1, 14],
[2, 1, 1, 4, 4, 4, 4, 1, 4, 14],
[2, 1, 1, 1, 1, 1, 1, 1, 1, 14],
[2, 1, 1, 1, 97, 1, 1, 1, 1, 14],
[2, 1, 1, 4, 4, 4, 1, 4, 4, 14],
[2, 1, 1, 96, 96, 96, 96, 96, 96, 14],
[2, 1, 1, 1, 97, 97, 1, 22, 12, 14],
[2, 1, 1, 4, 1, 10, 4, 2, 2, 14],
[2, 1, 1, 96, 96, 9, 96, 96, 96, 8],
[2, 1, 97, 97, 97, 9, 1, 1, 1, 7],
[2, 3, 2, 2, 2, 2, 2, 2, 2, 14]
]
         
        // room names
        public static var mapName:Array = new Array();
        mapName[0] = "Start";
        mapName[1] = "A locked grate";
        mapName[2] = "Boss Battle";
        mapName[3] = "Corridor down";
        mapName[4] = "Damn pixies";
     
        
        // doors
        // doors are counted from the room's top left to bottom right
        // myDoor[#] = [ to room number _ startX _ startY ]
        public static var myDoors:Array = new Array();
        myDoors[0] = ["1_2_2"];
    	myDoors[1] = ["0_28_4", "2_1_9", "3_4_0"];
        myDoors[2] = ["1_19_7"];
        myDoors[3] = ["4_8_0"];
        myDoors[4] = ["0_4_2"];
        
                
        // items
        // [ item type, x, y, shown? ]
        public static var myItems:Array = new Array();
        myItems[0] = [[ 4,8,2,true ], [ 4,9,2,true ], [ 4,10,2,true ], [ 4,19,4,true ]];
        myItems[1] = [[ 5,17,7,true ]]; // NPC
        myItems[2] = [[6,8,4, false]];
        myItems[3] = [[ 4,4,11,true ], [ 4,4,12,true ], [ 4,4,13,true ], [ 4,4,14,true ], [ 4,4,19,true ], [ 4,4,20,true ], [ 4,4,21,true ], [ 4,4,22,true ], [ 4,1,29,true ], [ 4,1,30,true ], [ 4,1,31,true ], [ 4,1,32,true ], [ 4,1,33,true ], [ 4,8,38,true ], [ 4,8,39,true ], [ 4,8,40,true ], [ 4,8,44,true ], [ 4,8,45,true ], [ 4,8,46,true ], [ 4,8,47,true ], [ 4,1,51,true ], [ 4,8,52,true ], [ 4,4,54,true ], [ 4,7,55,true ], [ 4,4,58,true ]];
		myItems[4] = [[ 4,3,14,true ], [ 4,4,14,true ], [ 4,5,14,true ], [ 4,6,14,true ], [ 4,7,14,true ], [ 4,8,14,true ], [ 4,3,17,true ], [ 4,4,17,true ], [ 4,6,17,true ], [ 4,7,17,true ], [ 4,8,17,true ]];        

        // enemies
        // myEnemies[ room number ] = "Dead?, Name, walker/flyer, X, Y, xMove, yMove, Speed, Life, JumpPct"
        public static var myEnemies:Array = new Array();
        myEnemies[0] = [  [ false,"bird","flyer",23,1,1,0,4,1 ], [ false,"bird","flyer",27,2,-1,0,2,1 ], [ false,"fat_blue","walker",2,8,1,0,3,2,3], [ false,"green_jumper","walker",14,8,1,0,3,1,6 ] ];
		myEnemies[1] = [  [ false,"fat_blue","walker",14,1,1,0,4,1,3 ], [ false,"fat_red","walker",14,1,1,0,4,1,3 ]];
		myEnemies[2] = [  [ false,"blue_boss","walker",8,2,1,0,4,5,2 ]];
		myEnemies[3] = [  [ true,"skully_green","walker",1,1,1,0,4,1,3 ] ];
		myEnemies[4] = [  [ false,"skully_green","walker",4,9,1,0,4,1,3 ], [ "false,green_jumper","walker",4,12,1,0,4,1,3 ], [ false,"green_jumper","walker",4,15,1,0,4,1,3 ], [ false,"green_jumper","walker",5,15,1,0,4,1,3 ], [ false,"green_jumper","walker",2,18,1,0,4,1,3 ], [ false,"green_jumper","walker",3,18,1,0,4,1,3 ], [ false,"green_jumper","walker",4,18,1,0,4,1,3 ] ];
		
		// moving tiles / platforms
		// (Number, xTile, yTile, speed, dirX, dirY, Width, Height)
		public static var myMovingTiles:Array = new Array();
		myMovingTiles[0] = [[]];
		myMovingTiles[1] = [[ 4,3,8,4,0,-1,32,8 ]];
		myMovingTiles[2] = [[]];
		myMovingTiles[3] = [[ 2,1,54,4,0,1,16,8 ]];
		myMovingTiles[4] = [[ 2,1,4,2,0,1,16,8 ]];


		// **************************************************
		// ** globals that can be modified in-game         **
		// **************************************************

		public static var v:Object = []; // object which holds writable global values
		v.stageHolder = new MovieClip();
		v.gamePaused = false;
		v.lives = 99;
		v.points = 0;
		v.lastGoodX = 0;
		v.lastGoodY = 0;
		v.thisMap = 0;
		v.wind = 0;
		v.myEnemies = myEnemies; 
		v.enemyHolder = new enemyStack();
		v.myItems = myItems;
		v.itemHolder = new itemStack();
		v.myCurrentMap = myRoom;
		v.myMovingTiles = myMovingTiles;
        v.movingTileHolder = new movingTileStack();
		v.myMap = new tileStack();
		v.mapName = mapName;
        v.myEffectHolder = new Sprite();
        v.myEffectStack = new Array();
		v.myBulletHolder = new Sprite();
		v.myBulletStack = new Array();        
		v.myCutScene = new cutScene();
		v.myBackgroundHolder = new background(2);
		v.tt = new textOut();
		

    }
}