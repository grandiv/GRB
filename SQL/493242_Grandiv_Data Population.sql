-- Muhammad Grandiv Lava Putra
-- 22/493242/TK/54023

-- Data population for Good Reading Bookstore
-- @block
BEGIN; 

-- @block
INSERT INTO public."Language" ("LanguageCode", "LanguageName") VALUES
('en', 'English'), ('th', 'Thai'), ('el', 'Greek'), ('cs', 'Czech'),
('nl', 'Dutch'), ('sv', 'Swedish'), ('ko', 'Korean'), ('pt', 'Portuguese'),
('it', 'Italian'), ('zh', 'Chinese'), ('ja', 'Japanese'), ('ru', 'Russian'),
('hi', 'Hindi'), ('ar', 'Arabic'), ('bn', 'Bengali'), ('tr', 'Turkish'),
('vi', 'Vietnamese'), ('fr', 'French'), ('de', 'German'), ('es', 'Spanish');

-- @block
INSERT INTO public."BookFormat" ("BookFormatName") VALUES
('Hardcover'), ('Paperback'), ('Ebook'), ('Audiobook'),
('Mass Market Paperback'), ('Library Binding'),
('Board Book'), ('Leather Bound'), ('Spiral-bound'),
('Loose Leaf'), ('Flexibound'), ('Box Set'), ('Comb Bound'),
('Trade Paperback'), ('Graphic Novel'), ('Multimedia CD'),
('Calendar'), ('Big Book'), ('Journal'), ('Sheet Music');

-- @block
INSERT INTO public."Publisher" ("PublisherName", "City", "Country", "Telephone", "YearFounded") VALUES
('Penguin Random House', 'New York', 'USA', '1234567890', 1927),
('HarperCollins', 'New York', 'USA', '2345678901', 1989),
('Macmillan Publishers', 'London', 'UK', '3456789012', 1843),
('Simon & Schuster', 'New York', 'USA', '4567890123', 1924),
('Hachette Livre', 'Paris', 'France', '5678901234', 1826),
('Scholastic', 'New York', 'USA', '6789012345', 1920),
('Pearson Education', 'London', 'UK', '7890123456', 1844),
('Wiley', 'Hoboken', 'USA', '8901234567', 1807),
('Springer', 'Berlin', 'Germany', '9012345678', 1842),
('Oxford University Press', 'Oxford', 'UK', '0123456789', 1586),
('Cambridge University Press', 'Cambridge', 'UK', '1123456789', 1534),
('McGraw-Hill Education', 'New York', 'USA', '2123456789', 1888),
('Routledge', 'London', 'UK', '3123456789', 1836),
('Elsevier', 'Amsterdam', 'Netherlands', '4123456789', 1880),
('Houghton Mifflin Harcourt', 'Boston', 'USA', '5123456789', 1832),
('Thames & Hudson', 'London', 'UK', '6123456789', 1949),
('Cengage Learning', 'Boston', 'USA', '7123456789', 2007),
('Faber and Faber', 'London', 'UK', '8123456789', 1929),
('Pan Macmillan', 'London', 'UK', '9123456789', 1942),
('Bloomsbury', 'London', 'UK', '0012345678', 1986);

-- @block
INSERT INTO public."Author" ("AuthorName", "YearBorn", "YearDied") VALUES
('J.K. Rowling', 1965, NULL), ('George R.R. Martin', 1948, NULL),
('J.R.R. Tolkien', 1892, 1973), ('Agatha Christie', 1890, 1976),
('Stephen King', 1947, NULL), ('Jane Austen', 1775, 1817),
('Mark Twain', 1835, 1910), ('Charles Dickens', 1812, 1870),
('Ernest Hemingway', 1899, 1961), ('F. Scott Fitzgerald', 1896, 1940),
('Leo Tolstoy', 1828, 1910), ('H.G. Wells', 1866, 1946),
('Virginia Woolf', 1882, 1941), ('Edgar Allan Poe', 1809, 1849),
('Herman Melville', 1819, 1891), ('Gabriel Garcia Marquez', 1927, 2014),
('Haruki Murakami', 1949, NULL), ('Isabel Allende', 1942, NULL),
('Chinua Achebe', 1930, 2013), ('Margaret Atwood', 1939, NULL);

