randomise();

// ================================================
// STATS DO MECH
// ================================================
hp        = irandom_range(100, 150); // REMOVER ALEATÓRIO QUANDO POSSÍVEL
hp_max = hp;
locked_hp = hp;
armor     = 0;
strike    = irandom_range(15, 25);
mass      = irandom_range(1, 6); // REMOVER ALEATÓRIO QUANDO POSSÍVEL
radius    = 32;
accel     = 0.09;
max_speed = irandom_range(12, 16);       // REMOVER ALEATÓRIO QUANDO POSSÍVEL
drag      = random_range(0.95, 1); // REMOVER ALEATÓRIO QUANDO POSSÍVEL

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



color = irandom(17)

switch (color) {

    case 1:
        image_blend = c_white;
        break;

    case 2:
        break;

    case 3:
        image_blend = c_gray;
        break;

    case 4:
        image_blend = c_silver;
        break;

    case 5:
        image_blend = c_red;
        break;

    case 6:
        image_blend = c_lime;
        break;

    case 7:
        image_blend = c_green;
        break;

    case 8:
        image_blend = c_blue;
        break;

    case 9:
        image_blend = c_aqua;
        break;

    case 10:
        image_blend = c_fuchsia;
        break;

    case 11:
        image_blend = c_yellow;
        break;

    case 12:
        image_blend = c_orange;
        break;

    case 13:
        image_blend = c_maroon;
        break;

    case 14:
        image_blend = c_navy;
        break;

    case 15:
        image_blend = c_teal;
        break;

    case 16:
        image_blend = c_purple;
        break;

    case 17:
        image_blend = c_olive;
        break;
}