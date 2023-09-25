/* Populate database with sample data. */

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1,'Agumon',TO_DATE('Feb 3, 2020', 'Mon DD, YYYY'),0,true,10.23);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2,'Gabumon',TO_DATE('Nov 15, 2018', 'Mon DD, YYYY'),2,true,8);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3,'Pikachu',TO_DATE('Jan 7, 2021', 'Mon DD, YYYY'),1,false,15.04);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4,'Devimon',TO_DATE('May 12, 2017', 'Mon DD, YYYY'),5,true,11);

