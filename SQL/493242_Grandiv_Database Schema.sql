-- Muhammad Grandiv Lava Putra
-- 22/493242/TK/54023

-- Database Schema for Good Reading Bookstore
-- @block
BEGIN;

-- @block
CREATE TABLE IF NOT EXISTS public."Book"
(
    "BookID" serial NOT NULL,
    "BookName" character varying(200) NOT NULL,
    "ISBN" character varying(15),
    "PublicationYear" integer,
    "Pages" integer,
    "BookPrice" numeric,
    "PublisherID" integer,
    "LanguageID" integer,
    "BookFormatID" integer,
    PRIMARY KEY ("BookID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Author"
(
    "AuthorID" serial NOT NULL,
    "AuthorName" character varying(100) NOT NULL,
    "YearBorn" integer,
    "YearDied" integer,
    PRIMARY KEY ("AuthorID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Publisher"
(
    "PublisherID" serial NOT NULL,
    "PublisherName" character varying(100) NOT NULL,
    "City" character varying(50),
    "Country" character varying(50),
    "Telephone" character varying(20),
    "YearFounded" integer,
    PRIMARY KEY ("PublisherID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."CustomerAccount"
(
    "CustomerID" serial NOT NULL,
    "FirstName" character varying(50),
    "LastName" character varying(50),
    "Username" character varying(50) NOT NULL,
    "Email" character varying(100) NOT NULL,
    "PasswordHash" character varying(256) NOT NULL,
    "CreatedAt" timestamp with time zone,
    PRIMARY KEY ("CustomerID"),
    CONSTRAINT "AccountUnique" UNIQUE ("Email", "Username")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Wishlist"
(
    "WishlistID" serial NOT NULL,
    "CustomerID" integer,
    "CreatedAt" timestamp with time zone,
    PRIMARY KEY ("WishlistID"),
    CONSTRAINT "WishlistCustomerIDUnique" UNIQUE ("CustomerID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Wishlist_Book"
(
    "WishlistID" integer NOT NULL,
    "BookID" integer NOT NULL,
    "AddedAt" timestamp with time zone,
    PRIMARY KEY ("WishlistID", "BookID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Genre"
(
    "GenreID" serial NOT NULL,
    "GenreName" character varying(50) NOT NULL,
    PRIMARY KEY ("GenreID"),
    CONSTRAINT "GenreNameUnique" UNIQUE ("GenreName")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Book_Genre"
(
    "BookID" integer,
    "GenreID" integer,
    PRIMARY KEY ("BookID", "GenreID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."BookInventory"
(
    "InventoryID" serial NOT NULL,
    "BookID" integer,
    "StoreID" integer,
    "Stock" integer,
    PRIMARY KEY ("InventoryID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Store"
(
    "StoreID" serial NOT NULL,
    "StoreName" character varying(100),
    "Address" character varying(200),
    "City" character varying(50),
    "Country" character varying(50),
    "Telephone" character varying(20),
    PRIMARY KEY ("StoreID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Staff"
(
    "StaffID" serial NOT NULL,
    "StoreID" integer,
    "StaffName" character varying(100),
    "Position" character varying(50),
    "Salary" numeric,
    PRIMARY KEY ("StaffID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."BookReview"
(
    "ReviewID" serial NOT NULL,
    "BookID" integer,
    "CustomerID" integer,
    "Rating" numeric,
    "ReviewText" text,
    "CreatedAt" timestamp with time zone,
    PRIMARY KEY ("ReviewID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Book_Author"
(
    "BookID" integer NOT NULL,
    "AuthorID" integer NOT NULL,
    PRIMARY KEY ("BookID", "AuthorID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Order"
(
    "OrderID" serial NOT NULL,
    "InventoryID" integer,
    "CustomerID" integer,
    "OrderDate" timestamp with time zone,
    "Status" character varying(15),
    "Quantity" integer,
    "TotalAmount" numeric,
    PRIMARY KEY ("OrderID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."Language"
(
    "LanguageID" serial NOT NULL,
    "LanguageCode" character varying(10),
    "LanguageName" character varying(20),
    PRIMARY KEY ("LanguageID")
);

-- @block
CREATE TABLE IF NOT EXISTS public."BookFormat"
(
    "BookFormatID" serial NOT NULL,
    "BookFormatName" character varying(30),
    PRIMARY KEY ("BookFormatID")
);

-- @block
ALTER TABLE IF EXISTS public."Book"
    ADD CONSTRAINT "Book_FK1" FOREIGN KEY ("PublisherID")
    REFERENCES public."Publisher" ("PublisherID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Book"
    ADD CONSTRAINT "Book_FK2" FOREIGN KEY ("LanguageID")
    REFERENCES public."Language" ("LanguageID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE SET NULL
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Book"
    ADD CONSTRAINT "Book_FK3" FOREIGN KEY ("BookFormatID")
    REFERENCES public."BookFormat" ("BookFormatID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE SET NULL
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Wishlist"
    ADD CONSTRAINT "Wishlist_FK1" FOREIGN KEY ("CustomerID")
    REFERENCES public."CustomerAccount" ("CustomerID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Wishlist_Book"
    ADD CONSTRAINT "Wishlist_Book_FK1" FOREIGN KEY ("WishlistID")
    REFERENCES public."Wishlist" ("WishlistID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Wishlist_Book"
    ADD CONSTRAINT "Wishlist_Book_FK2" FOREIGN KEY ("BookID")
    REFERENCES public."Book" ("BookID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Book_Genre"
    ADD CONSTRAINT "Book_Genre_FK1" FOREIGN KEY ("BookID")
    REFERENCES public."Book" ("BookID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Book_Genre"
    ADD CONSTRAINT "Book_Genre_FK2" FOREIGN KEY ("GenreID")
    REFERENCES public."Genre" ("GenreID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."BookInventory"
    ADD CONSTRAINT "BookInventory_FK1" FOREIGN KEY ("BookID")
    REFERENCES public."Book" ("BookID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."BookInventory"
    ADD CONSTRAINT "BookInventory_FK2" FOREIGN KEY ("StoreID")
    REFERENCES public."Store" ("StoreID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Staff"
    ADD CONSTRAINT "Staff_FK1" FOREIGN KEY ("StoreID")
    REFERENCES public."Store" ("StoreID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."BookReview"
    ADD CONSTRAINT "BookReview_FK1" FOREIGN KEY ("BookID")
    REFERENCES public."Book" ("BookID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."BookReview"
    ADD CONSTRAINT "BookReview_FK2" FOREIGN KEY ("CustomerID")
    REFERENCES public."CustomerAccount" ("CustomerID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Book_Author"
    ADD CONSTRAINT "Book_Author_FK1" FOREIGN KEY ("BookID")
    REFERENCES public."Book" ("BookID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Book_Author"
    ADD CONSTRAINT "Book_Author_FK2" FOREIGN KEY ("AuthorID")
    REFERENCES public."Author" ("AuthorID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Order"
    ADD CONSTRAINT "Order_FK1" FOREIGN KEY ("InventoryID")
    REFERENCES public."BookInventory" ("InventoryID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;

-- @block
ALTER TABLE IF EXISTS public."Order"
    ADD CONSTRAINT "Order_FK2" FOREIGN KEY ("CustomerID")
    REFERENCES public."CustomerAccount" ("CustomerID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;
	
-- @block
CREATE VIEW public."View_Revenue_Per_Store" AS
SELECT
    s."StoreID",
    s."StoreName",
    SUM(o."Quantity") AS "BooksSold",
    SUM(o."Quantity" * b."BookPrice") AS "TotalRevenue"
FROM
    public."Order" o
JOIN
    public."BookInventory" bi ON o."InventoryID" = bi."InventoryID"
JOIN
    public."Book" b ON bi."BookID" = b."BookID"
JOIN
    public."Store" s ON bi."StoreID" = s."StoreID"
GROUP BY
    s."StoreID", s."StoreName";

-- @block
CREATE VIEW public."View_Books_Availability" AS
SELECT 
    b."BookID",
    b."BookName",
    s."StoreID",
    s."StoreName",
    bi."Stock"
FROM 
    public."Book" b
JOIN 
    public."BookInventory" bi ON b."BookID" = bi."BookID"
JOIN 
    public."Store" s ON bi."StoreID" = s."StoreID";

-- @block
CREATE VIEW public."View_Customer_Reviews" AS
SELECT 
    br."ReviewID",
    ca."Username",
    b."BookName",
    br."Rating",
    br."ReviewText",
    br."CreatedAt"
FROM 
    public."BookReview" br
JOIN 
    public."CustomerAccount" ca ON br."CustomerID" = ca."CustomerID"
JOIN 
    public."Book" b ON br."BookID" = b."BookID";

-- @block
CREATE VIEW public."View_Orders_Details" AS
SELECT 
    o."OrderID",
    ca."Username",
    b."BookName",
    o."Quantity",
    o."OrderDate",
    o."TotalAmount"
FROM 
    public."Order" o
JOIN 
    public."CustomerAccount" ca ON o."CustomerID" = ca."CustomerID"
JOIN 
    public."BookInventory" bi ON o."InventoryID" = bi."InventoryID"
JOIN 
    public."Book" b ON bi."BookID" = b."BookID";

-- @block
CREATE VIEW public."View_Genre_Books" AS
SELECT 
    g."GenreName",
    b."BookName"
FROM 
    public."Genre" g
JOIN 
    public."Book_Genre" bg ON g."GenreID" = bg."GenreID"
JOIN 
    public."Book" b ON bg."BookID" = b."BookID";

-- @block
END;


-- Show result for all tables and views in the public schema
-- @block
SELECT tablename AS name, 'table' AS type
FROM pg_tables
WHERE schemaname = 'public'
UNION ALL
SELECT viewname AS name, 'view' AS type
FROM pg_views
WHERE schemaname = 'public'
ORDER BY name;

-- Show the DDL for the View_Revenue_Per_Store view
-- @block
SELECT * FROM "View_Revenue_Per_Store";

-- Show the DDL for the View_Books_Availability view
-- @block
SELECT * FROM "View_Books_Availability";

-- Show the DDL for the View_Customer_Reviews view
-- @block
SELECT * FROM "View_Customer_Reviews";

-- Show the DDL for the View_Orders_Details view
-- @block
SELECT * FROM "View_Orders_Details";

-- Show the DDL for the View_Genre_Books view
-- @block
SELECT * FROM "View_Genre_Books";