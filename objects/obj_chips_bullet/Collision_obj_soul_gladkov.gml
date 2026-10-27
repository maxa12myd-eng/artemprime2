if (other.invincible <= 0) {
    if (instance_exists(obj_battle_gladkov)) {
        obj_battle_gladkov.player_hp -= 2;
    }
    other.invincible = 180; // 3 СЕКУНДЫ НЕУЯЗВИМОСТИ
    
    if (audio_exists(snd_hurt)) audio_play_sound(snd_hurt, 15, false);
    instance_destroy();
}