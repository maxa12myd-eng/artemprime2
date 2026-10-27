alpha += 0.05; // Скорость затемнения

if (alpha >= 1) {
    alpha = 1;
    // Если комната указана - переходим в нее
    if (next_room != -1) {
        room_goto(next_room); 
    } else {
        instance_destroy(); // Если комнаты нет, просто удаляемся
    }
}