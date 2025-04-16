-- Insert do tabeli Flota (5 wierszy)
INSERT INTO Flota (ID_statku, model, typ_napędu, liczba_lotów, liczba_napraw_krytycznych, gotowość_do_lotu, przewozi_ludzi) VALUES
(1, 'USS Enterprise', 'Warp', 150, 2, 1, 1000);
INSERT INTO Flota (ID_statku, model, typ_napędu, liczba_lotów, liczba_napraw_krytycznych, gotowość_do_lotu, przewozi_ludzi) VALUES
(2, 'Millennium Falcon', 'Hyperdrive', 200, 1, 1, 6);
INSERT INTO Flota (ID_statku, model, typ_napędu, liczba_lotów, liczba_napraw_krytycznych, gotowość_do_lotu, przewozi_ludzi) VALUES
(3, 'Serenity', 'Fusion', 120, 3, 1, 5);
INSERT INTO Flota (ID_statku, model, typ_napędu, liczba_lotów, liczba_napraw_krytycznych, gotowość_do_lotu, przewozi_ludzi) VALUES
(4, 'Galactica', 'FTL', 300, 5, 1, 100);
INSERT INTO Flota (ID_statku, model, typ_napędu, liczba_lotów, liczba_napraw_krytycznych, gotowość_do_lotu, przewozi_ludzi) VALUES
(5, 'Serenity II', 'Fusion', 80, 0, 1, 5);

-- Insert do tabeli Planety_i_Stacje (5 wierszy)
INSERT INTO Planety_i_Stacje (ID_miejsca, nazwa, typ_miejsca, sektor) VALUES
(1, 'Ziemia', 'planeta', 'Alpha');
INSERT INTO Planety_i_Stacje (ID_miejsca, nazwa, typ_miejsca, sektor) VALUES
(2, 'Stacja Kosmiczna Alpha', 'stacja', 'Beta');
INSERT INTO Planety_i_Stacje (ID_miejsca, nazwa, typ_miejsca, sektor) VALUES
(3, 'Mars', 'planeta', 'Gamma');
INSERT INTO Planety_i_Stacje (ID_miejsca, nazwa, typ_miejsca, sektor) VALUES
(4, 'Stacja Kosmiczna Beta', 'stacja', 'Delta');
INSERT INTO Planety_i_Stacje (ID_miejsca, nazwa, typ_miejsca, sektor) VALUES
(5, 'Jowisz', 'planeta', 'Epsilon');

-- Insert do tabeli Kontrahenci (5 wierszy)
INSERT INTO Kontrahenci (ID_kontrahenta, nazwa, typ_działalności, kanał_kontaktowy) VALUES
(1, 'SpaceCargo Ltd.', 'Transport', 'email');
INSERT INTO Kontrahenci (ID_kontrahenta, nazwa, typ_działalności, kanał_kontaktowy) VALUES
(2, 'Galactic Traders', 'Handel', 'telefon');
INSERT INTO Kontrahenci (ID_kontrahenta, nazwa, typ_działalności, kanał_kontaktowy) VALUES
(3, 'Star Logistics', 'Logistyka', 'fax');
INSERT INTO Kontrahenci (ID_kontrahenta, nazwa, typ_działalności, kanał_kontaktowy) VALUES
(4, 'Cosmic Industries', 'Produkcja', 'email');
INSERT INTO Kontrahenci (ID_kontrahenta, nazwa, typ_działalności, kanał_kontaktowy) VALUES
(5, 'Nebula Services', 'Serwis', 'telefon');

-- Insert do tabeli Kapsuły (5 wierszy)
INSERT INTO Kapsuły (ID_kapsuły, ID_statku, maks_liczba_pasażerów, maks_wytrzymałość_lat, status_użytkowania) VALUES
(1, 1, 1000, 5, 'aktywna');
INSERT INTO Kapsuły (ID_kapsuły, ID_statku, maks_liczba_pasażerów, maks_wytrzymałość_lat, status_użytkowania) VALUES
(2, 2, 6, 3, 'konserwacja');
INSERT INTO Kapsuły (ID_kapsuły, ID_statku, maks_liczba_pasażerów, maks_wytrzymałość_lat, status_użytkowania) VALUES
(3, 3, 5, 4, 'uszkodzona');
INSERT INTO Kapsuły (ID_kapsuły, ID_statku, maks_liczba_pasażerów, maks_wytrzymałość_lat, status_użytkowania) VALUES
(4, 4, 100, 6, 'aktywna');
INSERT INTO Kapsuły (ID_kapsuły, ID_statku, maks_liczba_pasażerów, maks_wytrzymałość_lat, status_użytkowania) VALUES
(5, 5, 5, 2, 'konserwacja');

