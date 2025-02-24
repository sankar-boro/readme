Here are some **beginner-level PostgreSQL commands** to get you started with basic database operations, including creating databases, tables, and performing CRUD operations.

---

## 🏗 **1. Connect to PostgreSQL**
```bash
psql -U username -d database_name
```
*Connects to a PostgreSQL database with the given username and database.*

---

## 📚 **2. Database Operations**  
- **List all databases:**
  ```sql
  \l
  ```
- **Create a new database:**
  ```sql
  CREATE DATABASE my_database;
  ```
- **Connect to a database:**
  ```sql
  \c my_database
  ```
- **Delete a database:**
  ```sql
  DROP DATABASE my_database;
  ```

---

## 📝 **3. Table Operations**  
- **Create a table:**
  ```sql
  CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
  );
  ```
- **List all tables:**
  ```sql
  \dt
  ```
- **Describe a table structure:**
  ```sql
  \d users
  ```
- **Drop a table:**
  ```sql
  DROP TABLE users;
  ```

---

## 🟩 **4. Insert Data into Tables**  
- **Insert a single row:**
  ```sql
  INSERT INTO users (name, age, city)
  VALUES ('Alice', 25, 'New York');
  ```
- **Insert multiple rows:**
  ```sql
  INSERT INTO users (name, age, city) VALUES
  ('Bob', 30, 'London'),
  ('Charlie', 28, 'Berlin');
  ```

---

## 🔍 **5. Retrieve Data (SELECT Queries)**  
- **Select all data from a table:**
  ```sql
  SELECT * FROM users;
  ```
- **Select specific columns:**
  ```sql
  SELECT name, city FROM users;
  ```
- **Filter data with WHERE:**
  ```sql
  SELECT * FROM users WHERE city = 'London';
  ```
- **Order results:**
  ```sql
  SELECT * FROM users ORDER BY age DESC;
  ```
- **Limit the number of results:**
  ```sql
  SELECT * FROM users LIMIT 2;
  ```

---

## 🛠 **6. Update Data**  
- **Update a single row:**
  ```sql
  UPDATE users
  SET age = 26
  WHERE name = 'Alice';
  ```
- **Update multiple rows:**
  ```sql
  UPDATE users
  SET city = 'Paris'
  WHERE city = 'London';
  ```

---

## ❌ **7. Delete Data**  
- **Delete a single row:**
  ```sql
  DELETE FROM users WHERE name = 'Charlie';
  ```
- **Delete all rows from a table:**
  ```sql
  DELETE FROM users;
  ```

---

## 🏷 **8. Constraints and Keys**  
- **Add a new column with a constraint:**
  ```sql
  ALTER TABLE users ADD COLUMN email VARCHAR(100) UNIQUE;
  ```
- **Add a foreign key to a table:**
  ```sql
  CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    amount DECIMAL(10, 2)
  );
  ```

---

## ⚡ **9. Basic Joins**  
- **INNER JOIN:**
  ```sql
  SELECT users.name, orders.amount
  FROM users
  INNER JOIN orders ON users.id = orders.user_id;
  ```
*Fetches users with their respective orders.*

---

## 🧮 **10. Basic Aggregate Functions**  
- **Count rows:**
  ```sql
  SELECT COUNT(*) FROM users;
  ```
- **Get average age:**
  ```sql
  SELECT AVG(age) FROM users;
  ```
- **Group data:**
  ```sql
  SELECT city, COUNT(*) FROM users GROUP BY city;
  ```

---

## 🏃 **11. Transactions**  
- **Basic transaction usage:**
  ```sql
  BEGIN;
  INSERT INTO users (name, age, city) VALUES ('David', 32, 'Rome');
  UPDATE users SET city = 'Milan' WHERE name = 'David';
  COMMIT;
  ```
*Use `ROLLBACK;` instead of `COMMIT;` to undo changes.*

---

## 🏃‍♂️ **12. Useful Meta-Commands in psql**
- **List all users (roles):**
  ```sql
  \du
  ```
- **Show current database connection info:**
  ```sql
  \conninfo
  ```

---

## 🌟 **13. Export and Import Data**  
- **Export a database:**
  ```bash
  pg_dump -U username -d my_database > my_database.sql
  ```
- **Import a database:**
  ```bash
  psql -U username -d my_database < my_database.sql
  ```

---

## 💡 **Bonus: Filtering with LIKE**
```sql
SELECT * FROM users WHERE name LIKE 'A%';  -- Names starting with A
SELECT * FROM users WHERE name LIKE '%e';  -- Names ending with e
SELECT * FROM users WHERE name LIKE '%ar%'; -- Names containing 'ar'
```

---

### ⚡ **Pro Tips for Beginners:**
- **Case Sensitivity:** PostgreSQL is case-sensitive for identifiers unless quoted (`"Name"` vs `name`).
- **Data Types:** Be mindful of using appropriate data types (`VARCHAR`, `TEXT`, `INTEGER`, `BOOLEAN`, etc.).
- **Primary Keys:** Always define a primary key for each table.

---

Let me know if you want **PostgreSQL commands for advanced topics** like indexing, views, stored procedures, or performance tuning! 🚀