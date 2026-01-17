CREATE OR REPLACE PROCEDURE get_water_quality_statistics (
    p_year_from IN NUMBER,
    p_year_to   IN NUMBER,
    p_result    OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_result FOR
        SELECT
            aquifer_name,
            EXTRACT(YEAR FROM sample_date) AS sample_year,
            AVG(ec)  AS avg_ec,
            MIN(ec)  AS min_ec,
            MAX(ec)  AS max_ec,
            AVG(ph)  AS avg_ph,
            MIN(ph)  AS min_ph,
            MAX(ph)  AS max_ph
        FROM water_samples
        WHERE EXTRACT(YEAR FROM sample_date)
              BETWEEN p_year_from AND p_year_to
        GROUP BY
            aquifer_name,
            EXTRACT(YEAR FROM sample_date)
        ORDER BY
            aquifer_name,
            sample_year;
END;
/
