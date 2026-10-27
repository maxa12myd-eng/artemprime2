image_angle += 2; // Крутится
if (!instance_exists(obj_battle_gladkov)) { instance_destroy(); exit; }
if (x < -100 || x > 740 || y < -100 || y > 460) { instance_destroy(); }