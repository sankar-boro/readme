Here's a Big-O complexity chart tailored for your full-stack and systems-level expertise, including quick reminders on typical cases and real-world relevance:

---

### 🧠 **Big-O Complexity Cheat Sheet**

| Big-O Notation | Name              | Example Use Cases                                      | Notes                                             |
| -------------- | ----------------- | ------------------------------------------------------ | ------------------------------------------------- |
| **O(1)**       | Constant Time     | Accessing an array element `arr[i]`<br>HashMap lookup  | Super efficient. Rust's `HashMap`, JS `Map.get()` |
| **O(log n)**   | Logarithmic Time  | Binary search<br>TreeSet insert/search                 | Balanced BSTs (`BTreeMap` in Rust)                |
| **O(n)**       | Linear Time       | Iterating over array/list                              | Common in filtering, mapping                      |
| **O(n log n)** | Linearithmic Time | Merge sort, Quick sort (avg)<br>Sorting with `.sort()` | Most sorting libs use this                        |
| **O(n²)**      | Quadratic Time    | Nested loops over same data<br>Brute-force search      | Watch for this in nested UI logic                 |
| **O(2ⁿ)**      | Exponential Time  | Recursive Fibonacci, DFS in graphs                     | Avoid unless small `n` or memoized                |
| **O(n!)**      | Factorial Time    | Permutations, Traveling Salesman Problem               | Only for _very_ small `n`                         |

---
