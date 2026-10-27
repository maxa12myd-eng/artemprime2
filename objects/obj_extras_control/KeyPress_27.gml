// Глушим секретную музыку при выходе
if (audio_is_playing(snd_extras_music)) {
    audio_stop_sound(snd_extras_music);
}
// Возвращаем игрока в главное меню
room_goto(rm_game_menu);
