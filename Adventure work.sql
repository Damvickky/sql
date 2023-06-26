select *
from [AdventureWorks2017].[HumanResources].[EmployeeDepartmentHistory]
inner join

Select
PP.FirstName+' '+PP.MiddleName+' '+PP.LastName as FullName
, PH.PhoneNumber
, EmailAddress
from AdventureWorks2017.[Person].[Person] as PP
inner join AdventureWorks2017.[Person].[PersonPhone] as PH on pp.BusinessEntityID=ph.BusinessEntityID
inner join AdventureWorks2017.[Person].[EmailAddress] as PM on pm.BusinessEntityID=pp.BusinessEntityID

Select
PP.FirstName+' '+PP.MiddleName+' '+PP.LastName as FullName
, PH.PhoneNumber
, EmailAddress
from AdventureWorks2017.[Person].[Person] as PP
inner join AdventureWorks2017.[Person].[PersonPhone] as PH on pp.BusinessEntityID=ph.BusinessEntityID
inner join AdventureWorks2017.[Person].[EmailAddress] as PM on pm.BusinessEntityID=pp.BusinessEntityID

Select
pp.FirstName
,MiddleName
,LastName
, PH.PhoneNumber
, EmailAddress
from AdventureWorks2017.[Person].[Person] as PP
inner join AdventureWorks2017.[Person].[PersonPhone] as PH on pp.BusinessEntityID=ph.BusinessEntityID
inner join AdventureWorks2017.[Person].[EmailAddress] as PM on pm.BusinessEntityID=pp.BusinessEntityID
where FirstName like '%y%'

Select
pp.FirstName
,MiddleName
,LastName
, PH.PhoneNumber
, EmailAddress
from AdventureWorks2017.[Person].[Person] as PP
inner join AdventureWorks2017.[Person].[PersonPhone] as PH on pp.BusinessEntityID=ph.BusinessEntityID
inner join AdventureWorks2017.[Person].[EmailAddress] as PM on pm.BusinessEntityID=pp.BusinessEntityID
where FirstName like '__l__'

Select
pp.FirstName
,MiddleName
,LastName
, PH.PhoneNumber
, EmailAddress
from AdventureWorks2017.[Person].[Person] as PP
inner join AdventureWorks2017.[Person].[PersonPhone] as PH on pp.BusinessEntityID=ph.BusinessEntityID
inner join AdventureWorks2017.[Person].[EmailAddress] as PM on pm.BusinessEntityID=pp.BusinessEntityID
Order by FirstName asc,  LastName desc, MiddleName asc


select *
from AdventureWorks2017.[Production].[Product] as PP
inner join AdventureWorks2017.[Production].[ProductSubcategory] as ps on pp.ProductSubcategoryID=ps.ProductSubcategoryID
inner join AdventureWorks2017.[Production].[ProductCategory] as pc on ps.ProductCategoryID=pc.ProductCategoryID

select 
pc.Name as CatName
, ps.Name as SubCatName
, pp.Name as ProductName
, UnitPrice
, UnitPriceDiscount
from AdventureWorks2017.[Production].[Product] as PP
inner join AdventureWorks2017.[Production].[ProductSubcategory] as ps on pp.ProductSubcategoryID=ps.ProductSubcategoryID
inner join AdventureWorks2017.[Production].[ProductCategory] as pc on ps.ProductCategoryID=pc.ProductCategoryID
inner join AdventureWorks2017.[Sales].[SalesOrderDetail] as so on pp.ProductID=so.ProductID

select 
pc.Name as CatName
, SUM(UnitPrice) as Total
from AdventureWorks2017.[Production].[Product] as PP
inner join AdventureWorks2017.[Production].[ProductSubcategory] as ps on pp.ProductSubcategoryID=ps.ProductSubcategoryID
inner join AdventureWorks2017.[Production].[ProductCategory] as pc on ps.ProductCategoryID=pc.ProductCategoryID
inner join AdventureWorks2017.[Sales].[SalesOrderDetail] as so on pp.ProductID=so.ProductID
group by pc.Name

select 
pc.Name as CatName
, ps.Name as SubCatName
, SUM(UnitPrice) as Total
from AdventureWorks2017.[Production].[Product] as PP
inner join AdventureWorks2017.[Production].[ProductSubcategory] as ps on pp.ProductSubcategoryID=ps.ProductSubcategoryID
inner join AdventureWorks2017.[Production].[ProductCategory] as pc on ps.ProductCategoryID=pc.ProductCategoryID
inner join AdventureWorks2017.[Sales].[SalesOrderDetail] as so on pp.ProductID=so.ProductID
group by pc.Name, ps.Name

select 
pc.Name as CatName
, ps.Name as SubCatName
, pp.Name as ProductName
, SUM(UnitPrice) as Total
from AdventureWorks2017.[Production].[Product] as PP
inner join AdventureWorks2017.[Production].[ProductSubcategory] as ps on pp.ProductSubcategoryID=ps.ProductSubcategoryID
inner join AdventureWorks2017.[Production].[ProductCategory] as pc on ps.ProductCategoryID=pc.ProductCategoryID
inner join AdventureWorks2017.[Sales].[SalesOrderDetail] as so on pp.ProductID=so.ProductID
group by pc.Name, ps.Name, pp.Name