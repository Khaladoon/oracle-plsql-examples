INSERT INTO pump (pump_id, pumped_id, pump_date, pump_hour, pump_minute, depth)
SELECT ...
FROM staging_pump_data s
WHERE NOT EXISTS (
  SELECT 1
  FROM pump p
  WHERE p.pumped_id = s.pumped_id
    AND p.pump_date = s.pump_date
    AND p.pump_hour = s.pump_hour
    AND p.pump_minute = s.pump_minute
);
