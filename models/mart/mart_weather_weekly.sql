/* 5.4 Weekly Weather Statistics */

SELECT
    airport_code,
    DATE_TRUNC('week', date) AS weather_week,

    AVG(avg_temp_c) AS avg_weekly_temp,
    AVG(avg_wind_speed_kmh) AS avg_weekly_wind_speed,
    SUM(total_precipitation_mm) AS total_weekly_precipitation

FROM {{ ref('prep_weather_daily') }}

GROUP BY
    airport_code,
    DATE_TRUNC('week', date)
