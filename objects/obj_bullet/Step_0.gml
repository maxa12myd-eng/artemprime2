// Если бой закончился - удаляем пулю
if (!instance_exists(obj_battle)) { 
    instance_destroy(); 
    exit; 
}

// Если пуля улетела далеко за пределы рамки - удаляем
if (x < obj_battle.box_x - 50 || x > obj_battle.box_x + obj_battle.box_w + 50 || y > obj_battle.box_y + obj_battle.box_h + 50) {
    instance_destroy();
}