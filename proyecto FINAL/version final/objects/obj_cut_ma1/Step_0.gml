if instance_exists(obj_neco)
{
if (obj_neco.x>x)
{
image_xscale = 1;
}
else
{
image_xscale = -1;
}
}


if (obj_progress.cut1_done == true)
{
instance_destroy();	
}

else 
{



//Warp in
if (timer_warp<=100)
{
global.CutscenePlaying = true;
image_alpha+= 0.01;
image_blend = make_colour_rgb(rgb1, rgb2, rgb3);
rgb1+=2.55;
rgb2+=2.55;
rgb3+=2.55;
timer_warp+=1;
}

//detecta fin de warp e inicia movimiento de cut **TEXTBOX
if (timer_warp>100 && enter_done == false)
{
if y_enter<=120 
{
	y_enter+=1;
	y+=1;
}

if y_enter>=120 && x_enter<=20
{
	x-=1;
	x_enter++;
}

if (x_enter>=20)
{
	enter_done = true;
}
}

if enter_done == true
{
	
	
	
	if current_text<4
	{
	text_id = text_array[current_text];
	if !instance_exists(obj_textbox)
	{
	create_textbox(text_id); //Se crea dialogo
	if current_text<4
	{
	current_text+=1;
	}
	}
	}
	
	
}
//salida, final de cutscene
if !instance_exists(obj_textbox) && text_id=="and2"
{
if x_enter>=20 && x_out<=20
{
	x_out+=1;
	x+=1;
}

if x_out>=20 && y_out<=130
{
	y-=1;
	y_out++;
}
}

if (y_out>=130 && timer_warp_out <=100)
{
image_alpha-= 0.01
rgb1-=2.55;
rgb2-=2.55;
rgb3-=2.55;
image_blend = make_colour_rgb(rgb1, rgb2, rgb3);
timer_warp_out+=1;
}

if timer_warp_out>=100
{
	create_textbox("and3");
	global.CutscenePlaying = false;
	obj_progress.cut1_done = true;
	instance_destroy();
}
}