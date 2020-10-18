'use strict';
import AccessFile from './access_file.js';
import * as draw from './draw.js';

var background_image ;
var tidus_face;
var yuna_face;
var auron_face;
var kimahri_face;
var wakka_face;
var lulu_face;
var rikku_face;
var hp_file;
var mp_file;
var slvl_file;

function draw_faceplate(name, image, x, y, hp, mp, slvl) {
	var rectWidth = 143 - 15;
	var rectHeight = 27;
	var bgrectWidth = 196;
	var bgrectHeight = 96;
	var face_rect_width = 96;
	var face_rect_height = 96;
	var shadow = 4
	var shear = -0.5

	hp = hp_file.read();
	mp = mp_file.read();
	slvl = slvl_file.read();

	y = y + 3
	draw.radial_gradient_rect(x, y, face_rect_width, face_rect_height, 0, "#ffffff46", "#00000046");
	image.draw(x, y);
	draw.text(name.toUpperCase(), "normal 44px FinalFantasy", "black", "white", 1, x+10, y+52)

	x = x + face_rect_width
	draw.linear_gradient_rect(x, y, bgrectWidth, bgrectHeight, 0, "#00000046", "#ffffff46");

	x = x - 11
	y = y + 13 + 2
	draw.rect(x + shadow, y + shadow, rectWidth, rectHeight, shear, "#000000d9");
	draw.linear_gradient_rect(x, y, rectWidth, rectHeight, shear, "#ff0100bd", "#ff9100bd");
	draw.text("HP", "normal 44px FinalFantasy", "white", "black", 3, x + 6, y + 24)
	draw.text(hp, "bold italic 36px Georgia", "white", "black", 2, x + 75, y + 20)

	y = y + rectHeight + shadow + shadow+6
	draw.rect(x + shadow, y + shadow, rectWidth, rectHeight, shear, "#000000d9");
	draw.linear_gradient_rect(x, y, rectWidth, rectHeight, shear, "#23ff00bd", "#00ccffbd");
	draw.text("MP", "normal 44px FinalFantasy", "white", "black", 3, x + 6, y + 24)
	draw.text(mp, "bold italic 36px Georgia", "white", "black", 2, x + 75, y + 20)

	x = x + 150
	y = y + 20
	draw.text(slvl, "bold italic 60px Georgia", "white", "black", 2, x, y)
	draw.text("SLV", "normal 24px FinalFantasy", "white", "black", 2, x - 8, y + 15)
}

function draw_all() {
	background_image.draw(0, 0, draw.get_width(), draw.get_height());


	draw.text("TIME PLAYED             GIL", "normal 40px FinalFantasy", "white", "black", 2, 12, 48);
	draw.rect(14, 51, 108, 2, 0, "#FFFFFF");
	draw.rect(185, 51, 26, 2, 0, "#FFFFFF");
	draw.text("16:13:36", "bold italic 28px Georgia", "white", "black", 2, 12, 76)
	draw.text("14693", "bold italic 28px Georgia", "white", "black", 2, 200, 76)
	var x = 3
	var y = 123
	var seperator = 117
	draw_faceplate("Tidus",   tidus_face,   x, y, 1320, 52, 3);
	y = y + seperator
	draw_faceplate("Yuna",    yuna_face,    x, y, 1320, 52, 4);
	y = y + seperator
	draw_faceplate("Auron",   auron_face,   x, y, 2131, 73, 3);
	y = y + seperator
	draw_faceplate("Kimahri", kimahri_face, x, y, 1096, 158, 6);
	y = y + seperator
	draw_faceplate("Wakka",   wakka_face,   x, y, 1698, 90, 3);
	y = y + seperator +1
	draw_faceplate("Lulu",    lulu_face,    x, y, 1180, 172, 5);
	y = y + seperator
	draw_faceplate("Rikku",   rikku_face,   x, y, 1160, 85, 0);
}
function init(w, h) {
	draw.init(w, h);

	background_image = draw.LoadImage("assets/background_test_bottom.png");
	tidus_face = draw.LoadImage("assets/tidus_face.png");
	yuna_face = draw.LoadImage("assets/yuna_face.png");
	auron_face = draw.LoadImage("assets/auron_face.png");
	kimahri_face = draw.LoadImage("assets/kimahri_face.png");
	wakka_face = draw.LoadImage("assets/wakka_face.png");
	lulu_face = draw.LoadImage("assets/lulu_face.png");
	rikku_face = draw.LoadImage("assets/rikku_face.png");
	hp_file = AccessFile('filename=' + "Tidus" + '/curr_hp.txt');
	mp_file = AccessFile('filename=' + "Tidus" + '/curr_mp.txt');
	slvl_file = AccessFile('filename=' + "Tidus" + '/slvl.txt');

	setInterval(draw_all, 100);
}
window.init = init;
