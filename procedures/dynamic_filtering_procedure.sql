/*
  Name: get_filtered_wells
  Purpose:
    Generic reusable procedure for dynamic filtering of well data
    using optional scientific parameters.

  Features:
    - Dynamic SQL construction
    - Optional filtering parameters
    - Oracle performance-friendly bind variables
    - Interface-agnostic result cursor

  Author: Khaldoon Nseir
*/


CREATE OR REPLACE PROCEDURE get_filtered_wells (
    p_date_from   IN DATE,
    p_date_to     IN DATE,
    p_ec_min      IN NUMBER DEFAULT NULL,
    p_ec_max      IN NUMBER DEFAULT NULL,
    p_ph_min      IN NUMBER DEFAULT NULL,
    p_ph_max      IN NUMBER DEFAULT NULL,
    p_result      OUT SYS_REFCURSOR
) IS
    v_sql   CLOB;
BEGIN
    v_sql := '
        SELECT DISTINCT
               g.wpn,
               c.samp_date,
               g.merkator_x,
               g.merkator_y,
               c.ec,
               c.ph
        FROM gsd g
        JOIN chmall c ON g.wpn = c.wpn
        WHERE c.samp_date BETWEEN :1 AND :2
    ';

    -- Optional filters
    IF p_ec_min IS NOT NULL THEN
        v_sql := v_sql || ' AND c.ec >= :3';
    END IF;

    IF p_ec_max IS NOT NULL THEN
        v_sql := v_sql || ' AND c.ec <= :4';
    END IF;

    IF p_ph_min IS NOT NULL THEN
        v_sql := v_sql || ' AND c.ph >= :5';
    END IF;

    IF p_ph_max IS NOT NULL THEN
        v_sql := v_sql || ' AND c.ph <= :6';
    END IF;

    OPEN p_result FOR v_sql
        USING p_date_from,
              p_date_to,
              p_ec_min,
              p_ec_max,
              p_ph_min,
              p_ph_max;

END get_filtered_wells;
/
