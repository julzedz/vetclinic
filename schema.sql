/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name VARCHAR(100),
    id INT PRIMARY KEY NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species VARCHAR(255);

CREATE TABLE owners(
id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(100),
age INT,
PRIMARY KEY(id)
);
CREATE TABLE species(
id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

CREATE TABLE vets ( id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY, name VARCHAR, age INT, date_of_graduation DATE, PRIMARY KEY(id));

CREATE TABLE specializations ( species_id INTEGER REFERENCES species(id), vet_id INTEGER REFERENCES vets(id) );

CREATE TABLE visits ( animal_id INTEGER REFERENCES animals(id), vet_id INTEGER REFERENCES vets(id), date_of_visit DATE );

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
