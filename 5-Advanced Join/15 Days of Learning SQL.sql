-- Source : https://medium.com/geekculture/15-days-of-learning-sql-hackerrank-a40ab17ae462

WITH    MaxSubEachDay AS (
            SELECT  submission_date,
                    hacker_id,
                    RANK() OVER(PARTITION BY submission_date ORDER BY SubCount DESC, hacker_id) AS Rn
            FROM
                    (SELECT submission_date, hacker_id, COUNT(1) AS SubCount 
                    FROM submissions
                    GROUP BY submission_date, hacker_id) AS subQuery), 
        --================================================================================================
        DayWiseRank AS (
            SELECT  submission_date,
                    hacker_id,
                    DENSE_RANK() OVER(ORDER BY submission_date) AS dayRn
            FROM submissions), 
        --================================================================================================         
        HackerCntTillDate AS (
            SELECT  outtr.submission_date,
                    outtr.hacker_id,
                    CASE 
                        WHEN outtr.submission_date='2016-03-01' THEN 1
                        ELSE 
                                1 + (SELECT COUNT(DISTINCT a.submission_date)
                                    FROM submissions AS a 
                                    WHERE   a.hacker_id = outtr.hacker_id AND                     
                                            a.submission_date<outtr.submission_date)
                    END AS PrevCnt, outtr.dayRn
            FROM DayWiseRank AS outtr), 
        --================================================================================================
        HackerSubEachDay as (
            SELECT  submission_date,
                    COUNT(DISTINCT hacker_id) AS HackerCnt
            FROM HackerCntTillDate
            WHERE PrevCnt = dayRn
            GROUP BY submission_date)


SELECT  HackerSubEachDay.submission_date,
        HackerSubEachDay.HackerCnt,
        MaxSubEachDay.hacker_id,
        Hackers.name
        
FROM    HackerSubEachDay
        INNER JOIN MaxSubEachDay ON HackerSubEachDay.submission_date = MaxSubEachDay.submission_date
        INNER JOIN Hackers ON Hackers.hacker_id = MaxSubEachDay.hacker_id

WHERE MaxSubEachDay.Rn=1