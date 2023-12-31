/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name varchar(255),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD species varchar(255);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(255),
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    PRIMARY KEY (id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT,
ADD CONSTRAINT constraint_fk
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals
ADD owner_id INT,
ADD CONSTRAINT owner_fk_constraint
FOREIGN KEY (owner_id)
REFERENCES owners (id);

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    age INT,
    date_of_graduation date,
    PRIMARY KEY (id) 
);

CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY,
    specie_id INT,
    vet_id INT,
    FOREIGN KEY (specie_id)
    REFERENCES species (id),
    FOREIGN KEY (vet_id)
    REFERENCES vets (id),
    PRIMARY KEY (id)
);

CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animal_id INT,
    vet_id INT,
    date_of_visit date,
    FOREIGN KEY (animal_id)
    REFERENCES animals (id),
    FOREIGN KEY (vet_id)
    REFERENCES vets (id),
    PRIMARY KEY (id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


CREATE INDEX idx_animal_id ON visits (animal_id);

CREATE INDEX index_vet_id ON visits (vet_id );

CREATE INDEX idx_email ON owners (email);