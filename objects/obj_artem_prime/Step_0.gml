// Уход в портал
if (leaving) {
    appear_progress -= appear_speed;
    if (appear_progress < 0) appear_progress = 0;
    
    x = lerp(start_x, target_x, appear_progress);
    y = lerp(start_y, target_y, appear_progress);
    image_alpha -= 0.03;
    
    if (image_alpha <= 0) instance_destroy();
    exit;
}

// Появление из портала
if (image_alpha < alpha_target) image_alpha += 0.03;

if (appear_progress < 1) {
    appear_progress += appear_speed;
    if (appear_progress > 1) appear_progress = 1;
    x = lerp(start_x, target_x, appear_progress);
    y = lerp(start_y, target_y, appear_progress);
}

sprite_index = spr_artem_prime;
image_xscale = 1.5;
image_yscale = 1.5;