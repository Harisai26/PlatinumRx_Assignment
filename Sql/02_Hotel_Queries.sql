-- Q1: Last booked room
SELECT *
FROM bookings
ORDER BY booking_date DESC
LIMIT 1;

-- Q2: Billing in Nov 2021
SELECT bookings.booking_id, SUM(booking_commercials.quantity * items.rate) AS total_bill
FROM bookings
JOIN booking_commercials ON bookings.booking_id = booking_commercials.booking_id
JOIN items ON booking_commercials.item_id = items.item_id
WHERE booking_date BETWEEN '2021-11-01' AND '2021-11-30'
GROUP BY bookings.booking_id;

-- Q3: Bills > 1000
SELECT booking_commercials.booking_id, SUM(quantity * rate) AS total_bill
FROM booking_commercials
JOIN items ON booking_commercials.item_id = items.item_id
GROUP BY booking_commercials.booking_id
HAVING SUM(quantity * rate) > 1000;

-- Q4: Most ordered item
SELECT items.item_name, SUM(quantity) AS total_quantity
FROM booking_commercials
JOIN items ON booking_commercials.item_id = items.item_id
GROUP BY items.item_name
ORDER BY total_quantity DESC
LIMIT 1;

-- Q5: 2nd highest bill
SELECT booking_id, total_bill
FROM (
    SELECT booking_commercials.booking_id,
           SUM(quantity * rate) AS total_bill
    FROM booking_commercials
    JOIN items ON booking_commercials.item_id = items.item_id
    GROUP BY booking_commercials.booking_id
    ORDER BY total_bill DESC
    LIMIT 2
)
ORDER BY total_bill ASC
LIMIT 1;