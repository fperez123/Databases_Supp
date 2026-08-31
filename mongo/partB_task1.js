/*
partB_task1.sql
Author: Fausto Perez Perez
Module: CMPU3010 Databases 2
Purpose: Completing the tasks described in Part B, Task 1 of assigment description
*/

//Creating a new database called retail_analytics and orders and items
use('retail_analytics');

db.customers.insertOne({
    customer_id: 1,
    name: "Alice Smith",
    email: "alice.smith@example.com",
    orders: [
      {
        order_id: 1001,
        order_date: new Date("2023-06-01"),
        items: [
          { product: "Laptop", category: "Electronics", quantity: 1, price: 999.99 },
          { product: "Mouse", category: "Electronics", quantity: 2, price: 15.50 }
        ]
      },
      {
        order_id: 1002,
        order_date: new Date("2023-07-15"),
        items: [
          { product: "Desk Lamp", category: "Home", quantity: 1, price: 25.00 }
        ]
      }
    ]
  });
  
db.customers.insertMany([
  {
    customer_id: 2,
    name: "Bob Johnson",
    email: "bob.johnson@example.com",
    orders: [
      {
        order_id: 2001,
        order_date: new Date("2023-06-20"),
        items: [
          { product: "Mouse", category: "Electronics", quantity: 1, price: 15.50 },
          { product: "Monitor", category: "Electronics", quantity: 1, price: 199.99 }
        ]
      }
    ]
  },
  {
    customer_id: 3,
    name: "Carol Williams",
    email: "carol.williams@example.com",
    orders: [
      {
        order_id: 3001,
        order_date: new Date("2023-07-02"),
        items: [
          { product: "Keyboard", category: "Electronics", quantity: 1, price: 49.99 },
          { product: "Desk Lamp", category: "Home", quantity: 2, price: 25.00 }
        ]
      }
    ]
  },
  {
    customer_id: 4,
    name: "David Brown",
    email: "david.brown@example.com",
    orders: [
      {
        order_id: 4001,
        order_date: new Date("2023-07-20"),
        items: [
          { product: "Laptop", category: "Electronics", quantity: 1, price: 999.99 },
          { product: "Keyboard", category: "Electronics", quantity: 1, price: 49.99 }
        ]
      }
    ]
  },
  {
    customer_id: 5,
    name: "Emma Davis",
    email: "emma.davis@example.com",
    orders: [
      {
        order_id: 5001,
        order_date: new Date("2023-08-05"),
        items: [
          { product: "Monitor", category: "Electronics", quantity: 2, price: 199.99 },
          { product: "Desk Lamp", category: "Home", quantity: 1, price: 25.00 }
        ]
      },
      {
        order_id: 5002,
        order_date: new Date("2023-08-18"),
        items: [
          { product: "Mouse", category: "Electronics", quantity: 3, price: 15.50 }
        ]
      }
    ]
  }
]);


//perfoming update using $push
db.customers.updateOne(
  { customer_id: 1 },
  { $push: {
      orders: {
        order_id: 1003,
        order_date: new Date("2023-08-01"),
        items: [
          { product: "Webcam", category: "Electronics", quantity: 1, price: 45.00 }
        ]
      }
  }}
);

//performing update using $set
db.customers.updateOne(
  { customer_id: 2 },
  { $set: { email: "bob.johnson.new@example.com" } }
);
