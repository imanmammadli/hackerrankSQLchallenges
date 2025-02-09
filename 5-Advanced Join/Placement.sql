SELECT  std.name
        
FROM students AS std
    JOIN friends AS frd ON std.id = frd.id
    JOIN packages AS pck_std ON pck_std.id = std.id
    JOIN packages AS pck_frd ON pck_frd.id = frd.friend_id
    
WHERE pck_frd.salary > pck_std.salary

ORDER BY pck_frd.salary