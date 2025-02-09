SELECT
    con.contest_id,
    con.hacker_id,
    con.name,
    COALESCE(SUM(s_stats.total_submissions), 0) AS total_submissions,
    COALESCE(SUM(s_stats.total_accepted_submissions), 0) AS total_accepted_submissions,
    COALESCE(SUM(v_stats.total_views), 0) AS total_views,
    COALESCE(SUM(v_stats.total_unique_views), 0) AS total_unique_views


FROM contests AS con
    LEFT JOIN colleges AS col ON con.contest_id = col.contest_id
    LEFT JOIN challenges AS cha ON col.college_id = cha.college_id
    LEFT JOIN (
                SELECT  challenge_id,
                        SUM(total_views) AS total_views,
                        SUM(total_unique_views) AS total_unique_views
                FROM view_stats
                GROUP BY challenge_id) AS v_stats ON v_stats.challenge_id = cha.challenge_id
    LEFT JOIN (
                SELECT  challenge_id,
                        SUM(total_submissions) AS total_submissions,
                        SUM(total_accepted_submissions) AS total_accepted_submissions
                FROM submission_stats
                GROUP BY challenge_id) AS s_stats ON s_stats.challenge_id = cha.challenge_id


GROUP BY con.contest_id,
         con.hacker_id,
         con.name
         
         
HAVING SUM(s_stats.total_submissions) != 0 
        OR SUM(s_stats.total_accepted_submissions) != 0
        OR SUM(v_stats.total_views) != 0
        OR SUM(v_stats.total_unique_views) != 0
        
        
ORDER BY con.contest_id;