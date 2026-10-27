// Вращение портала
image_angle += 1.5;
if (image_angle >= 360) image_angle -= 360;

// Плавное появление
if (image_alpha < target_alpha) image_alpha += 0.02;

// Спавн Прайма
if (image_alpha >= 1 && !prime_spawned) {
    spawn_timer -= 1;
    
    if (spawn_timer <= 0) {
        prime_spawned = true;
        global.cutscene = true;
        
        // Универсальное имя слоя
        var _layer = "Instances";
        if (layer_exists("Instances_1")) _layer = "Instances_1";
        
        // Создаём Прайма
        instance_create_layer(x, y, _layer, obj_artem_prime);
        
        // Звук
        if (audio_exists(snd_portal)) {
            audio_play_sound(snd_portal, 8, false);
        }
        
        // Диалог
        if (!instance_exists(obj_dialogue_prime)) {
            instance_create_layer(0, 0, _layer, obj_dialogue_prime);
        }
    }
}

// Закрытие портала
if (prime_spawned && !instance_exists(obj_artem_prime)) {
    image_alpha -= 0.03;
    if (image_alpha <= 0) instance_destroy();
}