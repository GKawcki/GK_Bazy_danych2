create database firma2;
create schema ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50) not NULL,
    nazwisko VARCHAR(50) not NULL,
    adres VARCHAR(100) not NULL,
    telefon VARCHAR(15) not NULL
);

CREATE TABLE ksiegowosc.godziny (
    id_godziny INT PRIMARY KEY,
    data DATE,
    liczba_godzin INT not null
);

CREATE TABLE ksiegowosc.pensja (
    id_pensji INT PRIMARY KEY,
    stanowisko VARCHAR(50),
    kwota DECIMAL(10, 2) not null
);

CREATE TABLE ksiegowosc.premia (
    id_premii INT PRIMARY KEY,
    rodzaj VARCHAR(50),
    kwota DECIMAL(10, 2) not null
);

create table ksiegowosc.wynagrodzenie (
	id_wynagrodzenia INT primary key,
	data date,
	id_pracownika INT,
	id_godziny int,
	id_pensji int,
	id_premii int
);


alter table ksiegowosc.wynagrodzenie add foreign key (id_pracownika) references ksiegowosc.pracownicy(id_pracownika);
alter table ksiegowosc.wynagrodzenie add foreign key (id_godziny) references ksiegowosc.godziny(id_godziny);
alter table ksiegowosc.wynagrodzenie add foreign key (id_pensji) references ksiegowosc.pensja(id_pensji);
alter table ksiegowosc.wynagrodzenie add foreign key (id_premii) references ksiegowosc.premia(id_premii);

comment on table ksiegowosc.pracownicy is 'Tabela z danymi pracownikow';
comment on table ksiegowosc.godziny is 'Tabela z danymi dot. ilosci przepracowanych godzin';
comment on table ksiegowosc.pensja is 'Tabela z danymi dot. wynagrodzenia na danym stanowisku';
comment on table ksiegowosc.premia is 'Tabela z danymi dot. typow i wysokosci premii';
comment on table ksiegowosc.wynagrodzenie is 'Tabela laczaca wszystkie tabele';

SELECT obj_description('ksiegowosc.pracownicy'::regclass);
SELECT obj_description('ksiegowosc.godziny'::regclass);
SELECT obj_description('ksiegowosc.pensja'::regclass);
SELECT obj_description('ksiegowosc.premia'::regclass);
SELECT obj_description('ksiegowosc.wynagrodzenie'::regclass);


insert into ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
values
(1, 'Martyna', 'Łuba','Nieszawska 131, Bydgoszcz','88 238 21 48'),
(2, 'Tomasz', 'Popowicz', 'Jęczmienna 79, Olsztyn','51 560 24 76'),
(3, 'Marlena', 'Doruch', 'Wojska Polskiego 109, Opole','53 757 49 49'),
(4, 'Eryk', 'Malak', 'Stalmacha Pawła 54, Siemianowice Śląskie','69 575 21 20'),
(5, 'Wacław', 'Trzciński', 'Modrzewiowa 50, Koszalin','79 644 35 74'),
(6, 'Czesława', 'Markiewicz', 'Ametystowa 15, Bielsko-biała','88 278 63 63'),
(7, 'Sara', 'Maciaszczyk', 'Nawigacyjna 59, Poznań','53 744 11 43'),
(8, 'Emil', 'Jędrzejczyk', 'Nasienna 10, Wrocław','72 921 82 36'),
(9, 'Maryna', 'Darłak', 'Batalionu Platerówek 117, Warszawa','66 396 07 97'),
(10, 'Julian', 'Kucz', 'Księdza Staszica Stanisława 67, Racibórz','67 136 84 45');

insert into ksiegowosc.godziny (id_godziny, data, liczba_godzin)
values
(1, '2024-05-13', 166),
(2, '2024-08-27', 84),
(3, '2024-09-19', 170),
(4, '2024-09-25', 168),
(5, '2024-12-13', 166),
(6, '2024-04-22', 160),
(7, '2024-04-29', 155),
(8, '2024-08-14', 172),
(9, '2024-08-23', 88),
(10, '2024-10-23', 100);

