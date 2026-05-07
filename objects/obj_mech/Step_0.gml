//================================================
// MOVIMENTO NORMAL
//================================================

if (!stunned)
{
    // muda direção aleatoriamente
	if(drunk){
		change_timer--;

	    if (change_timer <= 0)
	    {
	        move_dir += random_range(-90,90);
	        change_timer = irandom_range(30,120);
	    }
	}
    // aceleração
    xspd += lengthdir_x(accel, move_dir);
    yspd += lengthdir_y(accel, move_dir);
}



//================================================
// LIMITADOR DE VELOCIDADE
//================================================

var spd = point_distance(0,0,xspd,yspd);

if (spd > max_speed)
{
    var vel_dir = point_direction(0,0,xspd,yspd);

    xspd = lengthdir_x(max_speed, vel_dir);
    yspd = lengthdir_y(max_speed, vel_dir);
}



//================================================
// MOVIMENTO X
//================================================

var move_x = round(xspd);

repeat abs(move_x)
{
    x += sign(move_x);

    if (place_meeting(x,y,obj_wall) || place_meeting(x, y, other.radius))
    {
        // desfaz último pixel
        x -= sign(move_x);

        // salva bounce
        bounce_x = -xspd * 0.8;
        bounce_y = -yspd * 0.8;

        // trava mech
        xspd = 0;
        yspd = 0;

        stunned = true;

        // reflete direção
        move_dir = 180 - move_dir;

        // tempo do stun
        alarm[0] = 10;

        break;
    }
}



//================================================
// MOVIMENTO Y
//================================================

var move_y = round(yspd);

repeat abs(move_y)
{
    y += sign(move_y);

    if (place_meeting(x,y,obj_wall))
    {
        y -= sign(move_y);

        bounce_x = -xspd * 0.8;
        bounce_y = -yspd * 0.8;

        xspd = 0;
        yspd = 0;

        stunned = true;

        move_dir = -move_dir;

        alarm[0] = 10;
        break;
    }
}



//================================================
// DRAG
//================================================

if (!stunned)
{
    xspd *= drag;
    yspd *= drag;
}



//================================================
// FACING
//================================================

spd = point_distance(0,0,xspd,yspd);

if (spd > 0.1)
{
    var target_dir = point_direction(0,0,xspd,yspd);

    facing_dir = lerp(facing_dir,target_dir,0.1);
}



//================================================
// VISUAL
//================================================

image_angle = facing_dir;