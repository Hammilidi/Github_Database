CREATE DATABASE GitHub_Database;

USE GitHub_Database;


------------ Langage de Définition (LDD)----


---Création de la table Depots
CREATE TABLE Depots ( 
id_repo INTEGER PRIMARY KEY, 
nom NVARCHAR(255), etoiles INTEGER, 
url_link NVARCHAR(255), 
descriptif NVARCHAR(MAX), 
created_at DATE, 
forks INTEGER, 
watchers INTEGER, 
updated_at DATE, 
type_of_owner NVARCHAR(255) );

---Création de la table Contributeurs

CREATE TABLE Contributeurs (
id_contrib INT PRIMARY KEY,
contrib_nom NVARCHAR(255));

---Création de la table Topics

CREATE TABLE Topics (
    topic_id INT PRIMARY KEY,
    topic_name NVARCHAR(255)
);


-- Création de la table License

CREATE TABLE Licenses (
    license_id INT PRIMARY KEY,
    license_name NVARCHAR(255)
);


--Création de la table-relation Depot-License
CREATE TABLE DepotsLicenses (
    repo_id INT,
    license_id INT,
    FOREIGN KEY (repo_id) REFERENCES Depots(id_repo),
    FOREIGN KEY (license_id) REFERENCES Licenses(license_id)
);

---Création de la table-relation Depot-Contributeurs
CREATE TABLE DepotsContributeurs (
    repo_id INT,
    contrib_id INT,
    FOREIGN KEY (repo_id) REFERENCES Depots(id_repo),
    FOREIGN KEY (contrib_id) REFERENCES Contributeurs(id_contrib)
);

---Création de la table-relation Depot-Topics
CREATE TABLE DepotsTopics (
    repo_id INT,
    topic_id INT,
    FOREIGN KEY (repo_id) REFERENCES Depots(id_repo),
    FOREIGN KEY (topic_id) REFERENCES Topics(topic_id)
);