-- @block
INSERT INTO public."Book" ("BookName", "ISBN", "PublicationYear", "Pages", "BookPrice", 
"PublisherID", "LanguageID", "BookFormatID") VALUES
('Harry Potter and the Sorcerer''s Stone', '9780439708180', 1997, 309, 19.99, 1, 1, 1),
('A Game of Thrones', '9780553103540', 1996, 694, 22.99, 2, 1, 1),
('The Hobbit', '9780618968633', 1937, 310, 14.99, 3, 1, 2),
('Murder on the Orient Express', '9780007119318', 1934, 256, 9.99, 4, 1, 2),
('The Shining', '9780307743657', 1977, 447, 16.99, 5, 1, 2),
('Pride and Prejudice', '9780199535569', 1813, 279, 6.99, 6, 1, 3),
('The Adventures of Tom Sawyer', '9780141321103', 1876, 224, 7.99, 7, 1, 3),
('A Tale of Two Cities', '9780141199701', 1859, 544, 8.99, 8, 1, 3),
('The Old Man and the Sea', '9780684801223', 1952, 127, 12.99, 9, 1, 4),
('The Great Gatsby', '9780743273565', 1925, 180, 10.99, 10, 1, 4),
('War and Peace', '9780199232765', 1869, 1392, 20.99, 11, 1, 4),
('The War of the Worlds', '9780486295060', 1898, 192, 8.99, 12, 1, 4),
('To the Lighthouse', '9780156907392', 1927, 209, 14.99, 13, 1, 4),
('The Tell-Tale Heart', '9780486268767', 1843, 64, 3.99, 14, 1, 4),
('Moby-Dick', '9781503280786', 1851, 378, 9.99, 15, 1, 4),
('One Hundred Years of Solitude', '9780060883287', 1967, 417, 15.99, 16, 18, 4),
('Kafka on the Shore', '9781400079278', 2002, 505, 16.99, 17, 11, 4),
('The House of the Spirits', '9781501117016', 1982, 433, 14.99, 18, 18, 4),
('Things Fall Apart', '9780385474542', 1958, 209, 11.99, 19, 18, 4),
('The Handmaid''s Tale', '9780385490817', 1985, 311, 15.99, 20, 1, 4);

-- @block
INSERT INTO public."CustomerAccount" ("FirstName", "LastName", "Username", 
"Email", "PasswordHash", "CreatedAt") VALUES
('John', 'Doe', 'johndoe', 'johndoe@example.com', 'hash1', NOW()),
('Jane', 'Smith', 'janesmith', 'janesmith@example.com', 'hash2', NOW()),
('Alice', 'Johnson', 'alicej', 'alicej@example.com', 'hash3', NOW()),
('Bob', 'Brown', 'bobb', 'bobb@example.com', 'hash4', NOW()),
('Charlie', 'Davis', 'charlied', 'charlied@example.com', 'hash5', NOW()),
('Diana', 'Garcia', 'dianag', 'dianag@example.com', 'hash6', NOW()),
('Eve', 'Martinez', 'evem', 'evem@example.com', 'hash7', NOW()),
('Frank', 'Hernandez', 'frankh', 'frankh@example.com', 'hash8', NOW()),
('Grace', 'Lopez', 'gracel', 'gracel@example.com', 'hash9', NOW()),
('Hank', 'Gonzalez', 'hankg', 'hankg@example.com', 'hash10', NOW()),
('Ivy', 'Wilson', 'ivyw', 'ivyw@example.com', 'hash11', NOW()),
('Jack', 'Anderson', 'jacka', 'jacka@example.com', 'hash12', NOW()),
('Kathy', 'Thomas', 'kathyt', 'kathyt@example.com', 'hash13', NOW()),
('Leo', 'Taylor', 'leot', 'leot@example.com', 'hash14', NOW()),
('Mona', 'Moore', 'monam', 'monam@example.com', 'hash15', NOW()),
('Nick', 'Martin', 'nickm', 'nickm@example.com', 'hash16', NOW()),
('Olivia', 'Lee', 'olivial', 'olivial@example.com', 'hash17', NOW()),
('Paul', 'Perez', 'paulp', 'paulp@example.com', 'hash18', NOW()),
('Quinn', 'White', 'quinnw', 'quinnw@example.com', 'hash19', NOW()),
('Rachel', 'Harris', 'rachelh', 'rachelh@example.com', 'hash20', NOW());

-- @block
INSERT INTO public."Wishlist" ("CustomerID", "CreatedAt") VALUES
(1, NOW()), (2, NOW()), (3, NOW()), (4, NOW()), (5, NOW()),
(6, NOW()), (7, NOW()), (8, NOW()), (9, NOW()), (10, NOW()),
(11, NOW()), (12, NOW()), (13, NOW()), (14, NOW()), (15, NOW()),
(16, NOW()), (17, NOW()), (18, NOW()), (19, NOW()), (20, NOW());

