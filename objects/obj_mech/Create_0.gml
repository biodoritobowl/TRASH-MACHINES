randomise();

// ================================================
// STATS DO MECH
// ================================================
hp        = irandom_range(100, 350); // REMOVER ALEATÓRIO QUANDO POSSÍVEL
locked_hp = hp;
armor     = 0;
strike    = irandom_range(5, 15);
mass      = irandom_range(1, 6); // REMOVER ALEATÓRIO QUANDO POSSÍVEL
radius    = 32;
accel     = 0.09;
max_speed = irandom_range(2, 8);       // REMOVER ALEATÓRIO QUANDO POSSÍVEL
drag      = random_range(0.60, 0.95); // REMOVER ALEATÓRIO QUANDO POSSÍVEL

// ================================================
// MOVIMENTO
// ================================================
xspd       = 0;
yspd       = 0;
move_dir   = random(360);
facing_dir = move_dir;

// ================================================
// ESTADOS
// ================================================
stunned      = false;
drunk        = false;
change_timer = irandom_range(30, 120);
bounce_x     = 0;
bounce_y     = 0;
hit_cooldown = false

// ================================================
// VISUAL
// ================================================
image_index = irandom(sprite_get_number(spr_mechs) - 1);