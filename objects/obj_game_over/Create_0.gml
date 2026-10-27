display_set_gui_size(640, 360); // Фиксируем размер GUI

// Музыка
if (audio_exists(snd_game_over)) {
    audio_stop_all();
    audio_play_sound(snd_game_over, 10, false);
}

// Переменные для печати
text = "Артем, не теряй решимость, верь в пипидастр.";
text_pos = 0;
text_speed = 0.5;
finished = false;