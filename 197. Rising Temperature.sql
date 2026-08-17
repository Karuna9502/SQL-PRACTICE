SELECT w.id
FROM Weather AS w
JOIN Weather AS t
    ON DATEDIFF(w.recordDate, t.recordDate) = 1
WHERE w.temperature > t.temperature;

-- HERE WHAT IS HAVE LEARNED IS 
MIN() compares the entire date chronologically — not separately as “month first” or “day first.”
