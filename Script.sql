create database firma;
create schema rozliczenia;

CREATE TABLE rozliczenia.pracownicy (
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    adres VARCHAR(100),
    telefon VARCHAR(15)
);

CREATE TABLE rozliczenia.godziny (
    id_godziny INT PRIMARY KEY,
    data DATE,
    liczba_godzin DECIMAL(5, 2),
    id_pracownika INT
);

CREATE TABLE rozliczenia.pensje (
    id_pensji INT PRIMARY KEY,
    stanowisko VARCHAR(50),
    kwota DECIMAL(10, 2),
    id_premii INT
);

CREATE TABLE rozliczenia.premie (
    id_premii INT PRIMARY KEY,
    rodzaj VARCHAR(50),
    kwota DECIMAL(10, 2)
);

alter table rozliczenia.godziny add FOREIGN key (id_pracownika) references rozliczenia.pracownicy(id_pracownika);
alter table rozliczenia.pensje add FOREIGN key (id_premii) references rozliczenia.premie(id_premii);

insert into rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
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

insert into rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
values
(1, '2024-05-13', 166, 2),
(2, '2024-08-27', 84, 6),
(3, '2024-09-19', 170, 8),
(4, '2024-09-25', 168, 1),
(5, '2024-12-13', 166, 10),
(6, '2024-04-22', 160, 9),
(7, '2024-04-29', 155, 3),
(8, '2024-08-14', 172, 7),
(9, '2024-08-23', 88, 4),
(10, '2024-10-23', 100, 5);

insert into rozliczenia.premie (id_premii, rodzaj, kwota)
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

insert into rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
values
(1, 'REGULAR GOOGLE TRANSLATE EXPERT', 4500, 7),
(2, 'SELFIE MUSKETEER', 5000, 1),
(3, 'EVENT MODERATOR', 3700, 5),
(4, 'PR CONSULTANT', 4400, 10),
(5, 'EMPLOYER BRANDING EXORCIST', 5200, 9),
(6, 'SENIOR MOTION HERO', 3900, 2),
(7, 'JUNIOR VIDEO RONIN', 3300, 4),
(8, 'SENIOR DATA PROPHET', 4500, 6),
(9, 'JUNIOR FOLLOWERS DEVELOPER', 5700, 3),
(10, 'VIRAL PROOFREADER', 6000, 8);

select nazwisko, adres from rozliczenia.pracownicy;

select date_part() ('day', data) as dzień, date_part('month', data) as miesiąc from rozliczenia.godziny; 

alter table rozliczenia.pensje rename column kwota to kwota_brutto;

alter table rozliczenia.pensje add column kwota_netto DECIMAL(10, 2);

update rozliczenia.pensje set kwota_netto = kwota_brutto*0.73;

select * from rozliczenia.pensje;
select * from rozliczenia.godziny;
select * from rozliczenia.pracownicy;
select * from rozliczenia.premie;


