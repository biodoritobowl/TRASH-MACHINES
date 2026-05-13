var total = instance_number(obj_mech);

for (var i = 0; i < total; i++)
{
    var mecha = instance_find(obj_mech, i);

    // posição na tela
    var xx = mecha.x;
    var yy = mecha.y - 40; // acima do mech

    // valores de vida
    var hp_max = mecha.hp_max;
    var hp_now = mecha.hp;

    var bar_w = 40;
    var pct = hp_now / hp_max;

    // fundo
    draw_set_color(c_black);
    draw_rectangle(xx - bar_w/2, yy, xx + bar_w/2, yy + 6, false);

    // vida
    draw_set_color(c_lime);
    draw_rectangle(xx - bar_w/2, yy, xx - bar_w/2 + (bar_w * pct), yy + 6, false);
}