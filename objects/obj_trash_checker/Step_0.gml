show_debug_message("Мусора: " + string(global.trash_cleaned) + " / " + string(target_trash));

if (!portal_spawned && global.trash_cleaned >= target_trash) {
    show_debug_message("=== ПОРОГ ДОСТИГНУТ! СОЗДАЮ ПОРТАЛ ===");
    portal_spawned = true;
   instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_portal);
    if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 8, false);
}