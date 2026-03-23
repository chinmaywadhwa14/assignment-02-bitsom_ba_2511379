## Anomaly Analysis

### Insert Anomaly
In the orders_flat dataset, it is not possible to add a new product unless it is associated with an order. For example, if a new product is available but no customer has ordered it yet, we cannot store its details. This creates an insert anomaly.

### Update Anomaly
If a product price or customer information needs to be updated, it must be changed in multiple rows. For example, if a product appears in many orders and its price changes, we must update it everywhere. Missing even one row leads to inconsistent data.

### Delete Anomaly
If an order is deleted, all related information such as customer details, product details, and sales representative data may also be lost. For example, deleting the only order of a customer removes all their information from the dataset.


## Normalization Justification

Storing all data in a single table leads to redundancy and anomalies. In the orders_flat dataset, customer, product, and sales representative details are repeated multiple times, which increases storage and causes inconsistencies.

By normalizing the data into separate tables such as customers, orders, products, order_items, and sales_reps, redundancy is reduced. Each entity is stored only once and linked using foreign keys.

This improves data integrity. Updates become easier because changes are made in one place. Deletions do not remove unrelated data, and new records can be added independently.

Although normalization increases the number of tables, it makes the database more organized, scalable, and reliable. Therefore, normalization is necessary for efficient database design.
