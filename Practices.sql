
create database CompanyDb

create table Customers(
 Id int primary key identity (1,1),
 [Name] nvarchar (50) not null,
 [Surname] nvarchar(50),
 [Age] int

)



insert into Customers ([Name],[Surname],[Age])

values('Cavid','Bashirov',29),
('Aqsin','Hummatov',27),
('Elcan','Qrubanov',20),
('Roya','Meherremova',27),
('Konul','Ibrahimova',27),
('Shaqi','Kazimov',25),
('Pervin','Rehimli',26)



--create view getCustomerById
--as
--Select * from Customers where Id = 1


select * from getCustomerById


--create function SayHelloWorld()
--returns nvarchar(50)
--as
--BEGIN
-- return 'Hello World'
--END

--select dbo.SayHelloWorld()




--create function dbo.writeWord(@word nvarchar(20))
--returns nvarchar(50)
--as
--BEGIN
-- return @word
--END

--declare @words nvarchar(20) = 'P135'

--select dbo.writeWord(@words)



create function dbo.writeWordsWithTwoParametr(@word nvarchar(20),@source nvarchar(20))
returns nvarchar(50)
as
BEGIN
 return @word+@source
END


Select dbo.writeWordsWithTwoParametr('Shaiq','P135')


create function dbo.sumOfNumbers(@num1 int,@num2 int)
returns int
as
BEGIN
 return @num1 + @num2
END


select dbo.sumOfNumbers(5,10)



--create function dbo.getCustomersCount()
--returns int
--as
--BEGIN

-- declare @count int
-- select @count = COUNT(*) from Customers
-- return @count

--END


--select dbo.getCustomersCount()



create function dbo.getCustomerAvarageAgeById(@id int)
returns int
as
BEGIN

 declare @avgAge int
 select @avgAge  = AVG(Age) from Customers where Id > @Id
 return @avgAge

END


select dbo.getCustomerAvarageAgeById(4)




create procedure usp_SayHelloWorld
as
BEGIN

print 'Hello World'

END


exec usp_SayHelloWorld




create procedure usp_sumOfNums
@num1 int,
@num2 int
as
BEGIN

print @num1+@num2

END


--create procedure usp_addCoustmer
--@name nvarchar(50),
--@surname nvarchar(50),
--@age int
--as
--BEGIN

--   insert into Customers([Name],[Surname],[Age])
--   values(@name,@surname,@age)
--END


--exec usp_addCoustmer 'Ali','Talibov',21




create procedure usp_deleteCustomerAndShow
@id int
as
BEGIN
 
   delete from Customers where Id =@id
   select * from Customers
END 


exec usp_deleteCustomerAndShow 7


create table Users(

 Id int primary key identity (1,1),
 [Name] nvarchar (50) not null,
 [Surname] nvarchar(50),
 [Age] int,
 [IsDeleted] bit default 'false'


)



insert into Users ([Name],[Surname],[Age])

values('Cavid','Bashirov',29),
('Aqsin','Hummatov',27),
('Elcan','Qrubanov',20),
('Roya','Meherremova',27),
('Konul','Ibrahimova',27),
('Shaqi','Kazimov',25),
('Pervin','Rehimli',26)


select * from Users




create table UserLogs(
 [Id] int primary key identity (1,1),
 [UserID] int,
 [Operation] nvarchar(20),
 [Date] datetime

)





--create trigger trg_insertUsers on Users
--after insert
--as
--BEGIN

-- insert into UserLogs([UserID],[Operation],[Date])
-- select Id,'Insert',GETDATE() from inserted

--END

 
create procedure usp_insertUser
@name nvarchar(20),
@age int
as
BEGIN

  insert into Users([Name],[Age])
  values (@name,@age)

END

exec usp_insertUser 'Ceyhun',23





--create trigger trg_deletedtUsers on Users
--after delete
--as
--BEGIN

-- insert into UserLogs([UserID],[Operation],[Date])
-- select Id,'Delete',GETDATE() from deleted

--END


--delete from Users where Id = 1



create trigger trg_updatedtUsers on Users
after update
as
BEGIN

 insert into UserLogs([UserID],[Operation],[Date])
 select Id,'Update',GETDATE() from deleted

END

update  Users
Set [Age] = 30 where Id =3