-- @block
INSERT INTO public."Wishlist_Book" ("WishlistID", "BookID", "AddedAt") VALUES
(1, 1, NOW()), (1, 2, NOW()), (2, 3, NOW()), (2, 4, NOW()), (3, 5, NOW()),
(3, 6, NOW()), (4, 7, NOW()), (4, 8, NOW()), (5, 9, NOW()), (5, 10, NOW()),
(6, 11, NOW()), (6, 12, NOW()), (7, 13, NOW()), (7, 14, NOW()), (8, 15, NOW()),
(8, 16, NOW()), (9, 17, NOW()), (9, 18, NOW()), (10, 19, NOW()), (10, 20, NOW());

-- @block
INSERT INTO public."Genre" ("GenreName") VALUES
('Fantasy'), ('Science Fiction'), ('Mystery'),
('Thriller'), ('Romance'), ('Historical'),
('Horror'), ('Biography'), ('Self-help'),
('Travel'), ('Children''s'), ('Young Adult'),
('Poetry'), ('Graphic Novel'), ('Classics'),
('Adventure'), ('Philosophy'), ('Non-fiction'),
('Crime'), ('Drama');

-- @block
INSERT INTO public."Book_Genre" ("BookID", "GenreID") VALUES
(1, 1), (2, 1), (3, 1), (4, 3), (5, 7), (6, 15), (7, 15),
(8, 6), (9, 9), (10, 15), (11, 6), (12, 2), (13, 15),
(14, 20), (15, 15), (16, 18), (17, 1), (18, 18),
(19, 18), (20, 4);

-- @block
INSERT INTO public."BookInventory" ("BookID", "StoreID", "Stock") VALUES
(1, 1, 10), (2, 1, 5), (3, 2, 20), (4, 2, 15), (5, 3, 25), (6, 3, 30),
(7, 4, 8), (8, 4, 12), (9, 5, 18), (10, 5, 22), (11, 6, 10), (12, 6, 5),
(13, 7, 20), (14, 7, 15), (15, 8, 25), (16, 8, 30), (17, 9, 8), (18, 9, 12),
(19, 10, 18), (20, 10, 22);

-- @block
INSERT INTO public."Store" ("StoreName", "Address", "City", "Country", "Telephone") VALUES
('Central Bookstore', '123 Main St', 'New York', 'USA', '123-456-7890'),
('Downtown Books', '456 Elm St', 'Los Angeles', 'USA', '234-567-8901'),
('City Lights', '789 Pine St', 'San Francisco', 'USA', '345-678-9012'),
('Book Haven', '101 Maple St', 'Chicago', 'USA', '456-789-0123'),
('Readers'' Corner', '202 Oak St', 'Houston', 'USA', '567-890-1234'),
('Book Nook', '303 Birch St', 'Phoenix', 'USA', '678-901-2345'),
('Page Turners', '404 Cedar St', 'Philadelphia', 'USA', '789-012-3456'),
('Novel Ideas', '505 Aspen St', 'San Antonio', 'USA', '890-123-4567'),
('Book Emporium', '606 Walnut St', 'Dallas', 'USA', '901-234-5678'),
('Literary Lane', '707 Chestnut St', 'San Diego', 'USA', '012-345-6789'),
('Bookworm Haven', '808 Spruce St', 'San Jose', 'USA', '112-345-6789'),
('The Reading Room', '909 Redwood St', 'Austin', 'USA', '212-345-6789'),
('Books & Beyond', '1010 Sycamore St', 'Jacksonville', 'USA', '312-345-6789'),
('Book Paradise', '1111 Willow St', 'Columbus', 'USA', '412-345-6789'),
('Literary Escape', '1212 Fir St', 'Fort Worth', 'USA', '512-345-6789'),
('Bound Pages', '1313 Palm St', 'Indianapolis', 'USA', '612-345-6789'),
('Book Oasis', '1414 Magnolia St', 'Charlotte', 'USA', '712-345-6789'),
('Readers'' Retreat', '1515 Bay St', 'San Francisco', 'USA', '812-345-6789'),
('Page Masters', '1616 Elm St', 'Seattle', 'USA', '912-345-6789'),
('Novel Nook', '1717 Maple St', 'Denver', 'USA', '001-234-5678');

