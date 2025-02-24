Here are some **basic Redis commands** categorized by functionality:

---

### 🔗 **Connection & Server Info**  
- `PING` – Check if the server is running.  
  ```shell
  PING
  # Response: PONG
  ```
- `AUTH <password>` – Authenticate to the server.  
- `SELECT <db_index>` – Select a specific database (default is 0).  
- `FLUSHDB` – Delete all keys in the selected database.  
- `FLUSHALL` – Delete all keys in all databases.  
- `INFO` – Get server information and stats.  
- `DBSIZE` – Get the number of keys in the selected database.  

---

### 🗝️ **Key Operations**  
- `SET <key> <value>` – Set the value of a key.  
  ```shell
  SET mykey "Hello"
  ```
- `GET <key>` – Get the value of a key.  
- `DEL <key>` – Delete a key.  
- `EXISTS <key>` – Check if a key exists.  
- `EXPIRE <key> <seconds>` – Set a timeout on a key.  
- `TTL <key>` – Get the remaining time to live of a key.  
- `KEYS <pattern>` – Find all keys matching a pattern.  
  ```shell
  KEYS user:*
  ```

---

### 📝 **String Commands**  
- `APPEND <key> <value>` – Append data to a string.  
- `INCR <key>` – Increment a number value by 1.  
- `DECR <key>` – Decrement a number value by 1.  
- `MGET <key1> <key2> ...` – Get the values of multiple keys.  

---

### 📚 **List Commands**  
- `LPUSH <key> <value>` – Push a value onto the head of a list.  
- `RPUSH <key> <value>` – Push a value onto the tail of a list.  
- `LPOP <key>` – Remove and get the first element in a list.  
- `RPOP <key>` – Remove and get the last element in a list.  
- `LRANGE <key> <start> <end>` – Get a range of elements from a list.  

---

### 🔢 **Set Commands**  
- `SADD <key> <member>` – Add one or more members to a set.  
- `SMEMBERS <key>` – Get all members of a set.  
- `SISMEMBER <key> <member>` – Check if a value is a member of a set.  
- `SREM <key> <member>` – Remove a member from a set.  

---

### 🧩 **Hash Commands**  
- `HSET <key> <field> <value>` – Set the value of a field in a hash.  
- `HGET <key> <field>` – Get the value of a field in a hash.  
- `HGETALL <key>` – Get all fields and values in a hash.  
- `HDEL <key> <field>` – Delete one or more hash fields.  

---

### 🔢 **Sorted Set Commands**  
- `ZADD <key> <score> <member>` – Add a member with a score to a sorted set.  
- `ZRANGE <key> <start> <stop> [WITHSCORES]` – Get a range of members by index.  
- `ZREM <key> <member>` – Remove a member from a sorted set.  

---

### ⚡ **Pub/Sub Commands**  
- `PUBLISH <channel> <message>` – Publish a message to a channel.  
- `SUBSCRIBE <channel>` – Subscribe to a channel.  

---

### 🏃 **Transactions & Scripting**  
- `MULTI` – Start a transaction block.  
- `EXEC` – Execute all commands issued after MULTI.  
- `DISCARD` – Discard all commands issued after MULTI.  
- `EVAL <script> <numkeys> <key> ...` – Execute a Lua script.  

---

### 🔄 **Persistence & Replication**  
- `SAVE` – Synchronously save the dataset to disk.  
- `BGSAVE` – Asynchronously save the dataset to disk.  
- `SLAVEOF <host> <port>` – Make the server a replica of another instance.  

---

### 🏷️ **Example Usage** (Node.js with `ioredis`)  
```javascript
const Redis = require('ioredis');
const redis = new Redis();

(async () => {
  await redis.set('user:1', JSON.stringify({ name: 'Alice', age: 30 }));
  const user = await redis.get('user:1');
  console.log(JSON.parse(user)); // { name: 'Alice', age: 30 }

  await redis.del('user:1');
})();
```

---

Let me know if you want details on more advanced topics like **pipelining**, **streams**, or **RedisJSON**! 🚀