-- HACKERS TABLE -> HT
-- SUBMISSION TABLE -> ST
-- MaxScoresPerChallenge -> MST

WITH MaxScoresPerChallenge AS (
    SELECT 
        hacker_id, 
        challenge_id, 
        MAX(score) AS max_score
    FROM submissions
    GROUP BY hacker_id, challenge_id)


SELECT  HT.hacker_id, 
        HT.name, 
        SUM(MST.max_score) AS total_score

FROM hackers AS HT 
    JOIN MaxScoresPerChallenge AS MST ON HT.hacker_id = MST.hacker_id

GROUP BY HT.hacker_id, HT.name

HAVING SUM(MST.max_score) <> 0

ORDER BY total_score DESC, hacker_id ASC