-- Insert do tabeli Moduły (5 wierszy)
INSERT INTO Moduły (ID_modułu, ID_statku, typ_modułu, stan_modułu) VALUES
(1, 1, 'Nawigacyjny', 'sprawny');
INSERT INTO Moduły (ID_modułu, ID_statku, typ_modułu, stan_modułu) VALUES
(2, 1, 'Energetyczny', 'uszkodzony');
INSERT INTO Moduły (ID_modułu, ID_statku, typ_modułu, stan_modułu) VALUES
(3, 2, 'Uzbrojenie', 'w konserwacji');
INSERT INTO Moduły (ID_modułu, ID_statku, typ_modułu, stan_modułu) VALUES
(4, 3, 'Nawigacyjny', 'sprawny');
INSERT INTO Moduły (ID_modułu, ID_statku, typ_modułu, stan_modułu) VALUES
(5, 4, 'Energetyczny', 'sprawny');

-- Insert do tabeli Załoga (5 wierszy)
INSERT INTO Załoga (ID_załogi, ID_statku, gotowość_załogi, ID_systemu_AI, Specjalizacja) VALUES
(1, 1, 1, 101, 'Nawigator');
INSERT INTO Załoga (ID_załogi, ID_statku, gotowość_załogi, ID_systemu_AI, Specjalizacja) VALUES
(2, 2, 1, 102, 'Pilot');
INSERT INTO Załoga (ID_załogi, ID_statku, gotowość_załogi, ID_systemu_AI, Specjalizacja) VALUES
(3, 3, 1, 103, 'Inżynier');
INSERT INTO Załoga (ID_załogi, ID_statku, gotowość_załogi, ID_systemu_AI, Specjalizacja) VALUES
(4, 4, 1, 104, 'Technik');
INSERT INTO Załoga (ID_załogi, ID_statku, gotowość_załogi, ID_systemu_AI, Specjalizacja) VALUES
(5, 5, 1, 105, 'Mechanik');

-- Insert do tabeli Loty (5 wierszy)
INSERT INTO Loty (ID_lotu, ID_statku, rok_wysłania, napęd_warpowy, przewozi_ludzi, rok_przybycia, sektor_docelowy, ID_miejsca_docelowego) VALUES
(1, 1, 2320, 5, 1000, 2321, 'Delta Quadrant', 1);
INSERT INTO Loty (ID_lotu, ID_statku, rok_wysłania, napęd_warpowy, przewozi_ludzi, rok_przybycia, sektor_docelowy, ID_miejsca_docelowego) VALUES
(2, 2, 2377, 3, 6, 2378, 'Kessel Run', 2);
INSERT INTO Loty (ID_lotu, ID_statku, rok_wysłania, napęd_warpowy, przewozi_ludzi, rok_przybycia, sektor_docelowy, ID_miejsca_docelowego) VALUES
(3, 3, 2450, 4, 5, 2451, 'Andromeda', 3);
INSERT INTO Loty (ID_lotu, ID_statku, rok_wysłania, napęd_warpowy, przewozi_ludzi, rok_przybycia, sektor_docelowy, ID_miejsca_docelowego) VALUES
(4, 4, 2500, 6, 100, 2501, 'Milky Way', 4);
INSERT INTO Loty (ID_lotu, ID_statku, rok_wysłania, napęd_warpowy, przewozi_ludzi, rok_przybycia, sektor_docelowy, ID_miejsca_docelowego) VALUES
(5, 5, 2600, 2, 5, 2601, 'Omega Sector', 5);

