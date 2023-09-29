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

INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, TO_DATE('Apr 23, 2000', 'Mon DD, YYYY')),
('Maisy Smith', 26, TO_DATE('Jan 17, 2019', 'Mon DD, YYYY')),
('Stephanie Mendez', 64, TO_DATE('May 4, 1981', 'Mon DD, YYYY')),
('Jack Harkness', 38, TO_DATE('Jun 8, 2008', 'Mon DD, YYYY'));

INSERT INTO specializations (specie_id, vet_id) VALUES
(1,1),
(2,3),
(1,3),
(2,4);

INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES
(1, 1, TO_DATE('May 24, 2020', 'Mon DD, YYYY')),
(1, 3, TO_DATE('Jul 22, 2020', 'Mon DD, YYYY')),
(2, 4, TO_DATE('Feb 2, 2021', 'Mon DD, YYYY')),
(3, 2, TO_DATE('Jan 5, 2020', 'Mon DD, YYYY')),
(3, 2, TO_DATE('Mar 8, 2020', 'Mon DD, YYYY')),
(3, 2, TO_DATE('May 14, 2020', 'Mon DD, YYYY')),
(4, 3, TO_DATE('May 4, 2021', 'Mon DD, YYYY')),
(5, 4, TO_DATE('Feb 24, 2021', 'Mon DD, YYYY')),
(6, 2, TO_DATE('Dec 21, 2019', 'Mon DD, YYYY')),
(6, 1, TO_DATE('Aug 10, 2020', 'Mon DD, YYYY')),
(6, 2, TO_DATE('Apr 7, 2021', 'Mon DD, YYYY')),
(7, 3, TO_DATE('Sep 29, 2019', 'Mon DD, YYYY')),
(8, 4, TO_DATE('Oct 3, 2020', 'Mon DD, YYYY')),
(8, 4, TO_DATE('Nov 4, 2020', 'Mon DD, YYYY')),
(9, 2, TO_DATE('Jan 24, 2019', 'Mon DD, YYYY')),
(9, 2, TO_DATE('May 15, 2019', 'Mon DD, YYYY')),
(9, 2, TO_DATE('Feb 27, 2020', 'Mon DD, YYYY')),
(9, 2, TO_DATE('Aug 3, 2020', 'Mon DD, YYYY')),
(10, 3, TO_DATE('May 24, 2020', 'Mon DD, YYYY')),
(10, 1, TO_DATE('Jan 11, 2021', 'Mon DD, YYYY'));

