Here are some **advanced PostgreSQL commands** and features for complex querying, performance optimization, indexing, window functions, CTEs, and more. These will help you take your PostgreSQL skills to the next level. 🚀

---

## 🏗 **1. Advanced Joins**  
- **LEFT JOIN (Return all from the left table):**
  ```sql
  SELECT u.name, o.amount
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id;
  ```

- **FULL OUTER JOIN (All records from both tables):**
  ```sql
  SELECT u.name, o.amount
  FROM users u
  FULL OUTER JOIN orders o ON u.id = o.user_id;
  ```

- **CROSS JOIN (Cartesian product):**
  ```sql
  SELECT u.name, p.product_name
  FROM users u
  CROSS JOIN products p;
  ```

---

## 📜 **2. Common Table Expressions (CTEs)**  
CTEs simplify complex queries and allow recursion.

- **Basic CTE:**
  ```sql
  WITH user_orders AS (
    SELECT user_id, COUNT(*) AS total_orders
    FROM orders
    GROUP BY user_id
  )
  SELECT u.name, uo.total_orders
  FROM users u
  JOIN user_orders uo ON u.id = uo.user_id;
  ```

- **Recursive CTE (e.g., hierarchy or tree structure):**
  ```sql
  WITH RECURSIVE subordinates AS (
    SELECT id, name, manager_id
    FROM employees
    WHERE id = 1
    UNION
    SELECT e.id, e.name, e.manager_id
    FROM employees e
    INNER JOIN subordinates s ON s.id = e.manager_id
  )
  SELECT * FROM subordinates;
  ```

---

## 🪟 **3. Window Functions (Analytics Over Partitions)**  
Window functions perform calculations across a set of rows related to the current row.

- **ROW_NUMBER, RANK, DENSE_RANK:**
  ```sql
  SELECT name, city, age,
         ROW_NUMBER() OVER (PARTITION BY city ORDER BY age DESC) AS row_num,
         RANK() OVER (PARTITION BY city ORDER BY age DESC) AS rank,
         DENSE_RANK() OVER (PARTITION BY city ORDER BY age DESC) AS dense_rank
  FROM users;
  ```

- **Cumulative Sum:**
  ```sql
  SELECT user_id, order_date, amount,
         SUM(amount) OVER (PARTITION BY user_id ORDER BY order_date) AS running_total
  FROM orders;
  ```

---

## ⚡ **4. Indexing for Performance Optimization**  
Indexes improve query performance.

- **Create a unique index:**
  ```sql
  CREATE UNIQUE INDEX idx_email_unique ON users (email);
  ```

- **Partial Index:**
  ```sql
  CREATE INDEX idx_active_users ON users (city) WHERE active = true;
  ```

- **GIN Index for JSONB Data:**
  ```sql
  CREATE INDEX idx_jsonb_data ON products USING GIN (attributes);
  ```

- **Check index usage with EXPLAIN:**
  ```sql
  EXPLAIN ANALYZE SELECT * FROM users WHERE city = 'New York';
  ```

---

## 🌐 **5. JSON and JSONB Operations**  
PostgreSQL has robust support for JSON data.

- **Insert JSON data:**
  ```sql
  INSERT INTO products (name, attributes) 
  VALUES ('Smartphone', '{"brand": "Samsung", "specs": {"ram": "8GB", "storage": "128GB"}}');
  ```

- **Query JSON data:**
  ```sql
  SELECT name, attributes->'specs'->>'ram' AS ram
  FROM products
  WHERE attributes->>'brand' = 'Samsung';
  ```

- **Indexing JSONB:**
  ```sql
  CREATE INDEX idx_jsonb_specs ON products USING GIN ((attributes->'specs'));
  ```

---

## 🔒 **6. Transaction Management (ACID Compliance)**  
Ensure atomic operations.

- **Savepoints within a transaction:**
  ```sql
  BEGIN;
  INSERT INTO users (name) VALUES ('Alice');
  SAVEPOINT savepoint1;
  INSERT INTO orders (user_id, amount) VALUES (1, 100);
  ROLLBACK TO savepoint1;  -- Undo last insert only
  COMMIT;
  ```

