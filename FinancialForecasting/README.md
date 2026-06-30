# Exercise 7: Financial Forecasting

## Objective
Develop a financial forecasting tool that predicts future values using a recursive algorithm.

## What is Recursion?

Recursion is a programming technique where a method calls itself to solve a problem. It simplifies problems that can be broken down into smaller, similar subproblems.

A recursive algorithm consists of:
- Base Case: Stops the recursion.
- Recursive Case: Calls itself with a smaller problem.

## Algorithm

Future Value = Current Value × (1 + Growth Rate)

The recursive function repeatedly applies the growth rate until the specified number of years reaches zero.

## Time Complexity

- **Time Complexity:** O(n)
- **Space Complexity:** O(n)

where **n** is the number of years.

## Optimization

The recursive solution creates one function call for each year, increasing stack usage.

Possible optimizations include:
- Using an iterative approach with a loop to reduce space complexity to **O(1)**.
- Using Dynamic Programming (Memoization) when recursive calls overlap.
- Using the mathematical formula:

Future Value = Present Value × (1 + Growth Rate)^Years

This computes the result directly without recursion and is more efficient for this problem.