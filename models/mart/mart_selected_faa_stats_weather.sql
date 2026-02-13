
WITH airport_daily_stats AS (

    SELECT
        origin AS faa,
        flight_date,

        COUNT(*) AS total_flights,
        SUM(cancelled) AS total_cancelled,
        AVG(arr_delay) AS avg_arrival_delay

    FROM {{ ref('prep_flights') }}

    GROUP BY origin, flight_date
)

SELECT
    ads.faa,
    ap.city,
    ap.country,
    ap.name,

    ads.flight_date,
    ads.total_flights,
    ads.total_cancelled,
    ads.avg_arrival_delay,

    w.avg_temp,
    w.avg_wind_speed,
    w.total_precipitation

FROM airport_daily_stats ads

LEFT JOIN {{ ref('prep_airports') }} ap
    ON ads.faa = ap.faa

LEFT JOIN {{ ref('prep_weather_daily') }} w
    ON ads.faa = w.airport_code
    AND ads.flight_date = w.weather_date
