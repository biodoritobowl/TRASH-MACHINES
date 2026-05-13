//================================================
// MOVIMENTO NORMAL
//================================================
if (!stunned)
{
    if (drunk)
    {
        change_timer--;

        if (change_timer <= 0)
        {
            move_dir += random_range(-90, 90);
            change_timer = irandom_range(30, 120);
        }
    }

    // aceleração
    xspd += lengthdir_x(accel, move_dir);
    yspd += lengthdir_y(accel, move_dir);
}

//================================================
// LIMITADOR DE VELOCIDADE
//================================================
var spd = point_distance(0, 0, xspd, yspd);

if (spd > max_speed)
{
    var vel_dir = point_direction(0, 0, xspd, yspd);

    xspd = lengthdir_x(max_speed, vel_dir);
    yspd = lengthdir_y(max_speed, vel_dir);
}

//================================================
// COLISÃO X
//================================================
if (place_meeting(x + xspd, y, obj_wall))
{
    while (!place_meeting(x + sign(xspd), y, obj_wall))
    {
        x += sign(xspd);
    }

    // rebate horizontalmente
    move_dir = point_direction(
        0,
        0,
        -lengthdir_x(1, move_dir),
         lengthdir_y(1, move_dir)
    );

    bounce_x = -xspd * 0.8;

    xspd = 0;

    stunned = true;
    alarm[0] = 1;
}
else
{
    x += xspd;
}

//================================================
// COLISÃO Y
//================================================
if (place_meeting(x, y + yspd, obj_wall))
{
    while (!place_meeting(x, y + sign(yspd), obj_wall))
    {
        y += sign(yspd);
    }

    // rebate verticalmente
    move_dir = point_direction(
        0,
        0,
         lengthdir_x(1, move_dir),
        -lengthdir_y(1, move_dir)
    );

    bounce_y = -yspd * 0.8;

    yspd = 0;

    stunned = true;
    alarm[0] = 1;
}
else
{
    y += yspd;
}



//================================================
// DRAG
//================================================
if (!stunned)
{
    xspd *= drag;
    yspd *= drag;

    var curr_spd = point_distance(0, 0, xspd, yspd);

    if (curr_spd > 0.1)
    {
        var target_dir = point_direction(0, 0, xspd, yspd);

        facing_dir = lerp(facing_dir, target_dir, 0.1);
    }
}

//================================================
// FLIP DO SPRITE
//================================================
if (abs(xspd) > 0.1)
{
    image_xscale = sign(xspd);
}

//================================================
// MORTE
//================================================
if (hp <= 0)
{
    hp = 0;

    xspd = 0;
    yspd = 0;

    max_speed = 0;
    strike = 0;

    image_blend = c_red;
}