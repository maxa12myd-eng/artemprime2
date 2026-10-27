if (invincible <= 0) {
    if (instance_exists(obj_battle_borzen)) {
        obj_battle_borzen.player_hp -= 2;
    }
    invincible = 30;
    with(other) instance_destroy();
}