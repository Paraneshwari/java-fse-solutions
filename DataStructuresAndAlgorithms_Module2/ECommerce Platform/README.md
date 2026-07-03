# Exercise 2: E-commerce Platform Search Function

## Objective
Implement and compare **Linear Search** and **Binary Search** algorithms for searching products in an e-commerce platform.

## Big O Notation
Big O notation measures the efficiency of an algorithm by describing how its execution time grows as the input size increases.

## Time Complexity Analysis

### Linear Search
- **Best Case:** O(1)
- **Average Case:** O(n)
- **Worst Case:** O(n)

**Suitable for:**
- Small datasets
- Unsorted data
- Infrequent searches

### Binary Search
- **Best Case:** O(1)
- **Average Case:** O(log n)
- **Worst Case:** O(log n)

**Suitable for:**
- Large datasets
- Sorted data
- Frequent searches

## Comparison

| Algorithm | Best | Average | Worst |
|-----------|------|---------|-------|
| Linear Search | O(1) | O(n) | O(n) |
| Binary Search | O(1) | O(log n) | O(log n) |

## Conclusion

For an e-commerce platform with potentially millions of products, **Binary Search** is more suitable because:

1. Products can be maintained in sorted order (by name or ID).
2. It has a time complexity of **O(log n)**, making it significantly faster than Linear Search for large datasets.
3. Even with one million products, Binary Search requires only about **20 comparisons**.

However, **Linear Search** is preferred when:
- The data is unsorted and sorting is expensive.
- The dataset is small.
- Searches are performed infrequently.