-- 1) Złączenie trzech tabel: informacje o locie, modelu statku i miejscu docelowym
SELECT L.ID_lotu,
       F.model AS ModelStatku,
       P.nazwa AS Cel,
       L.rok_wysłania AS RokWysłania,
       L.rok_przybycia AS RokPrzybycia
FROM Loty L
JOIN Flota F ON L.ID_statku = F.ID_statku
JOIN Planety_i_Stacje P ON L.ID_miejsca_docelowego = P.ID_miejsca
ORDER BY L.ID_lotu;

-- 2) Liczba pasażerów na każdym locie (funkcja agregująca + GROUP BY)
SELECT L.ID_lotu,
       COUNT(LP.ID_pasażera) AS LiczbaPasażerów
FROM Loty L
LEFT JOIN Loty_Pasażerowie LP ON L.ID_lotu = LP.ID_lotu
GROUP BY L.ID_lotu
ORDER BY L.ID_lotu;

-- 3) Obliczenie łącznej wagi ładunków na każdym locie (SUM + GROUP BY + HAVING)
SELECT L.ID_lotu,
       SUM(LA.waga) AS SumaWag
FROM Loty L
JOIN Ładunki LA ON L.ID_lotu = LA.ID_lotu
GROUP BY L.ID_lotu
HAVING SUM(LA.waga) > 100;

-- 4) Znajdź statki z liczbą napraw krytycznych powyżej średniej (podzapytanie w WHERE)
SELECT F.ID_statku,
       F.model,
       F.liczba_napraw_krytycznych
FROM Flota F
WHERE F.liczba_napraw_krytycznych > (
    SELECT AVG(liczba_napraw_krytycznych)
    FROM Flota
);

-- 5) Podzapytanie skorelowane: dla każdego lotu policz pasażerów w statusie 'zdrowy'
SELECT L.ID_lotu,
       (
         SELECT COUNT(*)
         FROM Pasażerowie P
         WHERE P.ID_lotu = L.ID_lotu
           AND P.status_medyczny = 'zdrowy'
       ) AS ZdrowiPasażerowie
FROM Loty L
ORDER BY L.ID_lotu;

-- 6) Obliczenie czasu podróży (różnica lat) dla każdego lotu
SELECT ID_lotu,
       (rok_przybycia - rok_wysłania) AS CzasPodróży
FROM Loty
ORDER BY ID_lotu;

-- 7) Wyszukiwanie pasażerów starszych (wiek_biologiczny) niż średni wiek wszystkich
SELECT ID_pasażera,
       imię,
       nazwisko,
       wiek_biologiczny
FROM Pasażerowie
WHERE wiek_biologiczny > (
    SELECT AVG(wiek_biologiczny)
    FROM Pasażerowie
);

-- 8) Użycie CASE do klasyfikacji lotów wg długości podróży
SELECT L.ID_lotu,
       (L.rok_przybycia - L.rok_wysłania) AS CzasPodróży,
       CASE
         WHEN (L.rok_przybycia - L.rok_wysłania) >= 5 THEN 'Długi lot'
         ELSE 'Krótszy lot'
       END AS Klasyfikacja
FROM Loty L
ORDER BY L.ID_lotu;

-- 9) Zestawienie liczby modułów na statkach z podziałem na stan modułu
SELECT F.ID_statku,
       F.model AS ModelStatku,
       M.stan_modułu,
       COUNT(*) AS LiczbaModułów
FROM Flota F
JOIN Moduły M ON F.ID_statku = M.ID_statku
GROUP BY F.ID_statku, F.model, M.stan_modułu
ORDER BY F.ID_statku, M.stan_modułu;

-- 10) Liczba pasażerów przypisanych do każdej kapsuły (LEFT JOIN + GROUP BY)
SELECT K.ID_kapsuły,
       K.status_użytkowania,
       COUNT(P.ID_pasażera) AS LiczbaPasażerów
FROM Kapsuły K
LEFT JOIN Pasażerowie P ON K.ID_kapsuły = P.ID_kapsuły
GROUP BY K.ID_kapsuły, K.status_użytkowania
ORDER BY K.ID_kapsuły;