-- Insert do tabeli Pasażerowie (5 wierszy)
INSERT INTO Pasażerowie (ID_pasażera, INOIT, imię, nazwisko, wiek_biologiczny, wiek_chronologiczny, status_medyczny, ID_lotu, ID_kapsuły) VALUES
(1, 'INOIT12345', 'John', 'Doe', 287, 658, 'zdrowy', 1, 1);
INSERT INTO Pasażerowie (ID_pasażera, INOIT, imię, nazwisko, wiek_biologiczny, wiek_chronologiczny, status_medyczny, ID_lotu, ID_kapsuły) VALUES
(2, 'INOIT67890', 'Leia', 'Organa', 128, 208, 'chory', 2, 2);
INSERT INTO Pasażerowie (ID_pasażera, INOIT, imię, nazwisko, wiek_biologiczny, wiek_chronologiczny, status_medyczny, ID_lotu, ID_kapsuły) VALUES
(3, 'INOIT54321', 'Han', 'Solo', 98, 306, 'zdrowy', 3, 3);
INSERT INTO Pasażerowie (ID_pasażera, INOIT, imię, nazwisko, wiek_biologiczny, wiek_chronologiczny, status_medyczny, ID_lotu, ID_kapsuły) VALUES
(4, 'INOIT09876', 'Zoe', 'Washburne', 145, 529, 'zdrowy', 4, 4);
INSERT INTO Pasażerowie (ID_pasażera, INOIT, imię, nazwisko, wiek_biologiczny, wiek_chronologiczny, status_medyczny, ID_lotu, ID_kapsuły) VALUES
(5, 'INOIT11223', 'Mal', 'Reynolds', 60, 134, 'martwy', 5, 5);

-- Insert do tabeli Ładunki (5 wierszy)
INSERT INTO Ładunki (ID_ładunku, kategoria_ładunku, waga, niebezpieczny, ID_lotu) VALUES
(1, 'Surowce', 5000.0, 0, 1);
INSERT INTO Ładunki (ID_ładunku, kategoria_ładunku, waga, niebezpieczny, ID_lotu) VALUES
(2, 'Broń', 3000.0, 1, 2);
INSERT INTO Ładunki (ID_ładunku, kategoria_ładunku, waga, niebezpieczny, ID_lotu) VALUES
(3, 'Elektronika', 2000.0, 0, 3);
INSERT INTO Ładunki (ID_ładunku, kategoria_ładunku, waga, niebezpieczny, ID_lotu) VALUES
(4, 'Medykamenty', 1500.0, 0, 4);
INSERT INTO Ładunki (ID_ładunku, kategoria_ładunku, waga, niebezpieczny, ID_lotu) VALUES
(5, 'Narzędzia', 2500.0, 0, 5);

-- Insert do tabeli Umowy (5 wierszy)
INSERT INTO Umowy (ID_umowy, ID_kontrahenta, ID_lotu, rodzaj_ładunku, wartość_kontraktu, rok_podpisania, status_umowy) VALUES
(1, 1, 1, 'Surowce', 1000000.0, 2320, 'w trakcie');
INSERT INTO Umowy (ID_umowy, ID_kontrahenta, ID_lotu, rodzaj_ładunku, wartość_kontraktu, rok_podpisania, status_umowy) VALUES
(2, 2, 2, 'Broń', 500000.0, 2377, 'zakończona');
INSERT INTO Umowy (ID_umowy, ID_kontrahenta, ID_lotu, rodzaj_ładunku, wartość_kontraktu, rok_podpisania, status_umowy) VALUES
(3, 3, 3, 'Elektronika', 750000.0, 2450, 'w trakcie');
INSERT INTO Umowy (ID_umowy, ID_kontrahenta, ID_lotu, rodzaj_ładunku, wartość_kontraktu, rok_podpisania, status_umowy) VALUES
(4, 4, 4, 'Medykamenty', 300000.0, 2500, 'anulowana');
INSERT INTO Umowy (ID_umowy, ID_kontrahenta, ID_lotu, rodzaj_ładunku, wartość_kontraktu, rok_podpisania, status_umowy) VALUES
(5, 5, 5, 'Narzędzia', 450000.0, 2600, 'zakończona');

-- Insert do tabeli Loty_Pasażerowie (3 wiersze)
INSERT INTO Loty_Pasażerowie (ID_lotu, ID_pasażera) VALUES
(1, 1);
INSERT INTO Loty_Pasażerowie (ID_lotu, ID_pasażera) VALUES
(2, 2);
INSERT INTO Loty_Pasażerowie (ID_lotu, ID_pasażera) VALUES
(3, 3);

-- Insert do tabeli Loty_Ładunki (3 wiersze)
INSERT INTO Loty_Ładunki (ID_lotu, ID_ładunku) VALUES
(1, 1);
INSERT INTO Loty_Ładunki (ID_lotu, ID_ładunku) VALUES
(2, 2);
INSERT INTO Loty_Ładunki (ID_lotu, ID_ładunku) VALUES
(3, 3);