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
CREATE TABLE FactFlightCosts (
    SK_Fact_Flight_Cost INT,
    Flight_Key INT,
    Aircraft_Key INT,
    Date_Key VARCHAR2(50),
    Fuel_Cost_USD DECIMAL(12, 2),
    Crew_Cost_USD DECIMAL(12, 2),
    Airport_Fees_USD DECIMAL(12, 2),
    Maintenance_Cost_USD DECIMAL(12, 2),
    Catering_Cost_USD DECIMAL(12, 2),
    Total_Cost_USD DECIMAL(12, 2),
    
    CONSTRAINT pk_flight_cost_key PRIMARY KEY (SK_Fact_Flight_Cost),
    CONSTRAINT fk_fact_flight FOREIGN KEY (Flight_Key) REFERENCES DIM_FLIGHT(Flight_Key),
    CONSTRAINT fk_fact_aircraft FOREIGN KEY (Aircraft_Key) REFERENCES DimAircraft(Aircraft_Key),
    CONSTRAINT fk_fact_date FOREIGN KEY (Date_Key) REFERENCES Dim_Date(Date_Key)
);
CREATE TABLE FACT_RESERVATION_Tables (
    Reservation_SK NUMBER NOT NULL,
    Passenger_Key NUMBER NOT NULL,
    Flight_Key NUMBER NOT NULL,
    Fare_Key NUMBER NOT NULL,
    Channel_Key NUMBER NOT NULL,
    PROMO_Key NUMBER,

    Booking_Date_Key VARCHAR2(10) NOT NULL,
    Departure_Date_Key VARCHAR2(10) NOT NULL,
    Arrival_Date_Key VARCHAR2(10) NOT NULL,

    Reservation_ID NUMBER NOT NULL,

    Seat_Number VARCHAR2(10),
    Payment_Method VARCHAR2(30),
    Amount_Paid NUMBER(10,2),
    Miles_Earned NUMBER,
    Miles_Redeemed NUMBER,
    Is_Upgrade CHAR(1),
    Status VARCHAR2(30),

    CONSTRAINT PK_FACT_RESERVATION PRIMARY KEY (Reservation_SK),
    CONSTRAINT FK_FACT_RES_PASSENGER FOREIGN KEY (Passenger_Key) REFERENCES DIMPASSENGER(Passenger_Key),
    CONSTRAINT FK_FACT_RES_FLIGHT FOREIGN KEY (Flight_Key) REFERENCES DIM_FLIGHT(Flight_Key),
    CONSTRAINT FK_FACT_RES_FARE FOREIGN KEY (Fare_Key) REFERENCES DIM_FARE_CLASS(FARE_CLASS_SK),
    CONSTRAINT FK_FACT_RES_CHANNEL FOREIGN KEY (Channel_Key) REFERENCES DIM_BOOKING_CHANNEL(Channel_Key),
    CONSTRAINT FK_FACT_RES_BOOK_DATE FOREIGN KEY (Booking_Date_Key) REFERENCES DIM_DATE(Date_Key),
    CONSTRAINT FK_FACT_RES_DEP_DATE FOREIGN KEY (Departure_Date_Key) REFERENCES DIM_DATE(Date_Key),
    CONSTRAINT FK_FACT_RES_ARR_DATE FOREIGN KEY (Arrival_Date_Key) REFERENCES DIM_DATE(Date_Key)
);
CREATE TABLE FactTicket (
    SK_Fact_Tickets Number  PRIMARY KEY,

    Passenger_Key NUMBER NOT NULL,
    Flight_Key NUMBER NOT NULL,
    FARE_CLASS_SK NUMBER NOT NULL,
    Date_Key VARCHAR2(10) NOT NULL,

    Ticket_ID NUMBER,
    Reservation_ID NUMBER,
    Ticket_Number VARCHAR2(30),
    Seat_Number VARCHAR2(10),

    Base_Fare_USD NUMBER(10,2),
    Tax_Amount_USD NUMBER(10,2),
    Fee_Amount_USD NUMBER(10,2),
    Discount_Amount_USD NUMBER(10,2),
    Final_Ticket_Amount_USD NUMBER(10,2),

    Ticket_Status VARCHAR2(30),
    Miles_Earned NUMBER,
    Miles_Redeemed NUMBER,

    CONSTRAINT FK_FACT_TICKET_PASSENGER FOREIGN KEY (Passenger_Key) REFERENCES DimPassenger(Passenger_Key),
    CONSTRAINT FK_FACT_TICKET_FLIGHT FOREIGN KEY (Flight_Key) REFERENCES DIM_FLIGHT(Flight_Key),
    CONSTRAINT FK_FACT_TICKET_FARE FOREIGN KEY (FARE_CLASS_SK) REFERENCES dim_fare_class(FARE_CLASS_SK),
    CONSTRAINT FK_FACT_TICKET_DATE FOREIGN KEY (Date_Key) REFERENCES Dim_Date(Date_Key)
);
