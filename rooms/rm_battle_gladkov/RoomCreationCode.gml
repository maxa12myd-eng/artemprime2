global.cutscene = false;
audio_stop_all(); // На всякий случай глушим всё перед боем

// Эффект появления (Фейд)
if (instance_exists(obj_screen_fade)) {
    var _f = instance_create_depth(0, 0, -9999, obj_screen_fade);
    _f.alpha = 1;
    _f.target_alpha = 0;
    _f.next_room = -1;
}