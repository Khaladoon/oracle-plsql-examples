-- Dynamic filtering for wells based on chemical, periodical, and GIS criteria

SELECT DISTINCT gg.WPN,
       ch.SAMP_DATE,
       gg.MERKATOR_X,
       gg.MERKATOR_Y,
       ch.EC,
       ch.PH,
       ch.MINERAL
FROM GSD gg
JOIN CHMALL ch ON gg.WPN = ch.WPN
WHERE ch.WPN IS NOT NULL
  AND ch.SAMP_DATE BETWEEN :FROM_DATE AND :TO_DATE
  AND ch.EC BETWEEN :EC_MIN AND :EC_MAX
  AND ch.PH BETWEEN :PH_MIN AND :PH_MAX;
