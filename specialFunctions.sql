-- Conflictos
INSERT INTO station(id, station_name, station_address) 
VALUES (1, 'station_101', 'address_101') ON CONFLICT DO NOTING;

INSERT INTO station(id, station_name, station_address) 
VALUES (1, 'station_101', 'address_101') ON CONFLICT (id) DO UPDATE SET
station_name='station_1', station_address='address_1';

-- LIKE
SELECT first_name FROM passengers WHERE first_name 
LIKE 'Her%';

-- IS / IS NOT
SELECT * FROM trains WHERE model IS NULL;

-- RETURN 
INSERT INTO stations (station_name, station_address)
VALUES ('RETURNED_STATION', 'RETURNED_ADDRESS') RETURNING *;