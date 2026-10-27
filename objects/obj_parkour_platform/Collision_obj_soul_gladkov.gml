if (other.invincible <= 0) {
    if (instance_exists(obj_battle_gladkov)) {
        obj_battle_gladkov.player_hp -= 2;
    }
    other.invincible = 180; // 3 СЕКУНДЫ НЕУЯЗВИМОСТИ
    // Платформу не удаляем, она летит дальше
}