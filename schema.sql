/* Database schema to keep the structure of entire database. */

/* Project1 - Create database vet_clinic; */
CREATE DATABASE vet_clinic;


/* Project1 - Create table animals */
CREATE TABLE animals(
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(80),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal
);

/* Project 2 - Add species column to animals table */
ALTER TABLE animals ADD COLUMN species VARCHAR(80);

/* Project 3 - Create tables owners, species and set foreign keys in animals table */
CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  age INT NOT NULL
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(80) NOT NULL
);

ALTER TABLE animals ADD PRIMARY KEY(id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

/* Project 4 - Create table vets and join tables specializations and visits*/
CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(80),
  age INT,
  date_of_graduation DATE
);

CREATE TABLE specializations(
  species_id INT,
  vet_id INT,
  FOREIGN KEY(species_id) REFERENCES species(id),
  FOREIGN KEY(vet_id) REFERENCES vets(id),
  PRIMARY KEY (species_id, vet_id)
);

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  animal_id INT,
  vet_id INT,
  date_of_visit DATE NOT NULL,
  FOREIGN KEY(animal_id) REFERENCES animals(id),
  FOREIGN KEY(vet_id) REFERENCES vets(id)
);
