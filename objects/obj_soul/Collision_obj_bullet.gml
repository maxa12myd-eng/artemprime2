if (invincible <= 0) {
    if (instance_exists(obj_battle)) {
        obj_battle.player_hp -= 2; // Отнимаем ХП
    }
    invincible = 30; // Даем неуязвимость на полсекунды
    with(other) instance_destroy(); // Удаляем пулю, в которую врезались
}