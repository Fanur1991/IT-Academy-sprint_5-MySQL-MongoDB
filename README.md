# MySQL Data Structures

Development of database structures addressing concepts and practices related to MySQL for designing and managing relational databases.

##### Work from Sprint 5.1 at IT-Academy specializing in Node.js.

## Level 1 - Optica

The repository models the management of an optical store. Here are the key points summarized:

| **Entities** | **Highlighted Attributes**                                                                                                       |
| -------------| -------------------------------------------------------------------------------------------------------------------------------- |
| Suppliers    | Name, address, phone, fax, NIF.                                                                                                  |
| Glasses      | Bbrand, supplier, graduation, frame type, frame color, lens color and price.                                                     |
| Customers    | Name, address id, phone, email, registration date, referred by other customers.                                                  |
| Sales        | Employee id, customer id, glasses id and sale date.                                                                              |

### Optica Verification Queries:

1. List the total purchases of a customer.
2. List the different glasses sold by an employee over a year.
3. List the different suppliers who have successfully supplied glasses for the optical store.

## Level 1 - Pizzeria

This level focuses on designing a website for ordering from a pizzeria. Highlighted points:

| **Entities**        | **Highlighted Attributes**                                                   |
| --------------------| ---------------------------------------------------------------------------- |
| Customers           | Name, address, postal code, phone.                                           |
| Orders              | Date/time, type of delivery, quantity and types of products, total price.    |
| Products            | Pizzas, burgers and drinks.                                                  |
| Pizza Categories    | Unique identifier and name.                                                  |
| Employees           | Name, surnames, NIF, phone, role (cashier or delivery person).               |

### Pizzeria Verification Queries:

1. List how many "Beverages" type products have been sold in a particular locality.
2. List how many orders a particular employee has made.

## Level 2 - YouTube

This level represents a simplified version of YouTube with the following features:

| **Entities**          | **Highlighted Attributes**                                                                  |
| ----------------------| --------------------------------------------------------------------------------------------|
| Users                 | Email, password, username, date of birth, gender, country, postal code.                     |
| Videos                | Title, description, size, video file name, duration, thumbnail, views, likes, dislikes.     |
| Channels              | Name, description, creation date.                                                           |
| Playlists             | Name, creation date, status (public or private).                                            |

## Level 3 - Spotify

This level represents the database needed for Spotify with free and premium users:

| **Entities**             | **Highlighted Attributes**                                                              |
| ------------------------ | --------------------------------------------------------------------------------------- |
| Users                    | Email, password, username, date of birth, gender, country, postal code.                 |
| Premium Subscriptions    | Start date, renewal date, payment method.                                               |
| Credit Cards             | Number, expiration month and year, security code.                                       |
| Playlists                | Title, number of songs, creation date, status (active or deleted).                      |
| Songs                    | Title, duration, plays.                                                                 |
| Albums and Artists       | Unique identifiers, names, images.                                                      |
| Followings and Favorites | Followings of artists, albums, and songs.                                               |

## License

This project is distributed under the Apache 2.0 license.

---

Developed by [Fanur Khusainov](https://www.linkedin.com/in/fanur-khusainov-ab86b2102/) with ❤️ and ☕.
