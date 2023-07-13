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
