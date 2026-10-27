// Плавно меняем прозрачность
if (alpha < target_alpha) {
    alpha = min(alpha + fade_speed, target_alpha);
} else if (alpha > target_alpha) {
    alpha = max(alpha - fade_speed, target_alpha);
} else {
    // Мы достигли цели
    if (next_room != -1) {
        // Если есть комната для перехода - идем туда
        room_goto(next_room);
    } else if (alpha == 0) {
        // Если мы проявились (стали прозрачными) - удаляем себя
        instance_destroy();
    }
}