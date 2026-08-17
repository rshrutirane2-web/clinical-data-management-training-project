-- CDM SQL Practice — HTN-CDM-001
-- Table names: Subjects, Vitals, Labs, Adverse_Events

-- 1. Count subjects by treatment
SELECT Treatment, COUNT(*) AS Subject_Count
FROM Subjects
GROUP BY Treatment;

-- 2. Identify subjects above protocol age limit
SELECT SubjectID, Age
FROM Subjects
WHERE Age > 65;

-- 3. Find ongoing adverse events
SELECT SubjectID, AEID, Term, Outcome
FROM Adverse_Events
WHERE Outcome = 'Ongoing';

-- 4. Find subjects without Week 12 vitals
SELECT s.SubjectID
FROM Subjects s
LEFT JOIN Vitals v
  ON s.SubjectID = v.SubjectID
 AND v.Visit = 'Week 12'
WHERE v.SubjectID IS NULL;

-- 5. Find randomization before consent
SELECT SubjectID, ConsentDate, RandomizationDate
FROM Subjects
WHERE RandomizationDate < ConsentDate;

-- 6. Calculate baseline-to-Week-12 SBP change
SELECT b.SubjectID,
       b.SBP_mmHg AS Baseline_SBP,
       w.SBP_mmHg AS Week12_SBP,
       b.SBP_mmHg - w.SBP_mmHg AS SBP_Reduction
FROM Vitals b
JOIN Vitals w ON b.SubjectID = w.SubjectID
WHERE b.Visit = 'Baseline' AND w.Visit = 'Week 12';
