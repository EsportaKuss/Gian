global.animation = false;
instance_create_depth(189,186,0,obj_neco);
with (instance_create_depth(x,y,-1000,obj_textbox) )
	{
				if global.Language == true {
	scr_text("Ugh...", "niky");
	scr_text_float(0, 5);
	scr_text("¿Quien está molestando a esta hora?", "niky");
	scr_text("No me digas que es ese niño otra vez...", "niky");
	scr_text("¿Cuántas veces le tendré que decir que la única ropa que tengo es la que tengo puesta?", "niky");
		}
		else {
	scr_text("Hola", "Andrea");
	scr_text_float(0, 5);
	scr_text("Profe, este proyecto se puede modificar facilmente!", "niky");
	scr_text("Con fe para el miercoles va a quedar bacán", "niky");}
	}
instance_destroy();