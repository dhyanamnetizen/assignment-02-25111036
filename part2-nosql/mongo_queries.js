// Q1: Find all orders with a status of "shipped"
db.orders.find({ "status": "shipped" });

// Q2: Calculate the total revenue from all orders (sum of total_amount)
db.orders.aggregate([
  { 
    $group: { 
      _id: null, 
      totalRevenue: { $sum: "$total_amount" } 
    } 
  }
]);

// Q3: Find all orders for a specific customer (e.g., CUST001)
db.orders.find({ "customer_id": "CUST001" });

// Q4: List orders where total_amount is greater than 5000
db.orders.find({ "total_amount": { $gt: 5000 } });

// Q5: Update the status of a specific order (e.g., ORD2001) to "delivered"
db.orders.updateOne(
  { "order_id": "ORD2001" },
  { $set: { "status": "delivered" } }
);
