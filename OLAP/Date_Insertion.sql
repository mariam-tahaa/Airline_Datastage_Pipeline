DECLARE
    v_start_date DATE := TO_DATE('2023-01-01', 'YYYY-MM-DD');
    v_end_date   DATE := TO_DATE('2025-12-31', 'YYYY-MM-DD');
    v_current    DATE;
BEGIN
    v_current := v_start_date;
    
    WHILE v_current <= v_end_date LOOP
        INSERT INTO dim_date (
            Date_Key,
            Full_Date,
            Day,
            Month,
            Quarter,
            Year
        ) VALUES (
            -- Date_Key format: YYYYMMDD (e.g., 20230101) for clean integer PK lookups
            TO_NUMBER(TO_CHAR(v_current, 'YYYYMMDD')), 
            v_current,
            TO_NUMBER(TO_CHAR(v_current, 'DD')),
            TO_NUMBER(TO_CHAR(v_current, 'MM')),
            TO_NUMBER(TO_CHAR(v_current, 'Q')),
            TO_NUMBER(TO_CHAR(v_current, 'YYYY'))
        );
        
        -- Move to the next day
        v_current := v_current + 1;
    END LOOP;
    
    COMMIT;
END;