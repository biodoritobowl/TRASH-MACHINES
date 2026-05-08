function circle_collision(a, b){
	return point_distance(a.x, a.y, b.x, b.y) < a.radius + b.radius;
}

function physics_impact(a, b)
{
    var dir = point_direction(a.x, a.y, b.x, b.y);
	
	var dist = point_distance(a.x, a.y, b.x, b.y);
	
	var overlap = (a.radius + b.radius) - dist;
	
	if(overlap > 0){
		var sep = overlap * 0.5
		
		a.x += lengthdir_x(-sep, dir);
		a.y += lengthdir_y(-sep, dir);
		
		b.x += lengthdir_x(sep, dir);
		b.y += lengthdir_y(sep, dir);
	}
	
    var force = 4;

    a.xspd += lengthdir_x(force / a.mass, dir + 180);
    a.yspd += lengthdir_y(force / a.mass, dir + 180);

    b.xspd += lengthdir_x(force / b.mass, dir);
    b.yspd += lengthdir_y(force / b.mass, dir);
}

function strike_target(damage, target){
	target.hp -= damage;
}

function strike_momentum(damage, target, xspd, yspd){
	base_dmg = damage;
	
	if xspd >= yspd{momentum = xspd}else{momentum = yspd}
	final_dmg = round(base_dmg * momentum);
	
	strike_target(final_dmg, target);
}

function pick_strike(xspd, yspd, max_speed, damage, target){
	spd = point_distance(0, 0, xspd, yspd)
	if (spd >= max_speed){
		strike_momentum(damage, target, xspd, yspd);
	} else {
		strike_target(damage, target)
	}
}