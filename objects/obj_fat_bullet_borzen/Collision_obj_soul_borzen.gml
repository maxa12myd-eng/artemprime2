if (other.invincible <= 0) {
    if (instance_exists(obj_battle_borzen)) {
        obj_battle_borzen.player_hp -= 2;
    }
    other.invincible = 30;
    if (audio_exists(snd_hurt)) audio_play_sound(snd_hurt, 15, false);
    instance_destroy();
}