if (!global.cutscene) {
    global.cutscene = true;
    var _f = instance_create_depth(0, 0, -9999, obj_screen_fade);
    _f.alpha = 0;
    _f.target_alpha = 1;
    _f.next_room = rm_gladkov_meeting; 
}