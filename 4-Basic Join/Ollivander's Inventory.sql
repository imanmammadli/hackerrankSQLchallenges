-- WANDS TABLE -> WD
-- Wands_Property TABLE -> WDP

SELECT  WD.id, 
        WDP.age, 
        WD.coins_needed, 
        WD.power 

FROM wands AS WD 
    JOIN wands_property AS WDP ON WD.code = WDP.code
    
WHERE WDP.is_evil = 0 AND WD.coins_needed = (select min(wd2.coins_needed) 
                                             from wands as wd2 
                                                join wands_property as wdp2 on 
                                             wd2.code = wdp2.code
                                             where WDP.age = wdp2.age and WD.power = wd2.power)

ORDER BY WD.power DESC, WDP.age DESC