insert into ksiegowosc.premia (id_premii, rodzaj, kwota)
values
(1, 'uznaniowa', 300),
(2, 'regulaminowa', 500),
(3, 'frekwencja', 400),
(4, 'frekwencja', 100),
(5, 'regulaminowa', 200),
(6, 'uznaniowa', 350),
(7, 'uznaniowa', 50),
(8, 'frekwencja', 500),
(9, 'regulaminowa', 450),
(10, 'uznaniowa', 330);

insert into ksiegowosc.pensja (id_pensji, stanowisko, kwota)
values
(1, 'REGULAR GOOGLE TRANSLATE EXPERT', 4500),
(2, 'SELFIE MUSKETEER', 5000),
(3, 'EVENT MODERATOR', 3700),
(4, 'PR CONSULTANT', 4400),
(5, 'EMPLOYER BRANDING EXORCIST', 5200),
(6, 'SENIOR MOTION HERO', 3900),
(7, 'JUNIOR VIDEO RONIN', 3300),
(8, 'SENIOR DATA PROPHET', 4500),
(9, 'JUNIOR FOLLOWERS DEVELOPER', 5700),
(10, 'VIRAL PROOFREADER', 6000);

insert into ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
values
(1,'2024-05-15', 1, 3, 5, 7),
(2, '2024-07-18', 2, 4,  6, 8),
(3, '2024-07-26', 3, 5, 7, 9),
(4, '2024-08-23', 4, 6, 8, 10),
(5, '2024-09-07', 5, 7, 9, 1),
(6, '2024-09-15', 6, 8, 10, 2),
(7, '2024-09-29', 7, 9, 1, 3),
(8, '2024-10-27', 8, 10, 2, 4),
(9, '2024-12-01', 9, 1, 3, 5),
(10, '2024-12-03', 10, 2, 4, 6);


update ksiegowosc.pensja set kwota = kwota - 3000 where stanowisko like 'EVENT MODERATOR';
update ksiegowosc.pensja set kwota = kwota - 3000 where stanowisko like 'JUNIOR FOLLOWERS DEVELOPER';
update ksiegowosc.pensja set kwota = kwota - 4000 where stanowisko like 'VIRAL PROOFREADER';
update ksiegowosc.pensja set kwota = kwota - 3300 where stanowisko like 'EMPLOYER BRANDING EXORCIST';
update ksiegowosc.wynagrodzenie  set id_premii = null where id_pracownika = 1;
update ksiegowosc.wynagrodzenie  set id_pensji = 5 where id_pracownika = 4;
update ksiegowosc.wynagrodzenie  set id_pensji = 5 where id_pracownika = 5;
update ksiegowosc.wynagrodzenie  set id_pensji = 5 where id_pracownika = 6;
update ksiegowosc.wynagrodzenie  set id_premii = null where id_pracownika = 2;
update ksiegowosc.pracownicy  set nazwisko  = 'Mania' where id_pracownika = 3;

-- a)
select id_pracownika, nazwisko from ksiegowosc.pracownicy;

-- b)
select prac.id_pracownika from 
((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
where pen.kwota > 1000;

-- c)
select prac.id_pracownika from 
((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
where pen.kwota > 2000 and wynag.id_premii is null;

-- d)
select * from ksiegowosc.pracownicy where imie like 'J%';

-- e)
select * from ksiegowosc.pracownicy where nazwisko like '%n%' and imie like '%a';

-- f)
select prac.imie, prac.nazwisko, (god.liczba_godzin - 160) as nadgodziny
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.godziny as god
on wynag.id_godziny = god.id_godziny)
where god.liczba_godzin > 160;

-- g)
select prac.imie, prac.nazwisko
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
where pen.kwota between 1500 and 3000;

-- h)
select prac.imie, prac.nazwisko
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.godziny as god
on wynag.id_godziny = god.id_godziny)
where god.liczba_godzin > 160 and wynag.id_premii is null;

-- i)
select prac.*, pen.kwota
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
order by pen.kwota;

