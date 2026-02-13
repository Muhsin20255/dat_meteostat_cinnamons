WITH route_stats AS (

    SELECT
        origin,
        dest,

        COUNT(*) AS total_flights,
        COUNT(DISTINCT tail_number) AS unique_airplanes,
        COUNT(DISTINCT airline) AS unique_airlines,

        AVG(actual_elapsed_time) AS avg_elapsed_time,
        AVG(arr_delay) AS avg_arrival_delay,
        MAX(arr_delay) AS max_arrival_delay,
        MIN(arr_delay) AS min_arrival_delay,

        SUM(cancelled) AS total_cancelled,
        SUM(diverted) AS total_diverted

    FROM {{ ref('prep_flights') }}

    GROUP BY origin, dest
)

SELECT
    rs.origin,
    o.city AS origin_city,
    o.country AS origin_country,
    o.name AS origin_name,

    rs.dest,
    d.city AS dest_city,
    d.country AS dest_country,
    d.name AS dest_name,

    rs.total_flights,
    rs.unique_airplanes,
    rs.unique_airlines,
    rs.avg_elapsed_time,
    rs.avg_arrival_delay,
    rs.max_arrival_delay,
    rs.min_arrival_delay,
    rs.total_cancelled,
    rs.total_diverted

FROM route_stats rs

LEFT JOIN {{ ref('prep_airports') }} o
    ON rs.origin = o.faa

LEFT JOIN {{ ref('prep_airports') }} d
    ON rs.dest = d.faa
