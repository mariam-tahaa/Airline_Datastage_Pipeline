CREATE TABLE FACT_CUSTOMER_INTERACTION (
    INTERACTION_KEY     NUMBER PRIMARY KEY,
    PASSENGER_KEY       NUMBER,
    DATE_KEY            NUMBER,
    INTERACTION_ID      NUMBER,
    RESERVATION_ID      NUMBER,
    INTERACTION_TYPE    VARCHAR2(50),
    CHANNEL             VARCHAR2(50),
    ISSUE_CATEGORY      VARCHAR2(100),
    SEVERITY            VARCHAR2(30),
    RESOLUTION_STATUS   VARCHAR2(50),
    CSAT_SCORE          NUMBER(5,2)
);
CREATE TABLE Fact_Overnight_Stay (
    Stay_Key             NUMBER(10) PRIMARY KEY,
    Passenger_Key        NUMBER(10),
    CHECK_IN_DATE_KEY    NUMBER(10),
    CHECK_OUT_DATE_KEY   NUMBER(10),
    Stay_ID              NUMBER(10),
    Reservation_ID       NUMBER(10),
    Hotel_Name           VARCHAR2(100),
    City                 VARCHAR2(50),
    Country              VARCHAR2(50),
    Nights               NUMBER(5),
    Room_Type            VARCHAR2(30),
    Nightly_Rate_USD     NUMBER(10,2),
    Paid_By_Airline      CHAR(1)
);
CREATE TABLE FACT_FLIGHT_UPGRADE (
    UPGRADE_KEY       NUMBER PRIMARY KEY,
    PASSENGER_KEY     NUMBER,
    FLIGHT_KEY        NUMBER,
    UPGRADE_DATE_KEY  NUMBER,
    CHANNEL_KEY       NUMBER,
    UPGRADE_ID        NUMBER,
    RESERVATION_ID    NUMBER,
    FROM_CLASS        VARCHAR2(20),
    TO_CLASS          VARCHAR2(20),
    UPGRADE_TYPE      VARCHAR2(30),
    MILES_USED        NUMBER,
    AMOUNT_PAID       NUMBER(10,2),
    UPGRADE_STATUS    VARCHAR2(30)
);