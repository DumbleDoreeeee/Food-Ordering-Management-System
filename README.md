# Food-Ordering-Management-System
# 🍔 Food Ordering Management System

A database-driven project built as part of the DBMS curriculum to simulate a food ordering platform. This system supports restaurant listings, menu items, user orders, deliveries, reviews, and payment tracking.

---

## 📚 Table of Contents
- [About the Project](#about-the-project)
- [Team Members](#team-members)
- [Database Design](#database-design)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Normalization](#normalization)
- [SQL Tables & Queries](#sql-tables--queries)
- [Sample Data](#sample-data)
- [Learning Outcomes](#learning-outcomes)
- [Challenges Faced](#challenges-faced)
- [Conclusion](#conclusion)

---

## 📌 About the Project
The project builds a structured database for a food ordering system allowing:
- Users to browse menus, place orders, and leave reviews.
- Restaurants to list items and view feedback.
- Admins to monitor the system.
- The system to manage orders, delivery, and payments seamlessly.

---

## 👥 Team Members

| Roll No | Name                  | Contribution                     |
|--------:|-----------------------|----------------------------------|
| A003    | Abeer Chourey         | SQL Query Design                 |
| A006    | Allen Paul            | Database and Table Creation      |
| S018    | Anshuman Shrivastava | ER and Relational Model Design   |

---

## 🧱 Database Design

The database contains 10 core tables:
- **Users**
- **Restaurants**
- **Categories**
- **MenuItems**
- **Orders**
- **OrderDetails**
- **Delivery**
- **Payments**
- **Reviews**
- **Admins**

---

## 📊 Entity Relationship Diagram
> *Designed separately (refer to project report for visual representation)*

---

## 🧮 Normalization

The schema is normalized to 3NF:
- **1NF:** Atomic fields (e.g., separate fields for price, name, etc.)
- **2NF:** No partial dependencies using surrogate keys.
- **3NF:** No transitive dependencies; non-key attributes depend only on primary keys.

---

## 🧾 SQL Tables & Queries

Implemented using MySQL. Includes:
- **DML & DDL:** Table creation, insertion
- **SELECTs:** With filters, joins, aggregates
- **Advanced Queries:** Top items, earnings, user engagement

> **Example Queries:**
```sql
-- Top 3 most ordered items
SELECT M.name, COUNT(*) as total 
FROM OrderDetails OD 
JOIN MenuItems M ON OD.item_id = M.item_id 
GROUP BY M.name 
ORDER BY total DESC 
LIMIT 3;
