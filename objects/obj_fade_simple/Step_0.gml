if (mode == "out") {
    alpha += speed;
    if (alpha >= 1) {
        alpha = 1;
        if (next_room != -1) {
            room_goto(next_room); // Переходим в комнату
        } else {
            instance_destroy(); // Если комната не указана, просто удаляемся
        }
    }
} else if (mode == "in") {
    alpha -= speed;
    if (alpha <= 0) {
        alpha = 0;
        instance_destroy(); // Проявились - удаляем фейд
    }
}