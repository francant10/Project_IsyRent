CREATE DATABASE IF NOT EXISTS isyrent_db;

USE isyrent_db;

-- Creazione della tabella cliente
CREATE TABLE cliente (
    cf VARCHAR(40) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_nascita DATE,
    telefono VARCHAR(15),
    indirizzo VARCHAR(50),
    citta VARCHAR(50),
    cap VARCHAR(10)
);

-- Creazione della tabella mezzo
CREATE TABLE mezzo (
    id_mezzo INT AUTO_INCREMENT PRIMARY KEY,
    n_posti INT,
    costo DECIMAL(10, 2),
    targa VARCHAR(50),
    modello VARCHAR(50),
    tipo_mezzo VARCHAR(50)
);

-- Creazione della tabella prenotazioni
CREATE TABLE prenotazioni (
    id_prenotazione INT AUTO_INCREMENT PRIMARY KEY,
    data_ora_ritiro DATETIME,
    data_ora_consegna DATETIME,
    id_mezzo INT,
    cf VARCHAR(40),
    CONSTRAINT fk_mezzo FOREIGN KEY (id_mezzo) REFERENCES mezzo(id_mezzo),
    CONSTRAINT fk_cliente FOREIGN KEY (cf) REFERENCES cliente(cf)
);

-- Inserimento dei dati nella tabella cliente
INSERT INTO cliente (cf, nome, cognome, email, data_nascita, telefono, indirizzo, citta, cap)
VALUES 
('CF1234567890', 'Mario', 'Rossi', 'mario.rossi@email.com', '1980-03-15', '1234567890', 'Via Roma 10', 'Milano', '20100'),
('CF0987654321', 'Giulia', 'Bianchi', 'giulia.bianchi@email.com', '1992-07-25', '9876543210', 'Via Milano 20', 'Torino', '10100'),
('CF1122334455', 'Luca', 'Verdi', 'luca.verdi@email.com', '1985-11-05', '1122334455', 'Viale Italia 15', 'Firenze', '50100');

-- Inserimento dei dati nella tabella mezzo
INSERT INTO mezzo (n_posti, costo, targa, modello, tipo_mezzo)
VALUES
(2, 50.00, 'AB123CD', 'Honda SH150', 'scooters'),
(2, 32.00, 'EF456GH', 'Yamaha XMAX 125', 'scooters'),
(2, 40.00, 'IJ789KL', 'Piaggio Liberty 125', 'scooters'),
(5, 75.00, 'MN123OP', 'Fiat Panda', 'cars'),
(5, 85.00, 'QR456ST', 'Volkswagen Golf', 'cars'),
(5, 100.00, 'UV789WX', 'Toyota Corolla', 'cars'),
(2, 65.00, 'YZ123AB', 'Ducati Monster', 'motorcycles'),
(2, 70.00, 'CD456EF', 'Kawasaki Ninja 650', 'motorcycles'),
(2, 55.00, 'GH789IJ', 'Harley-Davidson Sportster', 'motorcycles'),
(1, 15.00, NULL, 'Giant Escape 3', 'bicycles'),
(1, 20.00, NULL, 'Trek FX 2', 'bicycles'),
(1, 18.00, NULL, 'Specialized Sirrus', 'bicycles'),
(6, 150.00, 'KL123MN', 'Volkswagen California', 'campers'),
(4, 200.00, 'OP456QR', 'Ford Transit Custom Nugget', 'campers'),
(7, 180.00, 'ST789UV', 'Mercedes-Benz Marco Polo', 'campers'),
(4, 300.00, 'WX123YZ', 'Bayliner Element E16', 'boats'),
(6, 500.00, 'AB456CD', 'Yamaha 242X', 'boats'),
(8, 450.00, 'EF789GH', 'Sea Ray SPX 210', 'boats');

-- Inserimento dei dati nella tabella prenotazioni
INSERT INTO prenotazioni (data_ora_ritiro, data_ora_consegna, id_mezzo, cf)
VALUES 
('2024-12-23 10:00:00', '2024-12-24 10:00:00', 1, 'CF1234567890');