-- @block
INSERT INTO public."Staff" ("StoreID", "StaffName", "Position", "Salary") VALUES
(1, 'Alice Johnson', 'Sales', 50000), (1, 'Bob Brown', 'Cashier', 25000),
(2, 'Charlie Davis', 'Sales', 52000), (2, 'Diana Garcia', 'Cashier', 26000),
(3, 'Eve Martinez', 'Manager', 53000), (3, 'Frank Hernandez', 'Cashier', 27000),
(4, 'Grace Lopez', 'Manager', 54000), (4, 'Hank Gonzalez', 'Sales', 28000),
(5, 'Ivy Wilson', 'Manager', 55000), (5, 'Jack Anderson', 'Cashier', 29000),
(6, 'Kathy Thomas', 'Sales', 56000), (6, 'Leo Taylor', 'Sales', 30000),
(7, 'Mona Moore', 'Manager', 57000), (7, 'Nick Martin', 'Sales', 31000),
(8, 'Olivia Lee', 'Manager', 58000), (8, 'Paul Perez', 'Cashier', 32000),
(9, 'Quinn White', 'Manager', 59000), (9, 'Rachel Harris', 'Cashier', 33000),
(10, 'Sam Wilson', 'Sales', 60000), (10, 'Tina Turner', 'Cashier', 34000);

-- @block
INSERT INTO public."BookReview" ("BookID", "CustomerID", "Rating", "ReviewText", "CreatedAt") VALUES
(1, 1, 5, 'Amazing book!', NOW()), (2, 2, 4.2, 'Great read, but a bit long.', NOW()),
(3, 3, 5, 'Couldn''t put it down.', NOW()), (4, 4, 3.7, 'Interesting, but not my favorite.', NOW()),
(5, 5, 5, 'Loved it from start to finish.', NOW()), (6, 6, 2.1, 'Not my cup of tea.', NOW()),
(7, 7, 5, 'A masterpiece.', NOW()), (8, 8, 4.8, 'Well-written and engaging.', NOW()),
(9, 9, 3, 'It was okay.', NOW()), (10, 10, 5, 'Excellent!', NOW()),
(11, 11, 4.4, 'Enjoyable, but some parts were slow.', NOW()), (12, 12, 3.5, 'Average read.', NOW()),
(13, 13, 5, 'Fantastic!', NOW()), (14, 14, 4.9, 'Really good, but could have been shorter.', NOW()),
(15, 15, 5, 'Outstanding!', NOW()), (16, 16, 2.0, 'Did not enjoy it.', NOW()),
(17, 17, 5, 'Highly recommend!', NOW()), (18, 18, 4.2, 'Very good.', NOW()),
(19, 19, 3.6, 'Just alright.', NOW()), (20, 20, 5, 'Loved every page!', NOW());

-- @block
INSERT INTO public."Book_Author" ("BookID", "AuthorID") VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 7), (5, 17), (6, 6), (7, 7),
(8, 8), (9, 9), (10, 7), (11, 11), (12, 10), (13, 13), (14, 14),
(15, 15), (16, 16), (17, 20), (17, 5), (18, 18), (19, 19), (20, 20);

-- @block
INSERT INTO public."Order" ("InventoryID", "CustomerID", "OrderDate", "Status", 
"Quantity", "TotalAmount") VALUES
(1, 1, NOW(), 'Shipped', 2, 39.98), (2, 2, NOW(), 'Processing', 1, 24.99),
(3, 3, NOW(), 'Delivered', 3, 59.97), (4, 4, NOW(), 'Cancelled', 1, 19.99),
(5, 5, NOW(), 'Shipped', 4, 79.96), (6, 6, NOW(), 'Processing', 2, 49.98),
(7, 7, NOW(), 'Delivered', 1, 24.99), (8, 8, NOW(), 'Cancelled', 3, 74.97),
(9, 9, NOW(), 'Shipped', 2, 39.98), (10, 10, NOW(), 'Processing', 1, 19.99),
(11, 11, NOW(), 'Delivered', 3, 44.97), (12, 12, NOW(), 'Cancelled', 1, 14.99),
(13, 13, NOW(), 'Shipped', 2, 29.98), (14, 14, NOW(), 'Processing', 4, 99.96),
(15, 15, NOW(), 'Delivered', 1, 24.99), (16, 16, NOW(), 'Cancelled', 2, 39.98),
(17, 17, NOW(), 'Shipped', 3, 74.97), (18, 18, NOW(), 'Processing', 1, 19.99),
(19, 19, NOW(), 'Delivered', 2, 34.98), (20, 20, NOW(), 'Cancelled', 4, 79.96);

-- @block
END;
