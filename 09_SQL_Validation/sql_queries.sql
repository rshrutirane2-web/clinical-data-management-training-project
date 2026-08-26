-- =====================================
-- Clinical Data Management SQL Validation
-- Project: HTN-CDM-001
-- =====================================

-- Q1: Find subjects older than 65 years
SELECT USUBJID, AGE
FROM DM
WHERE AGE > 65;

-- Q2: Find ongoing adverse events
SELECT USUBJID, AEID
FROM AE
WHERE AEOUT = 'Ongoing';

-- Q3: Find subjects without Week 12 vital signs
SELECT d.USUBJID
FROM DM d
LEFT JOIN VS v
  ON d.USUBJID = v.USUBJID
 AND v.VISIT = 'Week 12'
WHERE v.USUBJID IS NULL;

-- Q4: Count records in each SDTM domain
SELECT 'DM' AS DOMAIN, COUNT(*) AS RECORDS FROM DM
UNION ALL
SELECT 'VS', COUNT(*) FROM VS
UNION ALL
SELECT 'LB', COUNT(*) FROM LB
UNION ALL
SELECT 'AE', COUNT(*) FROM AE;
