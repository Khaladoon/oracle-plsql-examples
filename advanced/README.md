# Water Quality Statistics (Oracle PL/SQL)

## Overview
This example demonstrates an advanced Oracle PL/SQL procedure
designed to compute **aggregated water quality indicators**.

The procedure is suitable for hydrological and environmental
information systems dealing with large datasets.

---

## Procedure
**Name:** `get_water_quality_statistics`

### Input Parameters
| Parameter | Description |
|--------|------------|
| p_year_from | Start year |
| p_year_to | End year |

### Output
- `SYS_REFCURSOR` containing aggregated statistics

---

## Metrics Calculated
- EC: AVG, MIN, MAX
- PH: AVG, MIN, MAX

Grouped by:
- Aquifer
- Year

---

## Why This Example Is Important
- Demonstrates analytical thinking
- Uses SQL aggregation correctly
- Clean separation between data logic and presentation
- Suitable for enterprise-scale databases

---

## Example Call

```sql
VAR rc REFCURSOR;

BEGIN
  get_water_quality_statistics(2015, 2023, :rc);
END;
/
