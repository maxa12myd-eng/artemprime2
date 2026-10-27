// Проверяем именно бой с Борзеном!
if (!instance_exists(obj_battle_borzen)) { 
    instance_destroy(); 
    exit; 
}

// Удаляем, если улетел за пределы экрана
if (x < -100 || x > 740 || y < -100 || y > 460) { 
    instance_destroy(); 
}