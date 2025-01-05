-- HACKERS TABLE -> HT
-- CHALLENGES TABLE -> CT

WITH ChallengeCounts AS (
    -- Hackers Table -> H
    -- Challenges Table -> C  
    SELECT H.hacker_id, H.name, COUNT(C.challenge_id) AS challenge_count
    FROM hackers AS H
    INNER JOIN Challenges AS C ON H.hacker_id = C.hacker_id
    GROUP BY H.hacker_id, H.name
)


SELECT  hacker_id,
        name,
        challenge_count
FROM ChallengeCounts

WHERE challenge_count = (SELECT MAX(challenge_count) FROM ChallengeCounts)
                        OR challenge_count IN (
                                            SELECT challenge_count
                                            FROM ChallengeCounts
                                            GROUP BY challenge_count
                                            HAVING COUNT(challenge_count) = 1)

ORDER BY challenge_count DESC, hacker_id