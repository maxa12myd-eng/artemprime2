global.cutscene = true;
if (state == "walking") {
    if (x < target_x) {
        x += walk_speed;
    } else {
        x = target_x;
        state = "talking";
        
        if (!instance_exists(obj_dialogue)) {
            instance_create_layer(0, 0, "Instances", obj_dialogue);
        }
    }
}