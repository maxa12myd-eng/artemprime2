depth = -100;
dialog_index = 0;
type_pos = 0;
type_speed = 1;
done_typing = false;
finished = false;

dialog_lines = [
    // === АРТЁМ ОДИН ===
    {who: "artem",       text: "..."},
    {who: "artem",       text: "Я не могу поверить, что их больше нет..."},
    {who: "artem",       text: "Жека... Махмуд... Простите меня."},
    {who: "artem",       text: "Я не смог вас спасти."},
    {who: "artem",       text: "Мы ведь просто хотели погулять..."},
    {who: "artem",       text: "И в CS2 поиграть..."},
    {who: "artem",       text: "А теперь..."},
    
    // === ПОРТАЛ №1 ===
    {who: "narrator",    text: "Вдруг в туалете открылся фиолетовый портал..."},
    {who: "narrator",    text: "Из него вышел... Злой Махмуд."},
    {who: "evil_mahmud", text: "Здравствуй, Артём."},
    {who: "artem",       text: "Т-ты кто?! Ты похож на Махмуда..."},
    {who: "evil_mahmud", text: "Я-Махмуд. Но не твой."},
    {who: "evil_mahmud", text: "Я из другого мира. Из другой вселенной."},
    {who: "evil_mahmud", text: "И я знаю, что Артём Прайм убил твоего Махмуда."},
    {who: "evil_mahmud", text: "И твоего Жеку."},
    {who: "artem",       text: "..."},
    
    // === ПОРТАЛ №2 ===
    {who: "narrator",    text: "Открылся второй портал..."},
    {who: "narrator",    text: "Из него вышел Жека T-3000."},
    {who: "artem",       text: "Жека?! Ты... ты робот?"},
    {who: "zheka_t3000", text: "T-3000. Терминатор-модель."},
    {who: "zheka_t3000", text: "В моей вселенной Прайм тоже убил моего Артёма."},
    {who: "zheka_t3000", text: "И моего Махмуда."},
    {who: "zheka_t3000", text: "Этот ублюдок убивает всех, кто мешает Артёму убираться."},
    
    // === ПЛАН ===
    {who: "evil_mahmud", text: "Слушай внимательно, Артём."},
    {who: "evil_mahmud", text: "Прайм не остановится."},
    {who: "evil_mahmud", text: "Он уничтожит друзей каждого Артёма."},
    {who: "evil_mahmud", text: "Во всех вселенных."},
    {who: "zheka_t3000", text: "Он ищет того Артёма, который гениальнее, чем Прайм."},
    {who: "zheka_t3000", text: "Того, кто сможет его остановить."},
    {who: "artem",       text: "И что нам делать?"},
    {who: "evil_mahmud", text: "Объединиться."},
    {who: "evil_mahmud", text: "Я-стратег. Я знаю, как он думает."},
    {who: "zheka_t3000", text: "Я- техник. У меня гаджеты, оружие, порталы."},
    {who: "zheka_t3000", text: "И я могу взломать его швабру."},
    {who: "evil_mahmud", text: "А ты, Артём..."},
    {who: "evil_mahmud", text: "Ты - тот, кем он был."},
    {who: "evil_mahmud", text: "Ты знаешь его слабости."},
    
    // === СОГЛАСИЕ ===
    {who: "zheka_t3000", text: "Мы объединяемся. Ты с нами?"},
    {who: "artem",       text: "..."},
    {who: "artem",       text: "Да."},
    {who: "artem",       text: "Я хочу ему отомстить."},
    {who: "artem",       text: "За Жеку. За Махмуда."},
    {who: "artem",       text: "За всех, кого он убил."},
    {who: "evil_mahmud", text: "Хорошо."},
    {who: "evil_mahmud", text: "Тогда слушай."},
    
    // === МЕСТО ===
    {who: "zheka_t3000", text: "Прайм улетел на планету грязи."},
    {who: "zheka_t3000", text: "Планета, где никто не убирается уже 1000 лет."},
    {who: "evil_mahmud", text: "Там всё покрыто грязью. Мусором. Отбросами."},
    {who: "evil_mahmud", text: "Прайм хочет её очистить."},
    {who: "evil_mahmud", text: "Уничтожить её."},
    {who: "zheka_t3000", text: "Но там живут существа."},
    {who: "zheka_t3000", text: "Грязные монстры."},
    {who: "zheka_t3000", text: "И босс планеты - Гладков Матвей."},
    {who: "artem",       text: "Кто это?"},
    {who: "evil_mahmud", text: "Худой тип. Чуть-чуть в говне."},
    {who: "evil_mahmud", text: "И его пёс - Борзен."},
    {who: "zheka_t3000", text: "Борзен — это отдельная проблема."},
    {who: "zheka_t3000", text: "Пёс, но с душой человека."},
    {who: "zheka_t3000", text: "Мыслит как человек. Говорит как человек."},
    {who: "evil_mahmud", text: "Но выглядит как жирный пёс."},
    {who: "artem",       text: "И там Прайм?"},
    {who: "evil_mahmud", text: "Да. Он там."},
    {who: "zheka_t3000", text: "И мы туда идём."},
    
    // === КОНЕЦ ===
    {who: "artem",       text: "Погнали."},
    {who: "narrator",    text: "Портал открылся. Трое шагнули в неизвестность..."},
    {who: "narrator",    text: "[ ГЛАВА 3 — ПЛАНЕТА ГРЯЗИ ]"}
];