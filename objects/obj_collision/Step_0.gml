//================================================
// COLISÃO ENTRE MECHS
//================================================

// percorre todos os mechs
with (obj_mech)
{
    var mech_a = id;

    // procura outros mechs
    with (obj_mech)
    {
        var mech_b = id;

        //------------------------------------------------
        // evita comparar consigo mesmo
        //------------------------------------------------
        if (mech_a == mech_b)
            continue;

        //------------------------------------------------
        // evita duplicar pares
        //------------------------------------------------
        if (mech_a.id > mech_b.id)
            continue;

        //------------------------------------------------
        // cooldown
        //------------------------------------------------
        if (mech_a.hit_cooldown || mech_b.hit_cooldown)
            continue;

        //------------------------------------------------
        // colisão circular
        //------------------------------------------------
        if (circle_collision(mech_a, mech_b))
        {
            //--------------------------------------------
            // IMPACTO
            //--------------------------------------------
            if (mech_a.mass > mech_b.mass)
            {
                physics_impact(mech_a, mech_b);
            }
            else
            {
                physics_impact(mech_b, mech_a);
            }

            //--------------------------------------------
            // DANO
            //--------------------------------------------
            pick_strike(
                mech_a.xspd,
                mech_a.yspd,
                mech_a.max_speed,
                mech_a.strike,
                mech_b
            );

            //--------------------------------------------
            // REFLEXÃO DIREÇÃO
            //--------------------------------------------
            var dir = point_direction(
                mech_a.x,
                mech_a.y,
                mech_b.x,
                mech_b.y
            );

            mech_a.move_dir = dir + 180;
            mech_b.move_dir = dir;

            //--------------------------------------------
            // ESTADOS
            //--------------------------------------------
            mech_a.hit_cooldown = true;
            mech_b.hit_cooldown = true;

            mech_a.stunned = true;
            mech_b.stunned = true;

            mech_a.locked_hp = mech_a.hp;
            mech_b.locked_hp = mech_b.hp;

            //--------------------------------------------
            // TIMER
            //--------------------------------------------
            mech_a.alarm[0] = 5;
            mech_b.alarm[0] = 5;
        }
    }
}