if (invincible <= 0) {
    if (instance_exists(obj_battle_gladkov)) obj_battle_gladkov.player_hp -= 3; // Кости бьют на 3 HP
    invincible = 30;
    with(other) instance_destroy(); // Удаляем кость при попадании
}