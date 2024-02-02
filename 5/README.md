# SQL Challenge

## a. Get data of updated last 24 hours on orders

```sql
SELECT DISTINCT * FROM orders WHERE updated_at > (NOW() - INTERVAL 24 HOUR);
```

## b. Get data of updated last 7 days on orders

```sql
SELECT DISTINCT * FROM orders WHERE updated_at > (NOW() - INTERVAL 7 DAY);
```

## c. Count only ‘order created’ on order, where company of buyer approval is accepted

```sql
SELECT DISTINCT O.status AS Status, COUNT(DISTINCT O.id) AS Total FROM orders AS O LEFT JOIN companies AS C ON O.buyer_company_id = C.id WHERE O.status = 'order created' AND C.approval = 'accepted' GROUP BY O.status;
```

## d. Count total current status on orders

```sql
SELECT DISTINCT status AS Status, COUNT(DISTINCT id) AS Total FROM orders GROUP BY status;
```

## e. Count pending product from accepted company

```sql
SELECT DISTINCT P.approval AS Status, COUNT(DISTINCT P.id) AS Total FROM products AS P LEFT JOIN companies AS C ON C.id = P.company_id LEFT JOIN orders AS O ON O.buyer_company_id = C.id  WHERE P.approval = 'pending' AND C.approval = 'accepted' GROUP BY P.approval;
```
