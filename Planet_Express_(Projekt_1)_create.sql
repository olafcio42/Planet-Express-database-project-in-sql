-- BLOKI DO DROP


BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Loty_Pasażerowie CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Loty_Ładunki CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Pasażerowie CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Ładunki CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Kapsuły CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Moduły CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Załoga CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Umowy CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Loty CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Planety_i_Stacje CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Flota CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Kontrahenci CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/
-- ===========================
-- KONIEC BLOKÓW DROP
-- ===========================





-- ===========================
-- TWORZENIE TABEL
-- ===========================

-- Table: Flota
CREATE TABLE Flota (
    ID_statku                     INTEGER      NOT NULL,
    model                         VARCHAR2(50) NOT NULL,
    typ_napędu                    VARCHAR2(50) NOT NULL,
    liczba_lotów                  INTEGER      DEFAULT 0 NOT NULL,
    liczba_napraw_krytycznych     INTEGER      DEFAULT 0 NOT NULL,
    gotowość_do_lotu              INTEGER      DEFAULT 1 NOT NULL,
    przewozi_ludzi                INTEGER      DEFAULT 0 NOT NULL,
    CONSTRAINT Flota_pk PRIMARY KEY (ID_statku)
);

-- Table: Kapsuły
CREATE TABLE Kapsuły (
    ID_kapsuły            INTEGER       NOT NULL,
    ID_statku             INTEGER       NOT NULL,
    maks_liczba_pasażerów INTEGER       NOT NULL,
    maks_wytrzymałość_lat INTEGER       NOT NULL,
    status_użytkowania    VARCHAR2(200) NULL,
    CONSTRAINT CHECK_3 CHECK ( status_użytkowania IN ('aktywna','konserwacja','uszkodzona') ),
    CONSTRAINT Kapsuły_pk PRIMARY KEY (ID_kapsuły)
);

-- Table: Kontrahenci
CREATE TABLE Kontrahenci (
    ID_kontrahenta    INTEGER      NOT NULL,
    nazwa             VARCHAR2(50) NOT NULL,
    typ_działalności  VARCHAR2(50) NOT NULL,
    kanał_kontaktowy  VARCHAR2(10) NOT NULL,
    CONSTRAINT Kontrahenci_pk PRIMARY KEY (ID_kontrahenta)
);

-- Table: Planety_i_Stacje
CREATE TABLE Planety_i_Stacje (
    ID_miejsca   INTEGER       NOT NULL,
    nazwa        VARCHAR2(255) NOT NULL,
    typ_miejsca  VARCHAR2(255) NOT NULL,
    sektor       VARCHAR2(255) NOT NULL,
    CONSTRAINT CHECK_0 CHECK ( typ_miejsca IN ('planeta','stacja') ),
    CONSTRAINT Planety_i_Stacje_pk PRIMARY KEY (ID_miejsca)
);

-- Table: Loty
CREATE TABLE Loty (
    ID_lotu               INTEGER       NOT NULL,
    ID_statku             INTEGER       NOT NULL,
    rok_wysłania          INTEGER       NOT NULL,
    napęd_warpowy         INTEGER       DEFAULT 0 NOT NULL,
    przewozi_ludzi        INTEGER       DEFAULT 0 NOT NULL,
    rok_przybycia         INTEGER       NOT NULL,
    sektor_docelowy       VARCHAR2(255) NOT NULL,
    ID_miejsca_docelowego INTEGER       NOT NULL,
    CONSTRAINT Loty_pk PRIMARY KEY (ID_lotu)
);

-- Table: Moduły
CREATE TABLE Moduły (
    ID_modułu   INTEGER      NOT NULL,
    ID_statku   INTEGER      NOT NULL,
    typ_modułu  VARCHAR2(50) NOT NULL,
    stan_modułu VARCHAR2(50) NOT NULL,
    CONSTRAINT CHECK_2 CHECK ( stan_modułu IN ('sprawny','w konserwacji','uszkodzony') ),
    CONSTRAINT Moduły_pk PRIMARY KEY (ID_modułu)
);

-- Table: Załoga
CREATE TABLE Załoga (
    ID_załogi       INTEGER      NOT NULL,
    ID_statku       INTEGER      NOT NULL,
    gotowość_załogi INTEGER      DEFAULT 1 NOT NULL,
    ID_systemu_AI   INTEGER      NOT NULL,
    Specjalizacja   VARCHAR2(50) NOT NULL,
    CONSTRAINT Załoga_pk PRIMARY KEY (ID_załogi)
);

