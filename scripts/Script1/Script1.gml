function circle_collision(a, b){
	return point_distance(a.x, a.y, b.x, b.y) < a.radius + b.radius;
}

function physics_impact(a, b){
	var dir = point_direction(a.x, a.y, b.x, b.y);
	
	var force = 4;
	
	a.xspd += lengthdir_x(-force / a.mass, dir);
	a.yspd += lengthdir_y(-force / a.mass, dir);
	
	b.xspd += lengthdir_x(-force / b.mass, dir);
	b.yspd += lengthdir_y(-force / b.mass, dir);
}