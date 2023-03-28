
create database CourseDb

create table Students(
 
 Id int primary key identity (1,1),
 [Name] nvarchar (50) not null,
 [Surname] nvarchar(50),
 [Age] int,
 [Email] nvarchar(50)unique,
 [Address] nvarchar(100)
)


insert into Students ([Name],[Surname],[Email],[Age],[Address])

values('Aqsin','Hummatov','aqsin.@gmail.com',27,'Xirdalan'),
('Elcan','Qrubanov','elcan.@gmail.com',20,'Hovsan'),
('Roya','Mehheremova','roya.@gmail.com',27,'Sumqayit'),
('Konul','Elekberova','konul.@gmail.com',27,'Neftciler'),
('Mirze','Bashirzade','mirze.@gmail.com',26,'Bulbule'),
('Pervin','Rehimli','pervin.@gmail.com',24,'Sumqayit')





create table StudentsArchives(
 [Id] int primary key identity (1,1),
 [UserID] int,
 [Operation] nvarchar(20),
 [Date] datetime
)


create trigger trg_deletedtStudents on Students
after delete
as
BEGIN

 insert into StudentsArchives([UserID],[Operation],[Date])
 select Id,'Delete',GETDATE() from deleted

END




create procedure usp_deletedtStudents
@id int
as
BEGIN

  delete from Students where id = @id

END


exec usp_deletedtStudents 1