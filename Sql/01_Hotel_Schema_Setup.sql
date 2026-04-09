CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
);

CREATE TABLE rooms (
    room_id INTEGER PRIMARY KEY,
    room_type TEXT,
    price_per_day INTEGER
);

CREATE TABLE bookings (
    booking_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    room_id INTEGER,
    booking_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE items (
    item_id INTEGER PRIMARY KEY,
    item_name TEXT,
    rate INTEGER
);

CREATE TABLE booking_commercials (
    commercial_id INTEGER PRIMARY KEY,
    booking_id INTEGER,
    item_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

INSERT INTO users VALUES (1, 'Hari', 'hari@mail.com');
INSERT INTO users VALUES (2, 'Sai', 'sai@mail.com');

INSERT INTO rooms VALUES (1, 'Single', 1000);
INSERT INTO rooms VALUES (2, 'Double', 2000);

INSERT INTO bookings VALUES (1, 1, 1, '2021-11-10');
INSERT INTO bookings VALUES (2, 2, 2, '2021-11-15');
INSERT INTO bookings VALUES (3, 1, 2, '2021-12-01');

INSERT INTO items VALUES (1, 'Food', 200);
INSERT INTO items VALUES (2, 'Laundry', 100);

INSERT INTO booking_commercials VALUES (1, 1, 1, 3);
INSERT INTO booking_commercials VALUES (2, 1, 2, 2);
INSERT INTO booking_commercials VALUES (3, 2, 1, 5);
INSERT INTO booking_commercials VALUES (4, 3, 2, 4);