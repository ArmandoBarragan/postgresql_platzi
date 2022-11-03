-- Se toma una consulta que se repite mucho y se le da un nombre.


-- Vista volatil: Cuando se hace la consulta, 
--      la base de datos hace la consulta.
CREATE OR REPLACE VIEW email_view AS
SELECT *, CASE WHEN LENGTH(email) > 20

THEN 'Muy largo' 
ELSE email 
END
AS largo
FROM passengers;

-- Vista materializada: La consulta solo se hace una vez y 
--      no se actualiza.
CREATE MATERIALIZED VIEW trip_date_views AS
SELECT * FROM trips WHERE trip_date > '2021-08-23';