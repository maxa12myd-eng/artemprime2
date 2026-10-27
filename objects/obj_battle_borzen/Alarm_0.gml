if (state == "fight") {
    if (enemy_hp <= 0) {
        // Если Борзен мертв, запускаем предсмертный диалог
        state = "death_dialog";
        death_index = 0;
        monster_dialog = death_dialog[death_index];
        
        // Выключаем боевую музыку, включаем эмбиент
        audio_stop_all();
        if (audio_exists(snd_but_nobody_came)) {
            audio_play_sound(snd_but_nobody_came, 10, true);
        }
    } else {
        // Если жив, показываем урон
        state = "dialog";
    }
    fight_hit = false;
}