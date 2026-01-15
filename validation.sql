-- The test_start_date is calculated from the smallest time in the imported data automatically via the import code.
-- validation.sql
-- Data validation rules for pumping test measurements

-- Invalid or inconsistent records
SELECT *
FROM staging_pump_data s
WHERE s.well_name IS NULL
   OR s.pump_date IS NULL
   OR s.pump_date > SYSDATE
   OR s.pump_hour NOT BETWEEN 0 AND 23
   OR s.pump_minute NOT BETWEEN 0 AND 59
   OR s.depth IS NULL;

-- Duplicate detection (same well + date + time)
SELECT s.*
FROM staging_pump_data s
JOIN pump p
  ON p.well_id     = s.well_id
 AND p.pump_date   = s.pump_date
 AND p.pump_hour   = s.pump_hour
 AND p.pump_minute = s.pump_minute;
-- import_logic.sql
-- Insert validated pumping measurements

INSERT INTO pump (
    pump_id,
    well_id,
    pump_date,
    pump_hour,
    pump_minute,
    depth
)
SELECT
    pump_seq.NEXTVAL,
    s.well_id,
    s.pump_date,
    s.pump_hour,
    s.pump_minute,
    s.depth
FROM staging_pump_data s
WHERE NOT EXISTS (
    SELECT 1
    FROM pump p
    WHERE p.well_id     = s.well_id
      AND p.pump_date   = s.pump_date
      AND p.pump_hour   = s.pump_hour
      AND p.pump_minute = s.pump_minute
);
