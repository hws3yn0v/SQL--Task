create database library;
use library;

create table Books(
[Id] int primary key identity,
[Name] nvarchar(100) check (len([Name])>=2 and len([Name])<= 100),
[AuthorId] int,
[PageCount] int check ([PageCount] >= 10)
);

create table Authors (
    Id int primary key identity,
    [Name] nvarchar(100),
    [Surname] nvarchar(100)
);

CREATE VIEW BookView AS
SELECT b.Id, b.Name, b.PageCount, CONCAT(a.Name, ' ', a.Surname) AS AuthorFullName
FROM Books b
JOIN Authors a ON b.AuthorId = a.Id;


CREATE PROCEDURE SearchBooksByAuthor(IN authorName VARCHAR(100))
BEGIN
    SELECT b.Id, b.Name, b.PageCount, CONCAT(a.Name, ' ', a.Surname) AS AuthorFullName
    FROM Books b
    JOIN Authors a ON b.AuthorId = a.Id
    WHERE CONCAT(a.Name, ' ', a.Surname) = authorName;
END;


CREATE PROCEDURE InsertAuthor(IN authorId INT, IN authorName VARCHAR(100), IN authorSurname VARCHAR(100))
BEGIN
    INSERT INTO Authors (Id, Name, Surname)
    VALUES (authorId, authorName, authorSurname);
END;

CREATE PROCEDURE UpdateAuthor(IN authorId INT, IN authorName VARCHAR(100), IN authorSurname VARCHAR(100))
BEGIN
    UPDATE Authors
    SET Name = authorName, Surname = authorSurname
    WHERE Id = authorId;
END;


CREATE PROCEDURE DeleteAuthor(IN authorId INT)
BEGIN
    DELETE FROM Authors
    WHERE Id = authorId;
END;


CREATE VIEW AuthorSummary AS
SELECT a.Id, CONCAT(a.Name, ' ', a.Surname) AS FullName, COUNT(b.Id) AS BooksCount, MAX(b.PageCount) AS MaxPageCount
FROM Authors a
LEFT JOIN Books b ON a.Id = b.AuthorId
GROUP BY a.Id, a.Name, a.Surname;
