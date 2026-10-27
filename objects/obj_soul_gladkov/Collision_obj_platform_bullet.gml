if (invincible <= 0) {
    if (instance_exists(obj_battle_gladkov)) obj_battle_gladkov.player_hp -= 4; // Платформы бьют на 4 HP
    invincible = 30;
    // ВАЖНО: платформу не удаляем, она просто пролетает сквозь игрока
}