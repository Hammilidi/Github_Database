CREATE DATABASE GitHub_Database;

USE GitHub_Database;


------------ Langage de Définition (LDD)----


-- Création de la table Projet
CREATE TABLE Projet (
    project_id INT PRIMARY KEY,
    nom NVARCHAR(255),
    full_name NVARCHAR(255),
    url_link NVARCHAR(500),
    descriptif NVARCHAR(MAX),
    stars INT,
    created_at DATETIME,
    language_id INT,  -- Clé étrangère vers l'entité Langage
    forks INT,
    updated_at DATETIME,
    license_id INT,  -- Clé étrangère vers l'entité Licence
    type_of_owner NVARCHAR(50)
);

-- Création de la table Langage
CREATE TABLE Langage (
    language_id INT PRIMARY KEY,
    language_name NVARCHAR(100)
);

-- Table Licence
CREATE TABLE Licence (
    license_id INT PRIMARY KEY,
    license_name NVARCHAR(100) NULL -- Autoriser les valeurs NULL
);

-- Table Contributeur
CREATE TABLE Contributeur (
    contributor_id INT PRIMARY KEY,
    contributor_name NVARCHAR(100) NULL -- Autoriser les valeurs NULL
);


-- Création de la table Sujet
CREATE TABLE Sujet (
    topic_id INT PRIMARY KEY,
    topic_name NVARCHAR(100)
);
----------------------------------------------------------------------------------------------------------
-- Création de la table Participation
CREATE TABLE Participation (
    project_id INT,
    contributor_id INT,
    PRIMARY KEY (project_id, contributor_id),
    FOREIGN KEY (project_id) REFERENCES Projet(project_id),
    FOREIGN KEY (contributor_id) REFERENCES Contributeur(contributor_id)
);

-- Création de la table Projet_Sujet
CREATE TABLE Projet_Sujet (
    project_id INT,
    topic_id INT,
    PRIMARY KEY (project_id, topic_id),
    FOREIGN KEY (project_id) REFERENCES Projet(project_id),
    FOREIGN KEY (topic_id) REFERENCES Sujet(topic_id)
);


