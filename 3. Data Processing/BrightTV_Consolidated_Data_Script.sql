  ----------------------------------------------------------------- 
--- FINAL SCRIPT
---------------------------------------------------------------
SELECT 
--- USER DIMENSIONS
    COALESCE(u.UserID,v.UserID0, 'Unknown') AS UserID,
    IFNULL(u.Gender, 'Unknown') AS Gender,
    IFNULL(u.Race, 'Unknown') AS Race,

    --- FIX PROVINCE NAMING CONVENTION
    CASE 
        WHEN u.Province IS NULL THEN 'Unknown'
        WHEN LOWER(u.Province) = 'kwazulu natal' THEN 'KwaZulu-Natal'
        ELSE u.Province
    END AS Province,

    --- AGE CLEANED
    CASE 
        WHEN u.Age IS NULL OR u.Age = 0 THEN 'Unknown'   --- there's over 900 records where Age = 0 (if left as is, it will skew analysis)
        ELSE CAST(u.Age AS STRING)   --- Convert to string to allow mixing numeric values with 'Unknown'
    END AS Age,
     ---AGE CLASSIFICATION
    CASE 
        WHEN u.Age IS NULL OR u.Age = 0 THEN 'Unknown'
        WHEN u.Age < 13 THEN 'Child (<13)'
        WHEN u.Age BETWEEN 13 AND 19 THEN 'Teenager (13 - 19)'
        WHEN u.Age BETWEEN 20 AND 35 THEN 'Young Adult (20 - 35)'
        WHEN u.Age BETWEEN 36 AND 59 THEN 'Adult(36 - 59)'
        ELSE 'Senior (60+)'
    END AS Age_Group,

--- DATE & TIME BREAKDOWNS
    --conversion
    from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg') AS SA_Time,

    -- date
    DATE_FORMAT(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg'), 'yyyy-MM-dd') AS Date,

    -- time
    DATE_FORMAT(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg'), 'HH:mm:ss') AS Time,

    --month
    monthname(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg')) AS Month,

    --day of week
    DATE_FORMAT(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg'), 'E') AS Day_of_Week,

    --- weekday vs weekend classification
    CASE 
        WHEN DATE_FORMAT(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg'), 'E') IN ('Sat','Sun') THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Classification,

    --- TIME BUCKETS
    CASE 
        WHEN DATE_FORMAT(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg'), 'HH:mm:ss') BETWEEN '00:00:00' AND '04:59:59' THEN '01. Early Morning'
        WHEN DATE_FORMAT(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg'), 'HH:mm:ss') BETWEEN '05:00:00' AND '11:59:59' THEN '02. Morning'
        WHEN DATE_FORMAT(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg'), 'HH:mm:ss') BETWEEN '12:00:00' AND '17:59:59' THEN '03. Afternoon'
        WHEN DATE_FORMAT(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg'), 'HH:mm:ss') BETWEEN '18:00:00' AND '19:59:59' THEN '04. Evening'
        WHEN DATE_FORMAT(from_utc_timestamp(v.RecordDate2, 'Africa/Johannesburg'), 'HH:mm:ss') BETWEEN '20:00:00' AND '23:59:59' THEN '05. Night'
    END AS Time_Bucket, 

--- CHANNELS
    IFNULL(v.Channel2, 'Unknown') AS Channel2,

--- DURATION CLEANING
    v.`Duration 2`,
    --- extracting duration time
    date_format(v.`Duration 2`, 'HH:mm:ss') AS Duration_Time,

    --- converting duration time into seconds
     (
        hour(v.`Duration 2`) * 3600 +
        minute(v.`Duration 2`) * 60 +
        second(v.`Duration 2`)
    ) AS duration_seconds,

--- DURATION BEHAVIOURAL CLASSIFICATION (SEGMENTATION)
    CASE 
      WHEN      (
          hour(v.`Duration 2`) * 3600 +
          minute(v.`Duration 2`) * 60 +
          second(v.`Duration 2`)
      ) < 900 THEN '01. Light Viewer (< 15 min)' -- < 15 min

      WHEN      (
          hour(v.`Duration 2`) * 3600 +
          minute(v.`Duration 2`) * 60 +
          second(v.`Duration 2`)
      ) BETWEEN 901 AND 2400 THEN '02. Engaged Viewer (15 - 40 min)' -- < 40 min but > 15 min

      ELSE '03. Binge Viewer (> 40 min)'
  END AS Viewer_Type,

--- ENGAGEMENT LEVELS
    CASE
        WHEN (
        hour(v.`Duration 2`) * 3600 +
        minute(v.`Duration 2`) * 60 +
        second(v.`Duration 2`)
    ) < 300 THEN 'Low Engagement (< 5 min)'

    WHEN     (
        hour(v.`Duration 2`) * 3600 +
        minute(v.`Duration 2`) * 60 +
        second(v.`Duration 2`)
    ) BETWEEN 300 AND 1800 THEN 'Medium Engagement (5 - 30 min)'

    ELSE 'High Engagement (> 30 min)'
END AS Engagement_Level


FROM `workspace`.`default`.`bright_tv_viewership` v
LEFT JOIN `workspace`.`default`.`bright_tv_user_profile` u
ON  v.UserID0 = u.UserID;