-- j)
select prac.*, pen.kwota, prem.kwota
from (((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii)
order by pen.kwota desc, prem.kwota desc;

-- k)
select count(prac.*), pen.stanowisko
from ((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
group by pen.stanowisko
order by pen.stanowisko;

-- l)
select min(prem.kwota + pen.kwota) as minimum, max(prem.kwota + pen.kwota) as maximum, avg(prem.kwota + pen.kwota) as srednia 
from ((ksiegowosc.pensja as pen
inner join ksiegowosc.wynagrodzenie as wynag 
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii)
where pen.stanowisko like 'EMPLOYER BRANDING EXORCIST';

-- m)
select prac.imie, prac.nazwisko, pen.kwota, prem.kwota
from (((ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika)
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii)
where pen.stanowisko like 'EMPLOYER BRANDING EXORCIST';

-- n)
select sum(prem.kwota + pen.kwota)
from ((ksiegowosc.pensja as pen
inner join ksiegowosc.wynagrodzenie as wynag 
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii);

-- o)
select pen.stanowisko, sum(prem.kwota + pen.kwota)
from ((ksiegowosc.pensja as pen
inner join ksiegowosc.wynagrodzenie as wynag 
on wynag.id_pensji = pen.id_pensji)
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii)
group by pen.stanowisko;

--p
select pen.stanowisko, count(wynag.id_premii)
from ksiegowosc.pensja as pen
inner join ksiegowosc.wynagrodzenie as wynag 
on wynag.id_pensji = pen.id_pensji
group by pen.stanowisko
order by count(wynag.id_premii) desc;

delete from ksiegowosc.pracownicy as prac 
where prac.id_pracownika = 
(select wynag.id_pracownika from ksiegowosc.wynagrodzenie as wynag
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji 
where pen.kwota < 1200);

ALTER TABLE ksiegowosc.pracownicy 
ALTER COLUMN telefon TYPE VARCHAR(50);

update ksiegowosc.pracownicy
set telefon = concat('(+48) ', telefon);

(+48) 88 238 21 48

update ksiegowosc.pracownicy
set telefon = concat(substring(telefon,1,8),  substring(telefon,10,1), '-',
substring(telefon,11,2), substring(telefon,14,1), '-', substring(telefon,15,1), substring(telefon,17,2));

select id_pracownika, upper(imie), upper(nazwisko), upper(adres), telefon 
from ksiegowosc.pracownicy
where id_pracownika =(
select id_pracownika
from ksiegowosc.pracownicy
order by length(nazwisko) desc 
limit 1
);

select md5(prac.imie) as imie, md5(nazwisko) as nazwisko, md5(adres) as adres, md5(telefon) as telefon, md5(pen.kwota::varchar(255)) as pensja
from ksiegowosc.pracownicy as prac
inner join ksiegowosc.wynagrodzenie as wynag
on prac.id_pracownika = wynag.id_pracownika 
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji;


select prac.imie, prac.nazwisko, pen.stanowisko, pen.kwota as wynagrodzenie, prem.kwota as premia
from ksiegowosc.pracownicy as prac 
left join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika
left join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji
left join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii;

select concat('Pracownik ', prac.imie, ' ', prac.nazwisko, ', w dniu ', wynag."data", ' otrzymał(a) pensje całkowita na kwotę ',
(pen.kwota+prem.kwota), ' zł, gdzie wynagrodzenie zasadnicze wynosiło: ', pen.kwota, ' zł, premia: ', prem.kwota, ' zł, nadgodziny: 0 zł') 
from ksiegowosc.pracownicy as prac 
inner join ksiegowosc.wynagrodzenie as wynag 
on prac.id_pracownika = wynag.id_pracownika
inner join ksiegowosc.pensja as pen
on wynag.id_pensji = pen.id_pensji
inner join ksiegowosc.premia as prem
on wynag.id_premii = prem.id_premii;

select * from ksiegowosc.pracownicy;
select * from ksiegowosc.godziny;
select * from ksiegowosc.premia;
select * from ksiegowosc.pensja;
select * from ksiegowosc.wynagrodzenie;

