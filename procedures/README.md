# Dynamic Filtering Procedure (Oracle PL/SQL)

## Overview
This procedure demonstrates a **generic, reusable Oracle PL/SQL solution**
for dynamically filtering records based on optional parameters.

It is designed to support complex business logic while maintaining:
- Performance
- Readability
- Reusability

The procedure returns its result via a `SYS_REFCURSOR`,
making it suitable for integration with any application layer.

---

## Procedure
**Name:** `get_filtered_wells`

### Input Parameters
| Parameter | Type | Description |
|--------|------|------------|
| p_date_from | DATE | Start date filter |
| p_date_to | DATE | End date filter |
| p_ec_min | NUMBER | Minimum EC value (optional) |
| p_ec_max | NUMBER | Maximum EC value (optional) |
| p_ph_min | NUMBER | Minimum PH value (optional) |
| p_ph_max | NUMBER | Maximum PH value (optional) |

### Output
- `SYS_REFCURSOR` containing the filtered result set

---

## Key Features
- Dynamic SQL construction
- Optional filtering parameters
- Oracle bind variables for performance and security
- Interface-agnostic design

---

## Example Usage

```sql
VAR rc REFCURSOR;

BEGIN
  get_filtered_wells(
    DATE '2020-01-01',
    DATE '2023-12-31',
    500,
    3000,
    6.5,
    8.5,
    :rc
  );
END;
/
