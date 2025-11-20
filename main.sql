
CREATE TABLE categories (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT    NOT NULL,
    description TEXT,
    parent_id   INTEGER,               
    created_at  DATE    NOT NULL DEFAULT (date('now')),
    FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE SET NULL
);



INSERT INTO categories (name, description, parent_id, created_at) VALUES
('Elektronika',        'Barcha elektron qurilmalar', NULL,       '2023-06-15'),
('Kiyim-kechak',       'Erkak, ayol va bolalar kiyimlari', NULL, '2023-08-20'),
('Uy-ro‘zg‘or buyumlari', 'Uy uchun hamma narsa', NULL,      '2023-09-10'),
('Smartfonlar',        'Mobil telefonlar', 1,                   '2023-12-12'),
('Noutbuklar',         'Ish va o‘yin uchun noutbuklar', 1,      '2024-01-05'),
('Televizorlar',       'LED, OLED, QLED TV', 1,                 '2024-02-18'),
('Erkak kiyimlari',    'Kostyum, ko‘ylak, shimlar', 2,          '2024-03-20'),
('Ayollar kiyimlari',  'Liboslar, yubkalar, bluzkalar', 2,     '2024-04-10'),
('Bolalar kiyimlari',  '0-14 yoshgacha kiyimlar', 2,           '2024-05-15'),
('Mebellar',           'Divan, stol, stullar', 3,              '2024-06-25'),
('Maishiy texnika',    'Kir yuvish mashinasi, muzlatgich', 3,  '2024-07-30'),
('Oshxona anjomlari',  'Idishlar, pichoqlar, qozonlar', 3,     '2024-08-12'),
('Quloqchinlar',       'Simli va simsiz quloqchinlar', 1,       '2025-01-20'),
('Planshetlar',        'Apple, Samsung, Xiaomi planshetlari', 1,'2025-02-05'),
('Krossovkalar',       'Sport va kundalik poyabzallar', 2,      '2025-03-10'),
('Zargarlik buyumlari','Uzuk, sirg‘a, marjonlar', NULL,        '2024-01-20'),
('Kitoblar',           'Adabiyot, ilmiy, bolalar kitoblari', NULL,'2023-11-11');



SELECT id, name, description
FROM categories
WHERE parent_id IS NULL;



SELECT 
    p.name AS asosiy_kategoriya,
    COUNT(c.id) AS ichki_kategoriyalar_soni
FROM categories p
LEFT JOIN categories c ON c.parent_id = p.id
WHERE p.parent_id IS NULL
GROUP BY p.id, p.name
ORDER BY ichki_kategoriyalar_soni DESC;



SELECT *
FROM categories
WHERE created_at > '2024-01-16'
ORDER BY created_at ASC;



SELECT c.*
FROM categories p
JOIN categories c ON c.parent_id = p.id
WHERE p.name = 'Elektronika';



SELECT id, name, created_at
FROM categories
WHERE name LIKE '%lar';



SELECT *
FROM categories
ORDER BY created_at ASC
LIMIT 3;



SELECT 
    printf('%s%s', repeat('    ', (CASE WHEN parent_id IS NULL THEN 0 ELSE 1 END)), name) AS kategoriya_hierarxiyasi,
    id, parent_id, created_at
FROM categories
ORDER BY parent_id, created_at;
