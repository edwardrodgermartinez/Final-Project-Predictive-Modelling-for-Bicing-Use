Use bicing_final;
WITH RankedBikes AS (
  SELECT
    dateTime,
    bikesInUsage,
    PERCENT_RANK() OVER (ORDER BY bikesInUsage DESC) AS UsageRank
  FROM
    bicing_visualisation
  ORDER BY
    bikesInUsage DESC
  LIMIT 1000
)

SELECT
  DATE_FORMAT(dateTime, '%H:00') AS time_group,
  ROUND(COUNT(*) / 10.0, 1) AS proportion-- Divide by 10 to get percentage (assuming 10% increments)
FROM
  RankedBikes
GROUP BY
  time_group
ORDER BY
  proportion DESC;
  
  
WITH RankedBikes AS (
  SELECT
    dateTime,
    bikesInUsage,
    PERCENT_RANK() OVER (ORDER BY bikesInUsage DESC) AS UsageRank
  FROM
    bicing_visualisation
  ORDER BY
    bikesInUsage DESC
  LIMIT 1000
)

SELECT
  bikesInUsage,
  DATE_FORMAT(dateTime, '%H:00') AS time_group
FROM
  RankedBikes
ORDER BY
  bikesInUsage DESC;
  
  