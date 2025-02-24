Here are some **beginner-level MongoDB commands** to help you get started:

---

### **1. Start MongoDB Shell**
```bash
mongosh
```
*Starts the MongoDB shell.*

---

### **2. Show Databases**
```js
show dbs
```
*Displays all available databases.*

---

### **3. Create or Switch Database**
```js
use myDatabase
```
*Creates a new database (if it doesn’t exist) or switches to it.*

---

### **4. Show Collections**
```js
show collections
```
*Lists all collections (like tables in SQL) in the current database.*

---

### **5. Create a Collection**
```js
db.createCollection("users")
```
*Creates a new collection named `users`.*

---

### **6. Insert Documents**  
- **Single document:**
  ```js
  db.users.insertOne({ name: "Alice", age: 25, city: "New York" })
  ```
- **Multiple documents:**
  ```js
  db.users.insertMany([
    { name: "Bob", age: 30, city: "London" },
    { name: "Charlie", age: 28, city: "Berlin" }
  ])
  ```

---

### **7. Find/Retrieve Documents**  
- **Find all documents:**
  ```js
  db.users.find()
  ```
- **Find with a filter:**
  ```js
  db.users.find({ city: "London" })
  ```
- **Pretty print results:**
  ```js
  db.users.find().pretty()
  ```

---

### **8. Update Documents**  
- **Update one document:**
  ```js
  db.users.updateOne(
    { name: "Alice" },
    { $set: { age: 26 } }
  )
  ```
- **Update multiple documents:**
  ```js
  db.users.updateMany(
    { city: "London" },
    { $set: { country: "UK" } }
  )
  ```

---

### **9. Delete Documents**  
- **Delete one document:**
  ```js
  db.users.deleteOne({ name: "Alice" })
  ```
- **Delete multiple documents:**
  ```js
  db.users.deleteMany({ city: "London" })
  ```

---

### **10. Drop a Collection**
```js
db.users.drop()
```
*Deletes the entire `users` collection.*

---

### **11. Drop a Database**
```js
db.dropDatabase()
```
*Deletes the current database.*

---

### **12. Count Documents in a Collection**
```js
db.users.countDocuments()
```
*Returns the number of documents in the collection.*

---

### **13. Sorting Results**
```js
db.users.find().sort({ age: 1 })  // 1 for ascending, -1 for descending
```

---

### **14. Limit and Skip Results**  
- **Limit:**  
  ```js
  db.users.find().limit(2)
  ```
- **Skip:**  
  ```js
  db.users.find().skip(2)
  ```

---

### **15. Indexing**
```js
db.users.createIndex({ name: 1 })
```
*Creates an ascending index on the `name` field.*

---

### **Bonus: Aggregation Example**
```js
db.users.aggregate([
  { $match: { city: "London" } },
  { $group: { _id: "$city", totalUsers: { $sum: 1 } } }
])
```
*Performs aggregation to count users per city.*

---

💡 *These commands cover basic CRUD operations, indexing, aggregation, and database management.*  

If you’re using **MongoDB with Node.js**, you can integrate these operations using the `mongodb` driver. Let me know if you’d like code snippets for that! 🚀