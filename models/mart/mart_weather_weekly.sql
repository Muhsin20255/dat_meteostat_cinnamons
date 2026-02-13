/* 5.4 Weekly Weather Statistics */

SELECT
    airport_code,

    DATE_TRUNC('week', weather_date) AS weather_week,

    AVG(avg_temp) AS avg_weekly_temp,
    AVG(avg_wind_speed) AS avg_weekly_wind_speed,
    SUM(total_precipitation) AS total_weekly_precipitation

FROM {{ ref('prep_weather_daily') }}

GROUP BY
    airport_code,
    DATE_TRUNC('week', weather_date)
