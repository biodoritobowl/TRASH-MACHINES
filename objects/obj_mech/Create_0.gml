randomise()

xspd = 0;
yspd = 0;

accel = 0.1;
drag = 0.95;
max_speed = 4;

move_dir = random(360);
facing_dir = move_dir;

change_timer = irandom_range(30,120);

stunned = false;

bounce_x = 0;
bounce_y = 0;

drunk = false;

radius = 16;
mass = 4