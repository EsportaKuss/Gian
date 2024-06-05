/// @param text_id
function script_game_text(_text_id){
	if global.Language == false {
switch(_text_id) {
	
//-----------------------------INTRO--------------------------//
	case "intro":
	scr_text("Hola", "Andrea");
	scr_text("Hola2", "Andrea");
with (obj_textbox) 
	{
		global.room_to = rm_andrea_i;
		room_change = true;
		go_to_x = 186;
		go_to_y = 192;
	}
	break;
	
		//-----------------------------BEDROOM--------------------------//
	 case "andrea_i_to_sala_i":
	 scr_text("Quieres salir?");
		 scr_option("Si","salir - sala_i")
		 scr_option("No","quedarte")
	break;
	
		case "salir - sala_i":
		with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
		{
		target_rm = rm_sala_i;
		target_x = 230;
		target_y = 120;
		}
		break;
	
		case "quedarte":
		scr_text("No hay razón para salir.");
		break;
	
	case "bed":
	scr_text("Tu cama.");
	scr_text("Esta llena de plumas...");
	break;
	
	//-----------------------------SALA--------------------------//
	
	case "sala_i_to_andrea_i":
	 scr_text("Quieres salir?");
		 scr_option("Si","salir - andrea_i")
		 scr_option("No","quedarte")
	break;
	
		case "salir - andrea_i":
		with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
		{
		target_rm = rm_andrea_i;
		target_x = 107;
		target_y = 120;
		}
		break;
	
		
		
		////previous room
	
	
	case "mouse hole":
	scr_text("Un agujero de ratón");
	global.MouseHole = 1;
	break;
	
	case "window drawing":
	scr_text("Heh, I'm SO good at drawing.", "niky - smug");
	break;
	
	case "dinner plate":
	scr_text("Lo guardaste como recuerdo...");
	break;
	
	case "closet":
	scr_text("Revisar closet?");
		scr_option("Revisar", "closet - check")
		scr_option("Dejar", "closet - leave")
	break;
			case "closet - check":
				with obj_closet {
				text_id = "open closet";
				image_index = 1
				}
			scr_text("Obtuviste cupón.");
				scr_text_color(10, 25, c_yellow, c_yellow, c_yellow, c_yellow);
			InventoryAdd(obj_inventory, 0);
		break;
			case "closet - leave":
			scr_text("Mejor dejar las cosas como estan.");
		break;
		
	case "open closet":
	scr_text("Solo se mantiene la memoria del cupón.");
	break;
		
	case "box":
	scr_text("Una caja.");
	scr_text("Abrir?");
		scr_option("Si", "box - open")
		scr_option("No", "box - no")
	break;
					case "box - open":
			with obj_box {
			text_id = "open box";
			image_index = 1
			}
			with obj_bd_door {
			text_id = "bdrm door peso";
			}
			scr_text("VAMOOOS",  "niky - surprised");
			scr_text("Obtuviste 5 centimos.");
				scr_text_color(8, 23, c_yellow, c_yellow, c_yellow, c_yellow);
			global.Peso = true;
			InventoryAdd(obj_inventory, 1);
		break;
				case "box - no":
				scr_text("Otro día solitario para la caja.");
		break;
	
				case "open box":
				scr_text("No hay nada más.")
		break;
	
	case "bedroom door":
	scr_text("Alguien te esta reventando la puerta");
	scr_text("Abrir?");
		scr_option("Si", "bdrm door - open")
		scr_option("No", "bdrm door - no")
	break;
				case "bdrm door - open":
				with obj_bd_door {image_index = 1}
				audio_play_sound(snd_door_opening, 8, false)
				scr_text("¿CUANTA VECES TENGO QUE DEC-", "niky - angry");
					scr_text_shake(0,36);
				scr_text("Renta.", "owner");
				scr_text("uwu pwease mister owner may I stay here I have no job uwu uwu :33", "niky - uwu");
					scr_text_float(0, 65)
				with obj_textbox 
				{	
					global.room_to = rm_streets;
					room_change = true;
					go_to_x = 286;
					go_to_y = 192;
				}
				break;
				case "bdrm door - no":
				scr_text("That kid can wait.", "niky");
		break;
		
		case "bdrm door peso":
	scr_text("Someone's banging at the door");
	scr_text("Open it?");
		scr_option("Open", "bdrm door peso - open")
		scr_option("No", "bdrm door - no")
	break;
				case "bdrm door peso - open":
				with obj_bd_door {image_index = 1}
				audio_play_sound(snd_door_opening, 8, false)
				scr_text("I have an argentinian peso does that count", "niky - peso");
				InventoryRemove(obj_inventory, 1);
				with obj_textbox 
				{	bedroom_door = true	}
		break;
		
		//--------------------------STREETS--------------------------------//
		case "mouse hole default":
		scr_text("A mouse hole.");
		break;
		
		case "mouse hole 2":
		scr_text("Another mouse hole.");
		scr_text("Your house belongs to the mouse now.");
		scr_text("It has won.");
		global.MouseHole = 2;
		break;
	
		case "streets door - normal":
		audio_play_sound(snd_door, 1, false);
		scr_text("HEY", "niky - angry");
		scr_text_shake(0,3);
		scr_text("THAT 'UWU' ACT IS GONNA COST YA EXTRA", "niky - angry");
		scr_text_shake(0,36);
		scr_text("YOU'LL HAVE TO PAY UP", "niky - angry");
		scr_text_shake(0,20);
		scr_text("PREFERABLY AN AMMOUNT BIG ENOUGH SO I CAN COME BACK TO LIVING HERE", "niky - angry");
		scr_text_shake(0,66);
		scr_text("...", "niky - angry");
		scr_text("Bah.", "niky");
		with obj_st_door {text_id = "streets door"}
		break;
		
		case "streets door - peso":
		audio_play_sound(snd_door, 1, false);
		scr_text("HEY", "niky - angry");
		scr_text_shake(0,3);
		scr_text("CAN I GET MY PESO BACK AT LEAST?", "niky - angry");
		scr_text_shake(0,31);
		scr_text("IT'S A PRIZED FAMILY POSSESSION (THAT I FOUND TODAY)", "niky - angry");
		scr_text_shake(0, 51);
		scr_text("...", "niky - angry");
		scr_text("I'll get you back someday, peso...", "niky - sad");
		with obj_st_door {text_id = "streets door"}
		break;
		
		case "streets door":
		scr_text("It seems like you won't be coming back here.");
		break;
		
		case "eviction notice":
		scr_text("It's an eviction notice.");
		scr_text("This is the most poorly written eviction notice I've ever seen.", "niky");
		scr_text("You got Eviction Notice.");
			scr_text_color(8, 22, c_yellow, c_yellow, c_yellow, c_yellow);
		scr_text("I'm not keeping this.", "niky");
		scr_text("Nvm.");
			scr_text_color(0, 2, c_yellow, c_yellow, c_yellow, c_yellow);
		with obj_eviction_note {text_id = "eviction notice 2"};
		break;
		
		case "eviction notice 2":
		scr_text("Who writes 'eviction' with a K?", "niky");
		break;
		
		case "sts trash container empty":
		scr_text("It's a trash container.");
		scr_text("Guess I'm doing this now.", "niky");
		scr_text("Check it?");
			scr_option("Check", "sts trash container empty - check")
			scr_option("Leave", "sts trash container empty - leave")
		break;
				case "sts trash container empty - check":
			scr_text("You found nothing but trash.");
			scr_text("Dunno what I was expecting, really...", "niky - shocked");
			with obj_trash_container {if (text_id = "sts trash container empty") open_trash();}
			break;
				case "sts trash container empty - leave":
			scr_text("Actually, why would I do that????", "niky - shocked");
			break;
			
		case "trash container opened":
		scr_text("If something useful was inside, it's gone. Just like your dignity.");
		break;
		
		case "sts trash container candy":
		scr_text("Check trash container?");
			scr_option("Check", "sts trash container candy - check")
			scr_option("Leave", "sts trash container empty - leave")
		break;
			case "sts trash container candy - check":
				scr_text("You found trash candy.");
					scr_text_color(10, 20, c_yellow, c_yellow, c_yellow, c_yellow);
				scr_text("Ey, one man's trash!", "niky - smug");
				scr_text("Ha ha", "niky - smug");
				scr_text("Ha...", "niky - smug");
				scr_text("...", "niky - sad");
				InventoryAdd(obj_inventory, 2);
				with obj_trash_container {if (text_id = "sts trash container candy") open_trash();}
			break;
		case "sts trash container bricks":
			scr_text("Wh-", "niky - surprised");
			scr_text("Who the fuck left a trash bag full of bricks in here???", "niky - angry");
			scr_text("...", "niky - angry");
			scr_text("I mean, if nobody wants it...", "niky - smug");
			scr_text("You found a Brick Bag.");
				scr_text_color(12, 20, c_yellow, c_yellow, c_yellow, c_yellow);
			InventoryAdd(obj_inventory, 3);
			with obj_trash_container {if (text_id = "sts trash container bricks") open_trash();}
		break;
				case "sts - manhole":
			scr_text("It's a manhole");
			scr_text("I wonder if they have rent in the sewers...", "niky - shocked");
		break;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//------------------------ESPAÑOL----ESPAÑOL----ESPAÑOL----ESPAÑOL----ESPAÑOL------//
	else
	{switch(_text_id) {
	
//-----------------------------BEDROOM--------------------------//
	case "bed":
	scr_text("Tu cama.");
	scr_text("La conseguiste (de la basura) de Ikea.");
	break;
	
	case "mouse hole":
	scr_text("Un agujero de ratón.");
	scr_text("Un ratón vive aquí.");
	scr_text("A veces te preguntas si la casa es más suya que tuya.");
	break;
	
	case "window drawing":
	scr_text("Es un dibujo mal hecho de una ventana.");
	scr_text("Je, soy TAN buena dibujando.", "niky - smug");
	break;
	
	case "dinner plate":
	scr_text("Es el plato de la cena de la semana pasada.");
	scr_text("Te lo quedaste para preservar la memoria de la increíble cena que una vez tuviste.");
	break;
	
	case "closet":
	scr_text("¿Abrir el armario?");
		scr_option("Abrir", "closet - check")
		scr_option("Irse", "closet - leave")
	break;
			case "closet - check":
				with obj_closet {
				text_id = "open closet";
				image_index = 1
				}
			scr_text("Solo había un cupón dentro.");
			scr_text("Ou yea, 25% de descuento para un Big Mac(tm).",  "niky - surprised");
			scr_text("No te diste cuenta que el cupón era de 2002 .");
			scr_text("Conseguiste el Cupón Expirado.");
				scr_text_color(15, 28, c_yellow, c_yellow, c_yellow, c_yellow);
			InventoryAdd(obj_inventory, 0);
		break;
			case "closet - leave":
			scr_text("Así está mejor.");
		break;
		
	case "open closet":
	scr_text("Lo único que queda es la memoria del cupón expirado.");
	break;
		
	case "box":
	scr_text("Es una caja de cartón.");
	scr_text("¿Abrirla?");
		scr_option("Abrir", "box - open")
		scr_option("No", "box - no")
	break;
					case "box - open":
			with obj_box {
			text_id = "open box";
			image_index = 1
			}
			with obj_bd_door {
			text_id = "bdrm door peso";
			}
			scr_text("Encontraste una moneda.");
			scr_text("VAMOS-",  "niky - surprised");
			scr_text("Oh.", "niky");
			scr_text("Es un peso argentino.", "niky");
			scr_text("Conseguiste un Peso Argentino.");
				scr_text_color(15, 28, c_yellow, c_yellow, c_yellow, c_yellow);
			global.Peso = true;
			InventoryAdd(obj_inventory, 1);
		break;
				case "box - no":
				scr_text("Otro día solitario para la caja.");
		break;
	
				case "open box":
				scr_text("Tristemente, solo había un peso argentino ahí.")
		break;
	
	case "bedroom door":
	scr_text("Alguien está golpeando la puerta.");
	scr_text("¿Abrirla?");
		scr_option("Abrirla", "bdrm door - open")
		scr_option("No", "bdrm door - no")
	break;
				case "bdrm door - open":
				with obj_bd_door {image_index = 1}
				audio_play_sound(snd_door_opening, 8, false)
				scr_text("CUANTAS VECES TE TENGO QUE DECIR QUE-", "niky - angry");
					scr_text_shake(0,37);
				scr_text("Renta.", "owner");
				scr_text("ah.", "niky - shocked");
				scr_text("Renta.", "owner");
				scr_text("Eh...", "niky - shocked");
				scr_text("¿No te puedo pagar el siguiente mes?", "niky - shocked");
				scr_text("No has pagado la renta desde que llegaste.", "owner");
				scr_text("MENTIROSO. Te pague una vez.", "niky - angry");
				scr_text("Con un sticker.", "owner");
				scr_text("Tenía valor sentimental.", "niky - smug");
				scr_text("...", "owner");
				scr_text("Vete.", "owner");
				scr_text("que", "niky - shocked");
				scr_text("Ya no vives aquí.", "owner");
				scr_text("...", "niky - shocked");
				scr_text("...", "niky - ultra shocked");
				scr_text("...", "niky - ultra shocked");
				scr_text("uwu porfis señor duenow no tengo trabajo me puedo quedar uwu uwu :33", "niky - uwu");
					scr_text_float(0, 68)
				with obj_textbox 
				{	bedroom_door = true	}
				break;
				case "bdrm door - no":
				scr_text("Ese niño puede esperar.", "niky");
		break;
		
		case "bdrm door peso":
	scr_text("Alguien está golpeando la puerta.");
	scr_text("¿Abrirla?");
		scr_option("Abrirla", "bdrm door peso - open")
		scr_option("No", "bdrm door - no")
	break;
				case "bdrm door peso - open":
				with obj_bd_door {image_index = 1}
				audio_play_sound(snd_door_opening, 8, false)
				scr_text("CUANTAS VECES TE TENGO QUE DECIR QUE-", "niky - angry");
					scr_text_shake(0,37);
				scr_text("Renta.", "owner");
				scr_text("ah.", "niky - shocked");
				scr_text("Renta.", "owner");
				scr_text("Eh...", "niky - shocked");
				scr_text("¿No te puedo pagar el siguiente mes?", "niky - shocked");
				scr_text("No has pagado la renta desde que llegaste.", "owner");
				scr_text("MENTIROSO. Te pague una vez.", "niky - angry");
				scr_text("Con un sticker.", "owner");
				scr_text("Tenía valor sentimental.", "niky - smug");
				scr_text("...", "owner");
				scr_text("Vete.", "owner");
				scr_text("que", "niky - shocked");
				scr_text("Ya no vives aquí.", "owner");
				scr_text("...", "niky - shocked");
				scr_text("...", "niky - ultra shocked");
				scr_text("...", "niky - ultra shocked");
				scr_text("tengo un peso argentino eso cuenta?", "niky - peso");
				InventoryRemove(obj_inventory, 1);
				with obj_textbox 
				{	bedroom_door = true	}
				break; 
				
						//--------------------------STREETS--------------------------------//
		case "mouse hole default":
		scr_text("Es un agujero de ratón.");
		break;
		
		case "mouse hole 2":
		scr_text("Otro agujero de ratón.");
		scr_text("Tu casa le pertenece al ratón ahora.");
		scr_text("Ganó.");
		global.MouseHole = 2;
		break;
		
		case "streets door - normal":
		audio_play_sound(snd_door, 1, false);
		scr_text("HEY", "niky - angry");
		scr_text_shake(0,3);
		scr_text("ESE ACTITO DE 'UWU' TE COSTARA EXTRA", "niky - angry");
		scr_text_shake(0,35);
		scr_text("TENDRAS QUE PAGARME", "niky - angry");
		scr_text_shake(0,18);
		scr_text("PREFERIBLEMENTE UNA CANTIDAD SUFICIENTEMENTE COMO PARA QUE PUEDA VOLVER A VIVIR AQUI", "niky - angry");
		scr_text_shake(0,82);
		scr_text("...", "niky - angry");
		scr_text("Bah.", "niky");
		with obj_st_door {text_id = "streets door"}
		break;
		
		case "streets door - peso":
		audio_play_sound(snd_door, 1, false);
		scr_text("HEY", "niky - angry");
		scr_text_shake(0,3);
		scr_text("¿ME PUEDES DEVOLVER EL PESO AL MENOS?", "niky - angry");
		scr_text_shake(0,36);
		scr_text("ES UNA POSESION PRECIADA DE MI FAMILIA (QUE ACABO DE ENCONTRAR HOY)", "niky - angry");
		scr_text_shake(0, 66);
		scr_text("...", "niky - angry");
		scr_text("Te recuperare algun dia, peso...", "niky - sad");
		with obj_st_door {text_id = "streets door"}
		break;
		
		case "streets door":
		scr_text("Parece que no volveras aqui.");
		break;
		
		case "eviction notice":
		scr_text("Es una notificación de desalojo.");
		scr_text("Esta es la peor escrita notificación de desalojo que he visto.", "niky");
		scr_text("Conseguiste la Notificación de Desalojo.");
			scr_text_color(15, 38, c_yellow, c_yellow, c_yellow, c_yellow);
		scr_text("No me voy a quedar con esto.", "niky");
		scr_text("Nvm.");
			scr_text_color(0, 2, c_yellow, c_yellow, c_yellow, c_yellow);
		with obj_eviction_note {text_id = "eviction notice 2"};
		break;
		
		case "eviction notice 2":
		scr_text("¿Quien escribe 'desalojo' con una G?", "niky");
		break;
		
		case "sts trash container empty":
		scr_text("Es un contenedor de basura.");
		scr_text("Supongo que estoy haciendo esto ahora.", "niky");
		scr_text("Revisar?");
			scr_option("Revisar", "sts trash container empty - check")
			scr_option("Dejar", "sts trash container empty - leave")
		break;
				case "sts trash container empty - check":
			scr_text("No encontraste nada más que basura.");
			scr_text("No se que esperaba, la verdad...", "niky - shocked");
			with obj_trash_container {if (text_id = "sts trash container empty") open_trash();}
			break;
				case "sts trash container empty - leave":
			scr_text("¿De hecho, por qué haría eso????", "niky - shocked");
			break;
			
		case "trash container opened":
		scr_text("Si había algo útil dentro, ya no está. Al igual que tu dignidad.");
		break;
		
		case "sts trash container candy":
		scr_text("Revisar contenedor de basura?");
			scr_option("Revisar", "sts trash container candy - check")
			scr_option("Dejar", "sts trash container empty - leave")
		break;
			case "sts trash container candy - check":
				scr_text("Encontraste caramelo basura.");
					scr_text_color(12, 26, c_yellow, c_yellow, c_yellow, c_yellow);
				scr_text("Ey, la basura de uno es el tesoro de otros.", "niky - smug");
				scr_text("Ja ja", "niky - smug");
				scr_text("Ja...", "niky - smug");
				scr_text("...", "niky - sad");
				InventoryAdd(obj_inventory, 2);
				with obj_trash_container {if (text_id = "sts trash container candy") open_trash();}
			break;
		case "sts trash container bricks":
			scr_text("Qu-", "niky - surprised");
			scr_text("¡¿Quién mierda dejó una bolsa de basura llena de ladrillos???!", "niky - angry");
			scr_text("...", "niky - angry");
			scr_text("Es decir, si nadie lo quiere...", "niky - smug");
			scr_text("Encontraste una Bolsa de Ladrillos.");
				scr_text_color(16, 33, c_yellow, c_yellow, c_yellow, c_yellow);
			InventoryAdd(obj_inventory, 3);
			with obj_trash_container {if (text_id = "sts trash container bricks") open_trash();}
		break;
		
		case "sts - manhole":
			scr_text("Es una alcantarilla.");
			scr_text("Me pregunto si cobran renta en las alcantarillas.", "niky - surprised");
		break;
				}
		}
}