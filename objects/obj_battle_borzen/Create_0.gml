display_set_gui_size(640, 360);
depth = 100; // Рисуем фон самым первым

// ... (дальше твой старый код: player_hp, enemy_hp, box_x, box_y и т.д.) ...\
display_set_gui_size(640, 360); 

// Статы
if (!variable_global_exists("player_hp")) global.player_hp = 20;
if (!variable_global_exists("player_max_hp")) global.player_max_hp = 20;
player_hp = global.player_hp;
player_max_hp = global.player_max_hp;

enemy_hp = 20; 
enemy_max_hp = 20;

// Состояния
state = "menu"; 
menu_index = 0;
menu_items = ["БИТВА", "ДЕЙСТВИЕ", "ВЕЩИ", "ПОЩАДА"];

// Рамка
box_w = 400;
box_h = 120;
box_x = (640 - box_w) / 2;
box_y = 170;

// Переменные боя
attack_timer = 0;
spawn_timer = 0;
pattern = 0;
monster_dialog = "";
shake_timer = 0;

// Fight Meter
fight_pos = 0;
fight_dir = 1;
fight_speed = 4;
fight_hit = false;

// Меню действий (ACT)
action_index = 0;
action_options = ["Сказать про жир", "Сказать про Гладкова", "Сказать про душу"];

// Предсмертный диалог
death_dialog = [
    "Борзен: Гладков... Он был для меня богом.",
    "Борзен: Я всегда хотел быть как он. Сильным. Безжалостным. Я во всем ему равнялся.",
    "Борзен: Я охранял эту свалку, убивал чистых... Я делал всё ради него.",
    "Борзен: Но когда я нуждался в нем... Когда я умирал от голода и боли...",
    "Борзен: Он просто выбросил меня, как сломанную игрушку. Он даже не пришел.",
    "Борзен: Теперь я просто умру... Как обычный бездомный пес. И поделом мне..."
];
death_index = 0;