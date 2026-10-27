if (!variable_global_exists("global_lv")) {
    global_lv = 1; // Изначально 1 уровень
}
if (!variable_global_exists("player_max_hp")) {
    global.player_max_hp = 20;
}
// Стандартный размер (если в комнате не указано другое)
my_scale = 1.5; 

image_xscale = my_scale;
image_yscale = my_scale;
image_alpha = 1;

// Инициализация глобального здоровья (если его еще нет)
if (!variable_global_exists("player_hp")) {
    global.player_hp = 20;
    global.player_max_hp = 20;
}