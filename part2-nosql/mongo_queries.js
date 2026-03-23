// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: 1,
    name: "iPhone 14",
    category: "Electronics",
    price: 80000,
    brand: "Apple",
    specs: {
      warranty: "1 year",
      voltage: "220V",
      battery: "3279mAh"
    }
  },
  {
    product_id: 2,
    name: "T-Shirt",
    category: "Clothing",
    price: 1500,
    brand: "Zara",
    sizes: ["S", "M", "L"],
    material: "Cotton",
    color: "Black"
  },
  {
    product_id: 3,
    name: "Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-30"),
    nutrition: {
      calories: 120,
      protein: "6g",
      fat: "3.5g"
    }
  }
]);

// OP2: find Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add discount_percent to product_id 1
db.products.updateOne(
  { product_id: 1 },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — index on category field
db.products.createIndex({ category: 1 });

// This index improves query performance when filtering products by category