- **SERIALIZABLE isolation level:**
  ```sql
  BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  SELECT * FROM users;
  COMMIT;
  ```

---

## 📈 **7. Performance Tuning**  
- **Analyze query plans:**
  ```sql
  EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM orders WHERE amount > 500;
  ```

- **Vacuum to reclaim storage:**
  ```sql
  VACUUM FULL;
  ```

- **Analyze for statistics update:**
  ```sql
  ANALYZE;
  ```

---

## 📦 **8. Views and Materialized Views**  
- **Create a view:**
  ```sql
  CREATE VIEW user_summary AS
  SELECT u.name, COUNT(o.id) AS order_count
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id
  GROUP BY u.name;
  ```

- **Materialized view (with refresh):**
  ```sql
  CREATE MATERIALIZED VIEW sales_summary AS
  SELECT user_id, SUM(amount) AS total_sales
  FROM orders
  GROUP BY user_id;

  REFRESH MATERIALIZED VIEW sales_summary;
  ```

---

## 🏃 **9. Triggers & Functions (PL/pgSQL)**  
- **Create a function:**
  ```sql
  CREATE FUNCTION update_timestamp()
  RETURNS TRIGGER AS $$
  BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
  END;
  $$ LANGUAGE plpgsql;
  ```

- **Create a trigger:**
  ```sql
  CREATE TRIGGER set_timestamp
  BEFORE UPDATE ON users
  FOR EACH ROW
  EXECUTE FUNCTION update_timestamp();
  ```

---

## 🏹 **10. Full-Text Search**  
- **Setup full-text search:**
  ```sql
  ALTER TABLE articles ADD COLUMN tsv tsvector;
  UPDATE articles SET tsv = to_tsvector('english', title || ' ' || body);

  CREATE INDEX idx_fts ON articles USING GIN(tsv);
  ```

- **Perform search:**
  ```sql
  SELECT * FROM articles
  WHERE tsv @@ to_tsquery('PostgreSQL & indexing');
  ```

---

## 🧪 **11. Advanced Subqueries**  
- **Correlated Subquery:**
  ```sql
  SELECT name, (SELECT COUNT(*) FROM orders o WHERE o.user_id = u.id) AS order_count
  FROM users u;
  ```

- **Subquery in FROM clause:**
  ```sql
  SELECT city, AVG(age) FROM (
    SELECT city, age FROM users WHERE active = true
  ) AS active_users
  GROUP BY city;
  ```

---

## 🏷 **12. Role & Permission Management**  
- **Create a new role and grant privileges:**
  ```sql
  CREATE ROLE readonly LOGIN PASSWORD 'readonly123';
  GRANT CONNECT ON DATABASE my_database TO readonly;
  GRANT USAGE ON SCHEMA public TO readonly;
  GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly;
  ```

---

## 🧱 **13. Partitioning Large Tables**  
- **Range Partitioning:**
  ```sql
  CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2)
  ) PARTITION BY RANGE (order_date);

  CREATE TABLE orders_2024 PARTITION OF orders
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
  ```

---

## ⚡ **14. Lateral Joins**  
- **LATERAL allows subqueries that reference columns from preceding FROM items:**
  ```sql
  SELECT u.name, o.amount
  FROM users u
  LEFT JOIN LATERAL (
    SELECT amount FROM orders o WHERE o.user_id = u.id ORDER BY amount DESC LIMIT 1
  ) o ON true;
  ```

---

### 💎 **Pro Tips for Advanced PostgreSQL Usage:**
- Use **`EXPLAIN ANALYZE`** regularly for performance tuning.  
- Apply **indexes** carefully; too many can slow down writes.  
- **Normalize** for consistency, **denormalize** for performance in analytics.  
- **VACUUM** and **ANALYZE** periodically to keep performance optimal.  
- Always use **transaction blocks** for batch operations.  

---

Let me know if you’d like **advanced PostgreSQL scripts in Node.js** or tips on **PostGIS**, **logical replication**, or **high availability setups**. 🚀✨