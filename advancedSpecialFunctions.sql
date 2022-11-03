-- Coalesce: Retorna el primer valor que no es nulo dentro de los parametros
SELECT id, COALESCE (first_name, 'No aplica'), last_name,
email, trip FROM passengers WHERE id = 1;

-- Nullif: Compara dos valores y retorna null si son iguales
SELECT NULLIF (0,0);

-- Greatest: Compara un arreglo y retorna el mayor
SELECT GREATEST (0, 3, 5, 2, 8, 4);

-- Least: Compara un arreglo y retorna el menor
SELECT LEAST (0, 3, 5, 2, 8, 4);

-- Bloques anónimos: Ingresar condicionales dentro de una consulta
SELECT *, CASE WHEN LENGTH(email) > 20

THEN 'Muy largo' 
ELSE email 
END

FROM passengers;
