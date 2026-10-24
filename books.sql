CREATE TABLE books (
    id INT,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    price NUMERIC(8,2),
    pages INT,
    publish_year INT,
    publisher VARCHAR(50)
);

INSERT INTO books VALUES
(1,  'Əli və Nino',       'Qurban Səid',              'Roman',        12.50, 320, 1937, 'Azərnəşr'),
(2,  'Sehrli Şəhər',      'Aysel Rəhimova',           'Fantastika',   15.90, 410, 2019, 'Qanun'),
(3,  '1984',              'George Orwell',            'Antiutopiya',  14.00, 328, 1949, 'Penguin'),
(4,  'Kiçik Şahzadə',     'Antoine de Saint-Exupéry', 'Nağıl',         9.50,  96, 1943, 'Qanun'),
(5,  'Sapiens',           'Yuval Noah Harari',        'Tarix',        22.00, 512, 2011, 'Harper'),
(6,  'Atomic Habits',     'James Clear',              'Özünüinkişaf', 18.50, 320, 2018, 'Avery'),
(7,  'Python-a Giriş',    'Elnur Quliyev',            'Texnologiya',  25.00, 280, 2021, NULL),
(8,  'SQL Əsasları',      'Nərmin Əliyeva',           'Texnologiya',  19.90, 240, 2022, NULL),
(9,  'Cinayət və Cəza',   'Fyodor Dostoyevski',       'Roman',        16.00, 672, 1866, 'Penguin'),
(10, 'Qaranlıq Meşə',     'Rüfət Məmmədov',           NULL,           11.00, 200, 2015, 'Azərnəşr'),
(11, 'Dünya Tarixi',      'Tofiq Hüseynov',           'Tarix',        30.00, 800, 2009, 'Qanun'),
(12, 'Şəhərin Sirri',     'Aysel Babayeva',           'Detektiv',     13.50, 260, 2020, 'Azərnəşr');

--Task 1
--books cədvəlindəki bütün sətirləri və bütün sütunları göstərin.
select * from books;

--Task2
--Yalnız title, author və price sütunlarını göstərin.
select title,author,price from books;

--Task3
--title sütununu Kitab, price sütununu Qiymət alias-ı ilə göstərin.
select title as kitab,price as qiymet from books;

--Task4
--Hər kitab üçün 20% endirimli qiyməti (price * 0.8) discounted_price adı ilə göstərin.
select price*0.8 as discounted_price from books;

--Task5
-- Cədvəldə hansı fərqli janrların (genre) olduğunu təkrarsız göstərin (DISTINCT).
select distinct genre from books;

--Task6
--Qiyməti 15-dən çox olan kitabları göstərin.

select price from books where price>15;

--Task7
--Janrı Texnologiya olan kitabların adını və müəllifini göstərin.
select title,author from books where genre='Texnologiya';

--Task8
--Qiyməti 10 ilə 20 arasında olan kitabları göstərin (BETWEEN).
select title,price from books where price between 10 and 20;

--Task9
--Janrı Roman və ya Detektiv olan kitabları göstərin (IN).
select title,genre from books where genre IN('Roman','Detektiv');

--Task10
--2015-ci ildən sonra nəşr olunan kitabları göstərin.
select title,publish_year from books where publish_year>2015;

--Task11
--Nəşriyyatı Azərnəşr və səhifə sayı 250-dən çox olan kitabları göstərin (AND).
select title,pages from books where publisher='Azərnəşr' and pages>250;

--Task12
--Nəşriyyatı məlum olmayan (NULL) kitabları göstərin (IS NULL).
select title,publisher from books where publisher Is Null;

--Task13
--Janrı təyin olunmayan kitabları göstərin.
select title,genre from books where genre Is Null;

--Task14
--Janrı Tarix olmayan kitabları göstərin (<> və ya NOT). Nəticədə janrı NULL olan kitab var mı? Niyə?
select title,genre from books where genre <> 'Tarix';
--SQL-də NULL konkret dəyər deyil, məlumatın olmadığını bildirir.

--Task15
--Adı S hərfi ilə başlayan kitabları göstərin.
select title from books where title like 'S%';

--Task16
--Müəllifinin soyadı ov ilə bitən kitabları göstərin.
select title,author from books where author like '%ov';

--Task17
--Adında Tarix sözü olan kitabları göstərin.
select title from books where title like '%Tarix%';

--Task18
--Bütün kitabları qiymətə görə böyükdən kiçiyə sıralayın.
select title,price from books  ORDER BY price DESC;

--Task19
--Kitabları əvvəlcə genre-yə görə əlifba sırası ilə, sonra qiymətə görə azalan sıralayın.
select genre,price from books Order by genre asc,price desc;

--Task20
--Ən bahalı 3 kitabı göstərin.
select title,price from books order by price desc limit 3;

--Task21
--Ən son nəşr olunmuş 2 kitabı göstərin.
select title,publish_year from books order by publish_year desc limit 2;

--Task22
--Qiymətə görə böyükdən kiçiyə sıralanmış siyahıda 3-cü, 4-cü və 5-ci kitabları göstərin (LIMIT və OFFSET).
select title,price from books order by price desc limit 3 Offset 2;

