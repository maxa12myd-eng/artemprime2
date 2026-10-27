// Включаем шрифт андертейла
draw_set_font(fnt_undertale);

// 1. РИСУЕМ КАРТИНКУ АРТЁМА ПРАЙМА СВЕРХУ СПРАВА
if (sprite_exists(spr_artem_prime_lore)) {
    var _img_height = sprite_get_height(spr_artem_prime_lore);
    var _scale = room_height / _img_height; 
    // Сдвинули картинку чуть правее, чтобы она была фоном
    draw_sprite_ext(spr_artem_prime_lore, 0, room_width * 0.75, room_height / 2, _scale, _scale, 0, c_white, 1);
}

// НАСТРОЙКИ ТЕКСТА (Выравнивание по левому краю)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _shadow_offset = 1; // Маленькая тень под маленькое разрешение

// 2. ВЫВОДИМ ЗАГОЛОВОК (Ужали масштаб до 0.8)
var _title_text = "= ХРОНИКИ АРТЁМА ПРАЙМА =";
var _title_scale = 0.8;

draw_set_color(c_black);
draw_text_transformed(15 + _shadow_offset, 15 + _shadow_offset, _title_text, _title_scale, _title_scale, 0);
draw_set_color(c_yellow);
draw_text_transformed(15, 15, _title_text, _title_scale, _title_scale, 0);


// 3. ВЫВОДИМ ЖИРНЫЙ ЛОР ИГРЫ (Масштаб уменьшен до 0.53, чтобы всё влезло аккуратно)
var _lore_text = "Артём Прайм — первый из Артёмов, кто\n" +
                 "полностью уничтожил в себе лень.\n" +
                 "Его мифический пипидастр способен\n" +
                 "вычистить саму ткань пространства.\n\n" +
                 "Он путешествует по мультивселенной\n" +
                 "и заставляет другие версии себя брать\n" +
                 "в руки швабру, уничтожая их катки в\n" +
                 "комп и прогулки с пацанами.\n\n" +
                 "Но делает он это не ради забавы.\n" +
                 "Прайм ищет Оригинального Артёма —\n" +
                 "единственного, кто сможет превзойти\n" +
                 "его в клининге и остановить этот\n" +
                 "бесконечный цикл абсолютной уборки.";

var _text_scale = 0.53; 

// Чёрная тень лора (перенос строк на ширину 260 пикселей, чтобы не залезать на лицо Артёма)
draw_set_color(c_black);
draw_text_ext_transformed(15 + _shadow_offset, 45 + _shadow_offset, _lore_text, 14, 260, _text_scale, _text_scale, 0);
// Белый текст лора
draw_set_color(c_white);
draw_text_ext_transformed(15, 45, _lore_text, 14, 260, _text_scale, _text_scale, 0);


// 4. ПОДСКАЗКА ДЛЯ ВЫХОДА ВНИЗУ ЭКРАНА (Масштаб 0.5)
var _exit_text = "[ Нажмите ESC для выхода ]";
var _exit_scale = 0.5;
draw_set_color(c_black);
draw_text_transformed(15 + _shadow_offset, room_height - 20 + _shadow_offset, _exit_text, _exit_scale, _exit_scale, 0);
draw_set_color(c_gray);
draw_text_transformed(15, room_height - 20, _exit_text, _exit_scale, _exit_scale, 0);
