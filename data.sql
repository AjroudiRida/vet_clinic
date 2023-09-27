/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES 
('Agumon',TO_DATE('Feb 3, 2020', 'Mon DD, YYYY'),0,true,10.23),
('Gabumon',TO_DATE('Nov 15, 2018', 'Mon DD, YYYY'),2,true,8),
('Pikachu',TO_DATE('Jan 7, 2021', 'Mon DD, YYYY'),1,false,15.04),
('Devimon',TO_DATE('May 12, 2017', 'Mon DD, YYYY'),5,true,11);


INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES 
('Charmander',TO_DATE('Feb 8, 2020', 'Mon DD, YYYY'),0,false,-11),
('Plantmon',TO_DATE('Nov 15, 2021', 'Mon DD, YYYY'),2,true,-5.7),
('Squirtle',TO_DATE('Apr 2, 1993', 'Mon DD, YYYY'),3,false,-12.13),
('Angemon',TO_DATE('Jun 12, 2005', 'Mon DD, YYYY'),1,true,-45),
('Boarmon',TO_DATE('Jun 7, 2005', 'Mon DD, YYYY'),7,true,20.4),
('Blossom',TO_DATE('Oct 13, 1998', 'Mon DD, YYYY'),3,true,17),
('Ditto',TO_DATE('May 14, 2022', 'Mon DD, YYYY'),4,true,22);

INSERT INTO owners (full_name,age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

