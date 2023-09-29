/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals set species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals set species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;
UPDATE animals set species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > 'Jan 1, 2022';
SAVEPOINT SP1;
UPDATE animals set weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO SP1;
SELECT * FROM animals;
UPDATE animals set weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

SELECT COUNT(*) AS nb_animals FROM animals;
SELECT COUNT(*) AS nb_animals FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) AS average_weight FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


SELECT o.full_name, a.name FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';
SELECT a.name, s.name FROM animals a INNER JOIN species s ON a.species_id = s.id WHERE s.id = 1;
SELECT o.full_name, a.name FROM animals a RIGHT JOIN owners o ON a.owner_id = o.id;
SELECT COUNT(a.name) AS nb_animal, s.name FROM animals a INNER JOIN species s ON a.species_id = s.id GROUP BY s.name;
SELECT o.full_name AS Owner_name, a.name AS Digimon FROM animals a INNER JOIN owners o ON a.owner_id = o.id INNER JOIN species s ON a.species_id = s.id WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';
SELECT o.full_name AS owner_name, a.name AS animal_name FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;
SELECT o.full_name AS owner_name, COUNT(a.name) AS nb_animal FROM animals a INNER JOIN owners o ON a.owner_id = o.id GROUP BY o.full_name ORDER BY nb_animal DESC LIMIT 1;


SELECT a.name, v.name, vs.date_of_visit
FROM animals a
INNER JOIN visits vs ON a.id = vs.animal_id
INNER JOIN vets v ON v.id = vs.vet_id
WHERE v.name = 'William Tatcher'
ORDER BY vs.date_of_visit DESC LIMIT 1;

SELECT v.name, COUNT(a.name) AS nb_animal
FROM animals a
INNER JOIN visits vs ON a.id = vs.animal_id
INNER JOIN vets v ON v.id = vs.vet_id
WHERE v.name = 'Stephanie Mendez' GROUP BY v.name;

SELECT v.name, s.name AS specialized
FROM vets v
LEFT JOIN specializations sp ON v.id = sp.vet_id
LEFT JOIN species s ON s.id = sp.specie_id;

SELECT v.name, a.name AS animal_name, vs.date_of_visit
FROM animals a
INNER JOIN visits vs ON a.id = vs.animal_id
INNER JOIN vets v ON v.id = vs.vet_id
WHERE vs.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' AND v.name = 'Stephanie Mendez';

SELECT a.name, COUNT(vs.animal_id) AS nb_visit
FROM animals a
INNER JOIN visits vs ON a.id = vs.animal_id
GROUP BY a.name ORDER BY COUNT(vs.animal_id) DESC LIMIT 1;

SELECT v.name AS vet, a.name, vs.date_of_visit
FROM visits vs
INNER JOIN animals a ON vs.animal_id = a.id
INNER JOIN vets v ON v.id = vs.vet_id
ORDER BY vs.date_of_visit ASC LIMIT 1;

SELECT v.name AS vet_name, s.name AS specialized_in, a.name AS animal_name,
s.name AS species, a.date_of_birth, a.neutered, a.weight_kg,
vs.date_of_visit AS recent_visit
FROM animals a
INNER JOIN visits vs ON a.id = vs.animal_id
INNER JOIN vets v ON v.id = vs.vet_id
INNER JOIN specializations sp ON sp.vet_id = v.id
INNER JOIN species s ON s.id = sp.specie_id
GROUP BY v.name, a.name, s.name, a.date_of_birth, a.neutered, a.weight_kg, vs.date_of_visit
ORDER BY vs.date_of_visit DESC LIMIT 1;

SELECT vt.name AS vet, COUNT(*) AS visits_with_no_specialization
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN species s ON a.species_id = s.id
JOIN vets vt ON v.vet_id = vt.id
LEFT JOIN specializations sp ON v.vet_id = sp.vet_id AND s.id = sp.specie_id
WHERE sp.vet_id IS NULL GROUP BY vt.name;

SELECT vt.name AS vet_name, a.name AS species_specialisation
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
JOIN species s ON a.species_id = s.id
WHERE vt.name = 'Maisy Smith'
GROUP BY vt.name, a.name
ORDER BY COUNT(v.animal_id)
DESC LIMIT 1;

