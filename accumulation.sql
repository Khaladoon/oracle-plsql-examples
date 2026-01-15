UPDATE pump p
SET p.accumulated_minutes =
    ( (TRUNC(p.pump_date) - TRUNC(t.test_start_date)) * 24 * 60 )
  + (p.pump_hour * 60)
  +  p.pump_minute
FROM pumping_test t
WHERE p.test_id = t.test_id;
