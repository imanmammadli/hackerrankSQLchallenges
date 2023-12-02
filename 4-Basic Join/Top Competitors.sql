-- HACKERS TABLE -> HT
-- DIFFICULTY TABLE -> DT
-- CHALLENGES TABLE -> CT
-- SUBMISSIONS TABLE -> ST

SELECT HT.hacker_id, HT.name 
FROM
    Submissions AS ST
JOIN
    Challenges AS CT 
    ON ST.challenge_id = CT.challenge_id
JOIN
    Difficulty AS DT
    ON CT.difficulty_level = DT.difficulty_level
    AND ST.score = DT.score
JOIN
    Hackers as HT
    ON HT.hacker_id = ST.hacker_id
GROUP BY HT.hacker_id, HT.name
HAVING COUNT(HT.name) > 1
ORDER BY COUNT(HT.name) DESC, hacker_id;