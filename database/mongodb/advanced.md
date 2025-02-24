Here are some **advanced MongoDB commands** and operations that go beyond the basics, covering **aggregation**, **indexing**, **transactions**, **text search**, **data modeling**, and **performance optimization**.

---

## 🔄 **1. Advanced Aggregation Framework**

- **$lookup (Join Collections):**
```js
db.orders.aggregate([
  {
    $lookup: {
      from: "products",
      localField: "product_id",
      foreignField: "_id",
      as: "product_details"
    }
  }
])
```
*Performs a left outer join between `orders` and `products` collections.*

---

- **$unwind (Deconstruct Arrays):**
```js
db.orders.aggregate([
  { $unwind: "$items" },
  { $group: { _id: "$_id", total: { $sum: "$items.price" } } }
])
```
*Flattens the `items` array in `orders` and calculates the total price.*

---

- **Pipeline with multiple stages:**
```js
db.sales.aggregate([
  { $match: { date: { $gte: new Date("2024-01-01") } } },
  { $group: { _id: "$region", totalSales: { $sum: "$amount" } } },
  { $sort: { totalSales: -1 } },
  { $limit: 5 }
])
```
*Finds the top 5 regions with the highest sales after a given date.*

---

## 🚀 **2. Indexing for Performance Optimization**

- **Create Compound Index:**
```js
db.users.createIndex({ city: 1, age: -1 })
```
*Creates an index on `city` (ascending) and `age` (descending) for efficient querying.*

---

- **Text Index for Full-Text Search:**
```js
db.articles.createIndex({ title: "text", content: "text" })
```
*Enables text search on the `title` and `content` fields.*

- **Perform Text Search:**
```js
db.articles.find({ $text: { $search: "MongoDB indexing" } })
```

---

- **Geospatial Index for Location-Based Queries:**
```js
db.places.createIndex({ location: "2dsphere" })
```
*Creates a geospatial index for querying by location.*

- **Query for nearby places:**
```js
db.places.find({
  location: {
    $near: {
      $geometry: { type: "Point", coordinates: [77.5946, 12.9716] },
      $maxDistance: 5000
    }
  }
})
```
*Finds places within 5km of the given coordinates.*

---

## 🔒 **3. Transactions (Multi-Document ACID Support)**

```js
const session = db.getMongo().startSession();
session.startTransaction();

try {
  session.getDatabase("shop").orders.insertOne(
    { orderId: 1, product: "Laptop", quantity: 1 }, { session }
  );
  session.getDatabase("shop").inventory.updateOne(
    { product: "Laptop" },
    { $inc: { stock: -1 } },
    { session }
  );
  session.commitTransaction();
} catch (error) {
  session.abortTransaction();
} finally {
  session.endSession();
}
```
*Ensures that both operations succeed or fail together (atomicity).*

---

## 🔎 **4. Data Validation & Schema Enforcement**

- **Create a Collection with Validation:**
```js
db.createCollection("employees", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name", "position", "salary"],
      properties: {
        name: { bsonType: "string" },
        position: { bsonType: "string" },
        salary: { bsonType: "double", minimum: 30000 }
      }
    }
  }
})
```
*Enforces schema validation for `employees` collection.*

---

## 🛠️ **5. Performance & Query Optimization**

- **Explain Query Performance:**
```js
db.users.find({ city: "London" }).explain("executionStats")
```
*Shows how MongoDB plans and executes a query.*

---

- **Hint to Force Index Usage:**
```js
db.users.find({ city: "London" }).hint({ city: 1 })
```
*Forces MongoDB to use a specific index.*

---

## 📦 **6. Aggregation with Faceted Search (Complex Reporting)**

```js
db.products.aggregate([
  {
    $facet: {
      prices: [ { $bucket: { groupBy: "$price", boundaries: [0, 50, 100, 200], default: "Other" } } ],
      categories: [ { $sortByCount: "$category" } ]
    }
  }
])
```
*Provides multi-faceted search results like price ranges and category distribution.*

---

## 🌐 **7. MapReduce for Complex Data Processing**

```js
db.orders.mapReduce(
  function() { emit(this.customerId, this.totalAmount); },
  function(key, values) { return Array.sum(values); },
  { out: "customer_totals" }
)
```
*Processes large data sets with map and reduce functions.*

---

## ⚡ **8. Change Streams (Real-time Data Changes)**

```js
const changeStream = db.orders.watch();
changeStream.on("change", (next) => {
  printjson(next);
});
```
*Watches the `orders` collection in real-time for any data changes.*

---

## ⏳ **9. Aggregation with Window Functions (Analytics)**

```js
db.sales.aggregate([
  { $setWindowFields: {
    partitionBy: "$region",
    sortBy: { date: 1 },
    output: {
      cumulativeSales: { $sum: "$amount", window: { documents: ["unbounded", "current"] } }
    }
  }}
])
```
*Calculates running totals for sales per region using window functions.*

---

## 📜 **10. Bulk Write Operations (Efficiency at Scale)**

```js
db.users.bulkWrite([
  { insertOne: { document: { name: "Tom", age: 29 } } },
  { updateOne: { filter: { name: "Alice" }, update: { $set: { age: 31 } } } },
  { deleteOne: { filter: { name: "Bob" } } }
])
```
*Performs multiple write operations in a single call for efficiency.*

---

## 🧪 **Bonus: Advanced Query Operators**

- **Array Element Match:**
```js
db.products.find({ features: { $elemMatch: { type: "wireless", version: "5.0" } } })
```
*Finds products with specific array elements matching conditions.*

- **Conditional Projection:**
```js
db.users.find({}, {
  name: 1,
  membershipLevel: {
    $cond: { if: { $gte: ["$purchases", 10] }, then: "Gold", else: "Silver" }
  }
})
```
*Adds a computed field `membershipLevel` based on conditions.*

---

### ⚡ **Pro Tips for Advanced MongoDB Usage:**
- Always **analyze query performance** using `.explain()`.
- Use **compound indexes** wisely to optimize read operations.
- Consider **schema design patterns** (like embedding or referencing) based on read/write patterns.
- Utilize **sharding** for horizontal scaling of large datasets.
- **Use transactions** carefully, as they can impact performance.

---

💡 **If you’re working with Node.js**, MongoDB’s official driver (`mongodb`) and ODM like **Mongoose** can help implement these features programmatically.

Would you like **Node.js code examples** for some of these advanced operations? 🚀