-- Table: Pasażerowie
CREATE TABLE Pasażerowie (
    ID_pasażera        INTEGER       NOT NULL,
    INOIT              VARCHAR2(100) NOT NULL,
    imię               VARCHAR2(50)  NOT NULL,
    nazwisko           VARCHAR2(50)  NOT NULL,
    wiek_biologiczny   INTEGER       NOT NULL,
    wiek_chronologiczny INTEGER      NOT NULL,
    status_medyczny    VARCHAR2(200) NOT NULL,
    ID_lotu            INTEGER       NULL,
    ID_kapsuły         INTEGER       NULL,
    CONSTRAINT AK_0 UNIQUE (INOIT),
    CONSTRAINT Pasażerowie_pk PRIMARY KEY (ID_pasażera)
);

-- Table: Ładunki
CREATE TABLE Ładunki (
    ID_ładunku        INTEGER       NOT NULL,
    kategoria_ładunku VARCHAR2(200) NOT NULL,
    waga              FLOAT         NOT NULL,
    niebezpieczny     INTEGER       DEFAULT 0 NOT NULL,
    ID_lotu           INTEGER       NOT NULL,
    CONSTRAINT Ładunki_pk PRIMARY KEY (ID_ładunku)
);

-- Table: Umowy
CREATE TABLE Umowy (
    ID_umowy        INTEGER       NOT NULL,
    ID_kontrahenta  INTEGER       NOT NULL,
    ID_lotu         INTEGER       NOT NULL,
    rodzaj_ładunku  VARCHAR2(200) NOT NULL,
    wartość_kontraktu FLOAT       NOT NULL,
    rok_podpisania  INTEGER       NOT NULL,
    status_umowy    VARCHAR2(255) NOT NULL,
    CONSTRAINT CHECK_1 CHECK ( status_umowy IN ('w trakcie','zakończona','anulowana') ),
    CONSTRAINT Umowy_pk PRIMARY KEY (ID_umowy)
);

-- Tabele asocjacyjne
CREATE TABLE Loty_Pasażerowie (
    ID_lotu     INTEGER NOT NULL,
    ID_pasażera INTEGER NOT NULL,
    CONSTRAINT Loty_Pasażerowie_pk PRIMARY KEY (ID_lotu, ID_pasażera)
);

CREATE TABLE Loty_Ładunki (
    ID_lotu     INTEGER NOT NULL,
    ID_ładunku  INTEGER NOT NULL,
    CONSTRAINT Loty_Ładunki_pk PRIMARY KEY (ID_lotu, ID_ładunku)
);

-- ===========================
-- KLUCZE OBCE (FOREIGN KEYS)
-- ===========================

ALTER TABLE Loty
  ADD CONSTRAINT FK_0
    FOREIGN KEY (ID_statku)
    REFERENCES Flota (ID_statku);

ALTER TABLE Loty
  ADD CONSTRAINT FK_1
    FOREIGN KEY (ID_miejsca_docelowego)
    REFERENCES Planety_i_Stacje (ID_miejsca);

ALTER TABLE Loty_Ładunki
  ADD CONSTRAINT FK_10
    FOREIGN KEY (ID_lotu)
    REFERENCES Loty (ID_lotu);

ALTER TABLE Loty_Ładunki
  ADD CONSTRAINT FK_11
    FOREIGN KEY (ID_ładunku)
    REFERENCES Ładunki (ID_ładunku);

ALTER TABLE Loty_Pasażerowie
  ADD CONSTRAINT FK_12
    FOREIGN KEY (ID_lotu)
    REFERENCES Loty (ID_lotu);

ALTER TABLE Loty_Pasażerowie
  ADD CONSTRAINT FK_13
    FOREIGN KEY (ID_pasażera)
    REFERENCES Pasażerowie (ID_pasażera);

ALTER TABLE Ładunki
  ADD CONSTRAINT FK_2
    FOREIGN KEY (ID_lotu)
    REFERENCES Loty (ID_lotu);

ALTER TABLE Załoga
  ADD CONSTRAINT FK_3
    FOREIGN KEY (ID_statku)
    REFERENCES Flota (ID_statku);

ALTER TABLE Umowy
  ADD CONSTRAINT FK_4
    FOREIGN KEY (ID_kontrahenta)
    REFERENCES Kontrahenci (ID_kontrahenta);

ALTER TABLE Umowy
  ADD CONSTRAINT FK_5
    FOREIGN KEY (ID_lotu)
    REFERENCES Loty (ID_lotu);

ALTER TABLE Moduły
  ADD CONSTRAINT FK_6
    FOREIGN KEY (ID_statku)
    REFERENCES Flota (ID_statku);

ALTER TABLE Kapsuły
  ADD CONSTRAINT FK_7
    FOREIGN KEY (ID_statku)
    REFERENCES Flota (ID_statku);

ALTER TABLE Pasażerowie
  ADD CONSTRAINT FK_8
    FOREIGN KEY (ID_lotu)
    REFERENCES Loty (ID_lotu);

ALTER TABLE Pasażerowie
  ADD CONSTRAINT FK_9
    FOREIGN KEY (ID_kapsuły)
    REFERENCES Kapsuły (ID_kapsuły);

-- KONIEC
