// Крутим чипсы в полете, чтобы было красиво
image_angle += 4; 

if (!instance_exists(obj_battle_gladkov)) { instance_destroy(); exit; }

// Удаление за пределами экрана
if (x < -100 || x > 740 || y < -100 || y > 460) {
    instance_destroy();
}