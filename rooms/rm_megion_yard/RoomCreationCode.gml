// Эмбиент с начала
if (audio_exists(snd_but_nobody_came)) {
    audio_stop_all();
    audio_play_sound(snd_but_nobody_came, 10, true);
}

// Диалог НЕ запускаем сразу — ждём триггер