/// @param text_id
function script_game_text(_text_id){
	if global.Language == false {
switch(_text_id) {
	
//-----------------------------INTRO--------------------------//
	case "intro":
	
	scr_text("Hace una vez...en las zonas elevadas de San juan de Lurigancho","San Juan");//, "San Juan"//);
	
	with (obj_textbox) 
	{
		global.room_to = rm_andrea_i;
		room_change = true;
		go_to_x = 186;
		go_to_y = 192;
	}
	break;
	
		//-----------------------------ANDREA IRREAL--------------------------//
	case "andrea_i_to_sala_i":
	scr_text("¿Quieres salir?");
			scr_option("Si","andrea_i - sala_i")
			scr_option("No","quedarte")
	break;
		
			//a sala_i
			case "andrea_i - sala_i":
			if obj_progress.key1 = true
			{
			with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
		{
		target_rm = rm_sala_i;
		target_x = 207;
		target_y = 223;
		}
			}
			else 
			{
				scr_text("Esta cerrada.");
			}
			break;
	
			case "quedarte":
			scr_text("Estás feliz quedándote acá.");
			break;
	
	case "bed":
	scr_text("Tu cama.");
	scr_text("La cama se encuentra cubierta de plumas...");
	break;
	
	case "closet_i":
	scr_text("Revisar closet?");
			scr_option("Revisar", "closet - check")
			scr_option("Dejar", "closet - leave")
	break;
			case "closet - check":
				with obj_closet {
				text_id = "open closet";
				
				}
				scr_text("Obtuviste llave.");
				scr_text_color(10, 26, c_yellow, c_yellow, c_yellow, c_yellow);
				InventoryAdd(obj_inventory, 0);
				obj_progress.opencloset_i = true;
				obj_progress.key1 = true;
			break;
			
			case "closet - leave":
			scr_text("Mejor dejar las cosas como están.");
			break;
		
			case "open closet":
			scr_text("Solo se mantiene la memoria de la llave.");
			break;
	
	case "osito":
	scr_text("Tu mejor amigo.");
	scr_text("Siempre puedes confiar en el...");
	break;
	
	//-----------------------------SALA IRREAL --------------------------//
	//a andrea_i
	case "sala_i_to_andrea_i":
	scr_text("¿Quieres salir?");
		scr_option("Si","sala_i - andrea_i")
		scr_option("No","quedarte")
	break;
	
		case "sala_i - andrea_i":
		with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
		{
		target_rm = rm_andrea_i;
		target_x = 107;
		target_y = 120;
		}
		break;
	
	//a cuarto mama_i y regreso a sala_i
	case "sala_i_to_mama_i":
		scr_text("¿Quieres salir?");
		scr_option("Si","sala_i - mama_i")
		scr_option("No","quedarte")
	break;
	
		case "sala_i - mama_i":
		with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
		{
		target_rm = rm_mama_i;
		target_x = 230;
		target_y = 120;
		}
		break;
	
	
		
		//a cuarto mateo_i y regreso a sala_i
	case "sala_i_to_mateo_i":
		scr_text("¿Quieres salir?");
		scr_option("Si","sala_i - mateo_i")
		scr_option("No","quedarte")
	break;
	
		case "sala_i - mateo_i":
		with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
		{
		target_rm = rm_mateo_i;
		target_x = 110;
		target_y = 115;
		}
		break;
		

	//a JARDIN y regreso a SALA
		case "sala_i_to_jardin_i":
		scr_text("¿Quieres salir?");
		scr_option("Si","sala_i - jardin_i")
		scr_option("No","quedarte")
	break;
	
		case "sala_i - jardin_i":
		with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
		{
		target_rm = rm_jardin_i;
		target_x = 235;
		target_y = 157;
		}
		break;
		
		
		//a COCINA 
		case "sala_i_to_cocina_i":
		scr_text("¿Quieres salir?");
		scr_option("Si","sala_i - cocina_i")
		scr_option("No","quedarte")
	break;
	
		case "sala_i - cocina_i":
		with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
		{
		target_rm = rm_cocina_i;
		target_x = 141;
		target_y = 210;
		}
		break;
		
		
		//a CALLE ***y regreso a SALA
		
	case "sala_i_to_calle_i":
	scr_text("¿Quieres salir?");
		scr_option("Si","sala_i - calle_i")
		scr_option("No","quedarte")
	break;
	
		case "sala_i - calle_i":
		if obj_progress.key_street == true {
		with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
		{
		target_rm = rm_calle_i;
		target_x = 56;
		target_y = 275;
		}
		}
		else 
		{
		 scr_text("Esta cerrada.");	
		}
		break;
		
							//----------- objeto watcher-----------
							case "sala_i_watcher":
							scr_text("...");
							with (obj_textbox) 
							{
							x_displacement_spr = 25;
							y_displacement_spr = 160;
							}
							scr_text("¿Hola?","Andrea");
							scr_text("La figura te resulta familiar.");
							break;
	
							//-----------TV-----------
							case "sala_i_televisor":
							with (obj_textbox) 
							{
							x_displacement_spr = 25;
							y_displacement_spr = 160;
							}
							scr_text("Está muy borroso...no logro distinguir nada.","Andrea");
							break;
	
							//-----------BARRERA VENTANA-----------
							case "sala_i_barrier":
							scr_text("Todo está sumido en la penumbra.");
							break;
							
							//-----------REPOSTERO-----------
							case "repostero_sala_i":
							if (obj_progress.key_repos = false)
							{
							scr_text("Esta cerrado con candado...");
							}
							else 
							{
							scr_text("Obtuviste llave de cocina.");
							scr_text_color(10, 17, c_yellow, c_yellow, c_yellow, c_yellow);
							obj_progress.key_cook = true;
							}
							break;
							
							case "repostero_sala_i_open":
							scr_text("Ya no hay nada de interes.");
							break;
							
							
							//-----------BARRERA DE MADERA-----------
							case "barrera_a_jardin_i":
							if obj_progress.crowbar = false
							{
							with (obj_textbox) 
							{
							x_displacement_spr = 25;
							y_displacement_spr = 160;
							}
							scr_text("Me pregunto que hay en el otro lado.","Andrea");
							}
							else 
							{
							scr_text ("¿Quieres usar la palanca?");
							scr_option("Si","palanca_sala_i")
							scr_option("No","barrera_a_jardin_no")	
								}
							break;
							
								case "palanca_sala_i":
								obj_progress.crowbar_sala = true;
								scr_text ("Haces un esfuerzo y logras derrumbar las maderas.");
								scr_text ("Sientes  como la brisa fria del jardin entra a la sala.");
								break;
								
								case "barrera_a_jardin_no":
								with (obj_textbox) 
								{
								x_displacement_spr = 25;
								y_displacement_spr = 160;
								}
								scr_text("Tal vez no deberia dañar mi casa...","Andrea");
								break;
								
		//-----------------------------CUARTO MATEO --------------------------//
		case "mateo_i_to_sala_i":
		scr_text("¿Quieres salir?");
		scr_option("Si","mateo_i - sala_i")
		scr_option("No","quedarte")
		break;
	
		case "mateo_i - sala_i":
			with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
			{
				target_rm = rm_sala_i;
			target_x = 340;
			target_y = 150;
			}
		break;
		
		//-----------------------------CUARTO MAMA --------------------------//
		case "mama_i_to_sala_i":
		scr_text("¿Quieres salir?");
		scr_option("Si","mama_i - sala_i")
		scr_option("No","quedarte")
		break;
	
			case "mama_i - sala_i":
			with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
			{
			target_rm = rm_sala_i;
			target_x = 50;
			target_y = 150;
			}
			break;
		
		//-----------------------------CUARTO CALLE --------------------------//
		case "warp calle":
		with (obj_textbox) 
	{
		global.room_to = rm_calle_2_i;
		room_change = true;
		go_to_x = 186;
		go_to_y = 192;
	}
	break;
	
	
	case "cabaña_crowbar":
	scr_text("Ingresas a la cabaña y consigues la palanca.");
	obj_progress.crowbar = true;
	break;
	
	case "cabaña_vacia":
	scr_text("Esta vacia.");
	break;
	
	
		case "huevo":
		scr_text("TODO ES TU CULPA.");
		scr_text_shake(0,30);
	break;
		
		case "warp calle regreso":
		with (obj_textbox) 
	{
		global.room_to = rm_calle_i;
		room_change = true;
		go_to_x = 1300;
		go_to_y = 40;
		}
		break;
		
		case "calle_i_to_sala_i":
		scr_text("¿Quieres salir?");
		scr_option("Si","calle_i - sala_i")
		scr_option("No","quedarte")
		break;
	
			case "calle_i - sala_i":
			with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
			{
			target_rm = rm_sala_i;
			target_x = 380;
			target_y = 120;
			}
			break;
		
		//-----------------------------CUARTO JARDIN --------------------------//
		
		case "jardin_i_to_sala_i":
		scr_text("¿Quieres salir?");
		scr_option("Si","jardin_i - sala_i")
		scr_option("No","quedarte")
		break;
	
			case "jardin_i - sala_i":
			with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
			{
			target_rm = rm_sala_i;
			target_x = 35;
			target_y = 127;
			}
			break;
		
		
		//-----------------------------CUARTO SOTANO --------------------------//
		
		
		
		//-----------------------------CUARTO COCINA --------------------------//
		case "cocina_i_to_sala_i":
		scr_text("¿Quieres salir?");
		scr_option("Si","cocina_i - sala_i")
		scr_option("No","quedarte")
		break;
	
			case "cocina_i - sala_i":
			with instance_create_depth(obj_neco.x,obj_neco.y,depth,obj_warp)	
			{
			target_rm = rm_sala_i;
			target_x = 216;
			target_y = 118;
			}
			break;
			
		case "closet_cocina":
		scr_text("Puedes ver a traves de las puertas de vidrio diferentes golosinas");
		scr_text("¿Quieres abrirlo?");
			scr_option("Si","closet_cocina_cerrado")
			scr_option("No","No abrir")
		break;
		
			case "closet_cocina_cerrado":
			scr_text("Esta cerrado con candado.");
			break;
			
			case "No abrir":
			scr_text("No tengo hambre de todas formas.");
			
			
		case "closet_cocina_key":
			scr_text("Puedes ver a traves de las puertas de vidrio diferentes golosinas");
		scr_text("¿Quieres abrirlo?");
			scr_option("Si","closet_cocina_open")
			scr_option("No","No abrir")
		break;
		
		case "closet_cocina_open":
		scr_text("Usas la llave para lograr abrir el closet. Y agarras una rica galleta para tu hermanito.");
		obj_progress.cookie = true;
		break;
		
		case "closet_cocina_empty":
		scr_text("Esta vacio.");
		break;
		
			//-----------------------------//-----------------------------//-----------------------------
	//-----------------------------//---------1--------------------//-----------------------------
	//-----------------------------//-----------------------------//-----------------------------
	//---------1--------------------//--1---------------------------//-----------------------------
	//-----------------------------//-----------------------1------//-----1------------------------
	//-----------------------------//---------1--------------------//---1--------------------------
	//-----------------------------//-----------------------------//-----------------------------
	//-----------------------------//----------1-------------------//-----------------1------------
	//---1-----------------1---------//-----------------------------//-----------------------------
	//-----------1------------------//-----------------------------//-----------------------------
	//-----------------------------//------------1-----------------//-----------------------------
	//-----------------------------//----1-------------------------//------------------1-----------
	//--------------------------1---//------------------1-----------//-----------------------------
	//---1---1------1-----------------//-----------------------------//-----------------------------
	//---------------1--------------//-1-------------------------1--//-----------------------------
	//-----------------------------//-----------------------------//---------1--------------------
	//-----------------------------//------------1-----------------//-----------------------------
	//-----------------------------//----1--------------1-----------//-----------------------------
	//---------------1--------------//-----------------------------//---------1-----------1---------
	//----------------------1-------//------------------1-----------//-----------------------------
	//------------1-----------------//-----------------------------//---------1--------------------
	//-----1------------------------//------------1----------------//-----------------------------
	//-----------------------------//-----------------------------//-----------------------------
	//--------------------1---------//------------1-----------------//----------------1-------------
	//-----------------------------//-----------------------------//-----------------------------
	//------1-----------------------//---1--------------------------//-----------------------------
	//-----------------------------//-----------------------1------//-----------------------------
	//-------1----------------------//-----------------------------//-----1-------------------1-----
	//-----------------------------//-------------------1----------//-----------------------------
	//-----------------------------//-----------------------------//-----------------------------
		
		//-----------------------------DIALOGO Y CUTSCENES--------------------------//
		
//dialogo con MAMA	
				//inicio
				case "ma1": 
				with (obj_textbox) 
				{
				x_displacement_spr = 35;
				y_displacement_spr = 170;
				}		
				scr_text("¡Hijita, por fin despiertas!","Mama");
				scr_text("¿Te sientes mejor?","Mama");
				break;
				
					case "and1":
					with (obj_textbox) 
					{
					x_displacement_spr = 25;
					y_displacement_spr = 160;
					}
					scr_text("¿Qué pasó?","Andrea");
					break;
					
				case "ma2":
				with (obj_textbox) 
				{
				x_displacement_spr = 35;
				y_displacement_spr = 170;
				}	
				scr_text("Tu mamá pone gentilmente el dorso de su mano sobre tu frente.");
				scr_text("Creo que ya bajó tu fiebre.","Mama");
				scr_text("Todo va a estar bien...solo sigue descansando.","Mama");
				break;
				
					case "and2":
					with (obj_textbox) 
					{
					x_displacement_spr = 25;
					y_displacement_spr = 160;
					}
					scr_text("Gracias mami...","Andrea");
					break;
					
					case "and3":
					with (obj_textbox) 
					{
					x_displacement_spr = 25;
					y_displacement_spr = 160;
					}
					scr_text("Intentas reconciliar el sueño...");
					scr_text("Pero aunque tu cama este más comoda que nunca, tu cuerpo se siente extraño.");
					scr_text("Creo que deberia levantarme...","Andrea");
					obj_progress.cut2_done = true;
					obj_neco.state = PLAYERSTATE.INVISIBLE
					break;
					
				case "ma_i1":
				with (obj_textbox) 
						{
						x_displacement_spr = 35;
						y_displacement_spr = 170;
						}
				scr_text("¡HIJITA! ¿Qué haces?","Mama");
				scr_text_shake(0,30);
				scr_text("Estas enferma...tienes que descansar.","Mama");
				scr_text("Regresa a tu cama...","Mama");
						scr_option("Si","mama_i1_si")
						scr_option("Cuestionar","mama_i1_cuestionar")
				break;
		
							case "mama_i1_si":
							with (obj_textbox) 
							{
							x_displacement_spr = 25;
							y_displacement_spr = 160;
							}
							scr_text("Okay mami...ahi regreso pronto.","Andrea");
							obj_progress.mama_progress = 1;
							break;
		
							case "mama_i1_cuestionar":
							with (obj_textbox) 
							{
							x_displacement_spr = 25
							y_displacement_spr = 160;
							}
							scr_text("N-No estoy enferma...","Andrea");
							obj_progress.mama_progress = 2;
							break;
			
					case "ma_i2_v1":
					with (obj_textbox) 
						{
						x_displacement_spr = 36;
						y_displacement_spr = 170;
						}
						if (obj_progress.kitchen_fire = false)
						{
						scr_text("Te quiero mucho hijita.","Mama");
						}
						else
						{
						obj_progress.mama_progress = 3;
						}
						break;
		
					case "ma_i2_v2":
					with (obj_textbox) 
						{
						x_displacement_spr = 36;
						y_displacement_spr = 170;
						}
					scr_text("Andrea, claro que estas enferma.","Mama");
					scr_text("Regresa a tu cuarto y descansa.","Mama");
					scr_text("Mantente abrigada, come algo y mantente tranquila.","Mama");
					obj_progress.mama_progress = 1;
					break;
					
					case "ma_i3":
					with (obj_textbox) 
						{
						x_displacement_spr = 36;
						y_displacement_spr = 170;
						}
						scr_text("¿Hija, por que no estas en tu cama?","Mama");
						obj_progress.mama_progress = 4;
						break;
					
					case "ma_i4":
					with (obj_textbox) 
						{
						x_displacement_spr = 25;
						y_displacement_spr = 160;
						}
						scr_text("Mami...huele como a quemado...","Andrea");
						obj_progress.mama_progress = 5;
						break;
						
					case "ma_i5":
					with (obj_textbox) 
						{
						x_displacement_spr = 36;
						y_displacement_spr = 170;
						}
						scr_text("...","Mama");
						scr_text("snif... snif...","Mama");
						scr_text("¡INCENDIO!","Mama");
						break;
		
		
//dialogo con MATEO
					case "mateo_i1": //0
					with (obj_textbox) 
					{
					x_displacement_spr = 30;
					y_displacement_spr = 165;
					}
					scr_text("Hola hermanita, es un lindo día...","Mateo");
					scr_text_float(0, 65)
					scr_text("¿No es cierto?","Mateo");
						scr_option("Si","mateo_i1 - si")
						scr_option("Cuestionar","mateo_i_1 - cuestionar")
					break;
		
						case "mateo_i1 - si":
						with (obj_textbox) 
						{
						x_displacement_spr = 25;
						y_displacement_spr = 160;
						}
						scr_text("Supongo que sí...","Andrea");
						obj_progress.mateo_progress = 1;
						break;
		
					case "mateo_i1_alt": //1
						with (obj_textbox) 
					{
					x_displacement_spr = 30;
					y_displacement_spr = 165;
					}
					scr_text("¿Paso algo?","Mateo");
					scr_text_float(0, 65)
					scr_option("No, nada","mateo_i1 - nada")
					scr_option("Cuestionar","mateo_i_1 - cuestionar")
					break;
					case "mateo_i1 - nada":
					break;
					
						case "mateo_i_1 - cuestionar":
						with (obj_textbox) 
						{
						x_displacement_spr = 25;
						y_displacement_spr = 160;
						}
						scr_text("¿Mateo?","Andrea");
						scr_text("No lo sé...","Andrea");
						scr_text("Me siento extraña...","Andrea");
						obj_progress.mateo_progress = 2;
						break;
					
					case "mateo_i2": //2
					with (obj_textbox) 
					{
					x_displacement_spr = 30;
					y_displacement_spr = 165;
					}
					scr_text("...","Mateo");
					scr_text("¿A que te refieres?","Mateo");
					obj_progress.mateo_progress = 3;
					break;
					
					case "mateo_i3": //3
					with (obj_textbox) 
					{
					x_displacement_spr = 25;
					y_displacement_spr = 160;
					}
					scr_text("Todo se siente un poco diferente.","Andrea");
					scr_text("Creo que necesito un poco de aire.","Andrea");
					scr_text("Pero la puerta esta cerrada...","Andrea");
					obj_progress.mateo_progress = 4;
					break;
					
					case "mateo_i4": //4
					with (obj_textbox) 
					{
					x_displacement_spr = 30;
					y_displacement_spr = 165;
					}
					scr_text("Mamá me dijo que te tienes que cuidar.","Mateo");
					scr_text("Si sales vas a empeorar.","Mateo");
					obj_progress.mateo_progress = 5;
					break;
					
					case "mateo_i5": //5
					with (obj_textbox) 
					{
					x_displacement_spr = 25;
					y_displacement_spr = 160;
					}
					scr_text("Por favor...ayudame a salir solo un momentito.","Andrea");
					scr_text("Te lo ruego...","Andrea");
					scr_text_float(0,50);
					obj_progress.mateo_progress = 6;
					break;
					
					case "mateo_i6": //6
					with (obj_textbox) 
					{
					x_displacement_spr = 30;
					y_displacement_spr = 165;
					}
					scr_text("Hm...","Mateo");
					scr_text("Esta bien, pero solo si primero me traes una galleta.","Mateo");
					obj_progress.galleta_asked = true;
					obj_progress.mateo_progress = 7;
					obj_progress.crow_progress = 1;
					break;
		
					case "mateo_sin_galleta": //7
					if obj_progress.cookie = false
					{
					with (obj_textbox) 
					{
					x_displacement_spr = 30;
					y_displacement_spr = 165;
					}
					scr_text("Sigo esperando...jeje","Mateo");
					}
					else
					{
					obj_progress.mateo_progress = 8;	
					}
					break;
					
					
					case "mateo_recieve": //8
					scr_text("Trajiste la galleta...","Mateo");
					scr_text_float(0, 65)
					scr_option("Dar galleta","mateo_give")
					obj_progress.mateo_progress = 9;
					break;
					
					case "mateo_give": //9
					{
					with (obj_textbox) 
					{
					x_displacement_spr = 30;
					y_displacement_spr = 165;
					}	
					scr_text("¡Aqui tienes!","Mateo");
					scr_text("Obtuviste llave de la puerta principal.");
					scr_text("Hermanita, por favor ten cuidado.","Mateo");
					obj_progress.key_street = true;
					obj_progress.mateo_progress = 10;
					}
					
					
					case "mateo_done": //10
					with (obj_textbox) 
					{
					x_displacement_spr = 30;
					y_displacement_spr = 165;
					}
					scr_text("...nom nom...ay, esta muy rica...","Mateo");
					break;
					
		
		//dialogo con CUERVO
		case "cuervo_1":
		scr_text("Kraaa.....Kraaaa....Kraaaa...");
		obj_progress.crow_progress = 2;
		break;
		
		case "cuervo_2":
		scr_text("Pssst....psst");
		scr_text("Oye niña...si, tu...cof...cof");
		scr_text("Te hablo desde el otro lado del muro.");
		obj_progress.crow_progress = 3;
		break;
		
		case "cuervo_3":
		with (obj_textbox) 
				{
				x_displacement_spr = 25;
				y_displacement_spr = 160;
				}
				scr_text("¿Quien habla?","Andrea");
				obj_progress.crow_progress = 4;
		break;
		
		case "cuervo_4":
		scr_text("Eso no importa.");
		scr_text("Ambos sabemos la verdad. ¿No es asi?");
		scr_text("Ya te has dado cuenta. Este mundo, tan superficial... se esta cayendose a pedazos.");
		scr_text("Yo puedo ayudarte a escapar...");
		obj_progress.crow_progress = 5;
		break;
		
		case "cuervo_5":
		with (obj_textbox) 
				{
				x_displacement_spr = 25;
				y_displacement_spr = 160;
				}
		scr_text ("Si quiero...este lugar me da miedo...","Andrea");
		scr_text ("¿Pero que te llevas a cambio?","Andrea");
		obj_progress.crow_progress = 6;
		break;
		
		case "cuervo_6":
		scr_text("¡Escapar tontita! Kraaa...");
		scr_text("Si me ayudas podremos irnos juntos.");
		scr_text("¿Suena bien, eh?");
		obj_progress.crow_progress = 7;
		break;
		
		case "cuervo_7":
		with (obj_textbox) 
				{
				x_displacement_spr = 25;
				y_displacement_spr = 160;
				}
		scr_text ("Esta bien...que necesitas de mi.","Andrea");
		obj_progress.crow_progress = 8;
		break;
		
		case "cuervo_8":
		scr_text("Escuche tu conversación antes...");
		scr_text("Necesitas una galleta...cof...cof");
		scr_text("Ten, toma esta llave.");
		scr_text("Obtuviste una llave de repostero");
		scr_text("Ve al repostero de la sala, ahi conseguiras la llave del closet de la cocina.");
		obj_progress.key_repos = true;
		obj_progress.crow_progress = 9;
		break;
		
		case "cuervo_9":
		scr_text("Apresurate...kraaa...cof cof...");
		scr_text("Vuelve apenas tengas la llave de la puerta principal.");
		break;
		
		case "cuervo_10":
		scr_text("Por fin...kraaa...cof cof...");
		scr_text("Escucha atentamente, necesito que salgas y traigas una palanca de la cabaña.");
		scr_text("Es la única forma de derribar este muro");
		obj_progress.crow_progress = 10;
		break;
		
		case "cuervo_11":
		scr_text("Apresurate...kraaa...cof cof...");
		scr_text("Vuelve apenas tengas la palanca");
		break;
		
		case "cuervo_12":
		scr_text("BIEN, MUY BIEN KRAAA...¡Ahora a derribar el muro!");
		obj_progress.crowbar_sala = true;
		break;
		
		
		//dialogo con TRAUMA
		case "trauma_1":
		with (obj_textbox) 
				{
				x_displacement_spr = 25;
				y_displacement_spr = 160;
				}
		scr_text ("JEJEJEJE","Cuervo");
		scr_text_shake(0,35)
		break;
		
		
		
	//-----------------------------//-----------------------------//-----------------------------
	//-----------------------------//-----------------------------//-----------------------------
	//-----------------------------//-----------------------------//-----------------------------
	//-----------------------------//---------------2--------------//-----------------------------
	//---2---------------------2-----//-----------------------------//------------2-----------------
	//-----------2------------------//-----------------------------//-----------------------------
	//-----------------------------//-----------------------------//----------------2-------------
	//-----------------------------//-----2------2------------------//-----------------------------
	//-----------------------------//--------------------------2---//-----------------------------
	//-----------------------------//-----2------------------------//-----------------------------
	//--------------2---------------//-----------------------------//-----------------------------
	//-----------------------------//-----------------------------//-----------------------------
	//-----------------------------//-------2----------------------//----------2---------2----------
	//-----------------------------//------------------2-----------//-----------------------------
	//------2--2---------------------//-----------------------------//-----------------------------
	//----------------------2----2---//----------2-------------------//-----------------------------
	//-----------------------------//-----------------------------//-----------------------------
	//---2--------------2------------//-------2-----------2-----------//-----------------------------
	//-----------------------------//-----------------------------//------------2-----------------
	//-----------------------------//-----------------------------//-----------------------------
	//----------2-------------------//-----------------------------//-----------------------------
	//--------------2---------------//--2----------------2-----------//--------------2--------------
	//-----------------------------//-----------------------------//-----------------------------
	//---------------2--------------//-----------------------------//-------------------2---2-------
	//-----------------------------//------2-----------------------//-----------------------------
	//--------2---------------------//-----------------------------//--2---------------------------
	//----------------------2-------//-------------------2----------//-----------------------------
	//-----------------------------//-----------------------------//----------2-------------------
	//-----------------------------//----------2-------------------//---------------------2--------
	//-----------------------------//-----------------------------//-----------------------------
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