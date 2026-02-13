/* 5.5 Custom Mart – Busiest Routes */

SELECT
    origin,
    dest,
    COUNT(*) AS total_flights
FROM {{ ref('prep_flights') }}
GROUP BY origin, dest
ORDER BY total_flights DESC
