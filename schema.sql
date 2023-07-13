/* Database schema to keep the structure of entire database. */

/* Create database vet_clinic; */
CREATE DATABASE vet_clinic;


/* Create table animals */
CREATE TABLE animals(
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(80),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal
);

