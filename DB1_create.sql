-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2015-04-20 01:25:50.192




-- tables
-- Table: AcceptableAircrafts
CREATE TABLE AcceptableAircrafts (
    AcceptableAircraftId int  NOT NULL,
    Airport int  NOT NULL,
    Hangar int  NOT NULL,
    Aircraft int  NOT NULL,
    CONSTRAINT AcceptableAircrafts_pk PRIMARY KEY (AcceptableAircraftId)
)
;





-- Table: Address
CREATE TABLE Address (
    AddressId int  NOT NULL,
    AddressLineOne text  NOT NULL,
    AddressLineTwo text  NULL,
    City int  NOT NULL,
    State int  NOT NULL,
    Country int  NOT NULL,
    ZipCode int  NOT NULL,
    CONSTRAINT Address_pk PRIMARY KEY (AddressId)
)
;





-- Table: AddressList
CREATE TABLE AddressList (
    AddressListId int  NOT NULL,
    Address int  NOT NULL,
    ContactId int  NOT NULL,
    AddressType text  NOT NULL,
    CONSTRAINT AddressList_pk PRIMARY KEY (AddressListId)
)
;





-- Table: Aerobridges
CREATE TABLE Aerobridges (
    AerobridgeId int  NOT NULL,
    Number int  NOT NULL,
    Type int  NOT NULL,
    Gate int  NOT NULL,
    CONSTRAINT Aerobridges_pk PRIMARY KEY (AerobridgeId)
)
;





-- Table: AircraftHistory
CREATE TABLE AircraftHistory (
    AirCraftHistoryId int  NOT NULL,
    MilesTraveled float(10)  NOT NULL,
    LastServicedOn date  NOT NULL,
    Age int  NOT NULL,
    DecommisionDate date  NOT NULL,
    NextServiceOn date  NOT NULL,
    CONSTRAINT AircraftHistory_pk PRIMARY KEY (AirCraftHistoryId)
)
;





-- Table: AirlinePartnerships
CREATE TABLE AirlinePartnerships (
    PartnershipId int  NOT NULL,
    PartnershipName text  NOT NULL,
    CONSTRAINT AirlinePartnerships_pk PRIMARY KEY (PartnershipId)
)
;





-- Table: Airlines
CREATE TABLE Airlines (
    AirlineId int  NOT NULL,
    AirlineName text  NOT NULL,
    CONSTRAINT Airlines_pk PRIMARY KEY (AirlineId)
)
;





-- Table: Airport
CREATE TABLE Airport (
    AirportId int  NOT NULL,
    Location int  NOT NULL,
    Fees int  NOT NULL,
    CONSTRAINT Airport_pk PRIMARY KEY (AirportId)
)
;





-- Table: AirportFees
CREATE TABLE AirportFees (
    AirportFeesId int  NOT NULL,
    StateFee float(10)  NOT NULL,
    CityFee float(10)  NOT NULL,
    OperationsFee float(10)  NOT NULL,
    EmergencyServicesFee float(10)  NOT NULL,
    OtherFees float(10)  NULL,
    CONSTRAINT AirportFees_pk PRIMARY KEY (AirportFeesId)
)
;





-- Table: AmountDetails
CREATE TABLE AmountDetails (
    AmountId int  NOT NULL,
    FlightCost int  NOT NULL,
    GroundTransportCost int  NOT NULL,
    TaxAmount int  NOT NULL,
    FuelCharges int  NOT NULL,
    HotelCharges int  NOT NULL,
    AdditionalServiceCost int  NOT NULL,
    LuggageCharges int  NOT NULL,
    CONSTRAINT AmountDetails_pk PRIMARY KEY (AmountId)
)
;





-- Table: CardDetails
CREATE TABLE CardDetails (
    CardDetailsId int  NOT NULL,
    Type int  NOT NULL,
    CardNumber int  NOT NULL,
    NameOnCard text  NOT NULL,
    ExpiryDate datetime  NOT NULL,
    CONSTRAINT CardDetails_pk PRIMARY KEY (CardDetailsId)
)
;





-- Table: Category
CREATE TABLE Category (
    CategoryId int  NOT NULL,
    Category text  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (CategoryId)
)
;





-- Table: City
CREATE TABLE City (
    CityId int  NOT NULL,
    City text  NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (CityId)
)
;





-- Table: Class
CREATE TABLE Class (
    ClassId int  NOT NULL,
    Class text  NOT NULL,
    CONSTRAINT Class_pk PRIMARY KEY (ClassId)
)
;





-- Table: Configuration
CREATE TABLE Configuration (
    ConfigurationId int  NOT NULL,
    EconomyCapacity int  NOT NULL,
    BusinessCapacity int  NOT NULL,
    FirstClassCapacity int  NOT NULL,
    CONSTRAINT Configuration_pk PRIMARY KEY (ConfigurationId)
)
;





-- Table: ContactInfo
CREATE TABLE ContactInfo (
    ContactId int  NOT NULL,
    MobileNumber int  NOT NULL,
    OfficeNumber int  NULL,
    HomeNumber int  NULL,
    PrimaryPhoneNumber int  NOT NULL,
    Email text  NOT NULL,
    CONSTRAINT ContactInfo_pk PRIMARY KEY (ContactId)
)
;





-- Table: Country
CREATE TABLE Country (
    CountryId int  NOT NULL,
    Country text  NOT NULL,
    CountryPhoneCode int  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (CountryId)
)
;





-- Table: CreditCardType
CREATE TABLE CreditCardType (
    TypeId int  NOT NULL,
    Type text  NOT NULL,
    CONSTRAINT CreditCardType_pk PRIMARY KEY (TypeId)
)
;





-- Table: Currency
CREATE TABLE Currency (
    CurrencyId int  NOT NULL,
    Currency text  NOT NULL,
    RateInUSD float(5)  NOT NULL,
    CONSTRAINT Currency_pk PRIMARY KEY (CurrencyId)
)
;





-- Table: Customer
CREATE TABLE Customer (
    CustomerId int  NOT NULL,
    ContactInfo int  NOT NULL,
    FirstName nvarchar  NOT NULL,
    LastName nvarchar  NOT NULL,
    MiddleName nvarchar  NULL,
    DateOfBirth date  NOT NULL,
    SignUpDate date  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (CustomerId)
)
;





-- Table: CustomerMembership
CREATE TABLE CustomerMembership (
    MembershipId int  NOT NULL,
    CustomerId int  NOT NULL,
    ProgramId int  NOT NULL,
    MembershipNumber int  NOT NULL,
    MilesEarned float(20)  NOT NULL,
    Tier int  NOT NULL,
    MilesExpiryDate date  NOT NULL,
    CONSTRAINT CustomerMembership_pk PRIMARY KEY (MembershipId)
)
;





-- Table: Department
CREATE TABLE Department (
    DepartmentId int  NOT NULL,
    ParentDepartment int  NULL,
    DepartmentName int  NOT NULL,
    CONSTRAINT Department_pk PRIMARY KEY (DepartmentId)
)
;





-- Table: DietType
CREATE TABLE DietType (
    DietTypeId int  NOT NULL,
    DietType text  NOT NULL,
    CONSTRAINT DietType_pk PRIMARY KEY (DietTypeId)
)
;





-- Table: EmployeeRole
CREATE TABLE EmployeeRole (
    EmployeeRoleId int  NOT NULL,
    Employee int  NOT NULL,
    Role int  NOT NULL,
    CONSTRAINT EmployeeRole_pk PRIMARY KEY (EmployeeRoleId)
)
;





-- Table: Employees
CREATE TABLE Employees (
    EmployeeId int  NOT NULL,
    Contactnfo int  NOT NULL,
    Supervisor int  NULL,
    Salary int  NOT NULL,
    FirstName text  NOT NULL,
    LastName text  NOT NULL,
    MiddleInitials char(1)  NOT NULL,
    EmployementDuration int  NOT NULL,
    Role int  NOT NULL,
    SocialSecurityNumber int  NOT NULL,
    CONSTRAINT Employees_pk PRIMARY KEY (EmployeeId)
)
;





-- Table: Engine
CREATE TABLE Engine (
    EngineId int  NOT NULL,
    Manufacturer int  NOT NULL,
    Type int  NOT NULL,
    ModelNumber text  NOT NULL,
    HorsePower int  NOT NULL,
    CONSTRAINT Engine_pk PRIMARY KEY (EngineId)
)
;





-- Table: EngineType
CREATE TABLE EngineType (
    EngineTypeId int  NOT NULL,
    Type text  NOT NULL,
    CONSTRAINT EngineType_pk PRIMARY KEY (EngineTypeId)
)
;





-- Table: EntertainmentFeature
CREATE TABLE EntertainmentFeature (
    EntertainmentFeatureId int  NOT NULL,
    Class int  NOT NULL,
    FeatureType text  NOT NULL,
    FeatureName text  NOT NULL,
    Charges int  NULL,
    CONSTRAINT EntertainmentFeature_pk PRIMARY KEY (EntertainmentFeatureId)
)
;





-- Table: FeatureList
CREATE TABLE FeatureList (
    FeatureListId int  NOT NULL,
    Meals int  NOT NULL,
    EntertainmentFeatures int  NOT NULL,
    CONSTRAINT FeatureList_pk PRIMARY KEY (FeatureListId)
)
;





-- Table: Fleet
CREATE TABLE Fleet (
    AircraftId int  NOT NULL,
    Model int  NOT NULL,
    Schedule int  NOT NULL,
    AirCraftHistory int  NOT NULL,
    CurrentLocation int  NOT NULL,
    Pilots int  NOT NULL,
    CONSTRAINT Fleet_pk PRIMARY KEY (AircraftId)
)
;





-- Table: FlightCrew
CREATE TABLE FlightCrew (
    FlightCrewId int  NOT NULL,
    Employee int  NOT NULL,
    Flight int  NOT NULL,
    CONSTRAINT FlightCrew_pk PRIMARY KEY (FlightCrewId)
)
;





-- Table: FlightInfo
CREATE TABLE FlightInfo (
    FlightId int  NOT NULL,
    CallSign int  NOT NULL,
    FlightNumber text  NOT NULL,
    AirlineCode text  NOT NULL,
    CONSTRAINT FlightInfo_pk PRIMARY KEY (FlightId)
)
;





-- Table: FlightPilots
CREATE TABLE FlightPilots (
    FlightPilotId int  NOT NULL,
    Employee int  NOT NULL,
    Flight int  NOT NULL,
    CONSTRAINT FlightPilots_pk PRIMARY KEY (FlightPilotId)
)
;





-- Table: FlightSchedule
CREATE TABLE FlightSchedule (
    ScheduleId int  NOT NULL,
    Flight int  NOT NULL,
    Route int  NOT NULL,
    Distance float(10)  NOT NULL,
    AverageTime time(2)  NOT NULL,
    DepartureTime datetime  NOT NULL,
    ArrivalTime datetime  NOT NULL,
    CONSTRAINT FlightSchedule_pk PRIMARY KEY (ScheduleId)
)
;





-- Table: FrequentFlierProgram
CREATE TABLE FrequentFlierProgram (
    ProgramId int  NOT NULL,
    ProgramName int  NOT NULL,
    StartingTier int  NOT NULL,
    MaximumTier int  NOT NULL,
    MimimumMiles float(20)  NOT NULL,
    CONSTRAINT FrequentFlierProgram_pk PRIMARY KEY (ProgramId)
)
;





-- Table: Gates
CREATE TABLE Gates (
    GateId int  NOT NULL,
    Teminal int  NOT NULL,
    Number int  NOT NULL,
    Floor int  NULL,
    CONSTRAINT Gates_pk PRIMARY KEY (GateId)
)
;





-- Table: GroundCrew
CREATE TABLE GroundCrew (
    GroundCrewId int  NOT NULL,
    Employee int  NOT NULL,
    Airport int  NOT NULL,
    CONSTRAINT GroundCrew_pk PRIMARY KEY (GroundCrewId)
)
;





-- Table: Hangars
CREATE TABLE Hangars (
    HangarId int  NOT NULL,
    Airport int  NOT NULL,
    HangarNumber text  NOT NULL,
    CONSTRAINT Hangars_pk PRIMARY KEY (HangarId)
)
;





-- Table: Hub
CREATE TABLE Hub (
    HubId int  NOT NULL,
    Airport int  NOT NULL,
    CONSTRAINT Hub_pk PRIMARY KEY (HubId)
)
;





-- Table: Iternary
CREATE TABLE Iternary (
    IternaryId int  NOT NULL,
    Origin int  NOT NULL,
    Destination int  NOT NULL,
    TripId int  NOT NULL,
    ArrivalTime datetime  NOT NULL,
    DepartureTime datetime  NOT NULL,
    SeatNumber nvarchar  NOT NULL,
    CustomerId int  NOT NULL,
    PassengerList int  NOT NULL,
    CheckInTime datetime  NOT NULL,
    CheckedInPieces int  NOT NULL,
    CONSTRAINT Iternary_pk PRIMARY KEY (IternaryId)
)
;





-- Table: Locations
CREATE TABLE Locations (
    DestinationId int  NOT NULL,
    DestinationName int  NOT NULL,
    CONSTRAINT Locations_pk PRIMARY KEY (DestinationId)
)
;





-- Table: Lounge
CREATE TABLE Lounge (
    LoungeId int  NOT NULL,
    OwnedBy int  NOT NULL,
    Terminal int  NOT NULL,
    Capacity int  NOT NULL,
    CONSTRAINT Lounge_pk PRIMARY KEY (LoungeId)
)
;





-- Table: Manufacturer
CREATE TABLE Manufacturer (
    ManufacturerId int  NOT NULL,
    Name text  NOT NULL,
    Location text  NOT NULL,
    PrimaryFacility text  NOT NULL,
    Partnership text  NOT NULL,
    CONSTRAINT Manufacturer_pk PRIMARY KEY (ManufacturerId)
)
;





-- Table: Meal
CREATE TABLE Meal (
    MealId int  NOT NULL,
    Type int  NOT NULL,
    DietType int  NOT NULL,
    Class int  NOT NULL,
    Category int  NOT NULL,
    MealName text  NOT NULL,
    MealCode text  NOT NULL,
    NutritionCount int  NOT NULL,
    CONSTRAINT Meal_pk PRIMARY KEY (MealId)
)
;





-- Table: MealType
CREATE TABLE MealType (
    MealTypeId int  NOT NULL,
    MealType text  NOT NULL,
    CONSTRAINT MealType_pk PRIMARY KEY (MealTypeId)
)
;





-- Table: Model
CREATE TABLE Model (
    ModelId int  NOT NULL,
    Configuration int  NOT NULL,
    Manufacturer int  NOT NULL,
    Engines int  NOT NULL,
    SeatCharges int  NOT NULL,
    Features int  NOT NULL,
    Name text  NOT NULL,
    Capacity int  NOT NULL,
    Weight float(10)  NOT NULL,
    WingSpan float(10)  NOT NULL,
    Height float(10)  NOT NULL,
    MaximumDistance float(10)  NOT NULL,
    FuelConsumption float(10)  NOT NULL,
    Price float(10)  NOT NULL,
    CONSTRAINT Model_pk PRIMARY KEY (ModelId)
)
;





-- Table: PartnershipMember
CREATE TABLE PartnershipMember (
    MembershipId int  NOT NULL,
    Patrnership int  NOT NULL,
    Airline int  NOT NULL,
    CONSTRAINT PartnershipMember_pk PRIMARY KEY (MembershipId)
)
;





-- Table: PassengerList
CREATE TABLE PassengerList (
    PassengerListId int  NOT NULL,
    IternaryId int  NOT NULL,
    PassengerId int  NOT NULL,
    CONSTRAINT PassengerList_pk PRIMARY KEY (PassengerListId)
)
;





-- Table: Payment
CREATE TABLE Payment (
    PaymentId int  NOT NULL,
    IternaryId int  NOT NULL,
    TransactionId int  NOT NULL,
    AmountId int  NOT NULL,
    Currency int  NOT NULL,
    VoucherCode text  NOT NULL,
    TotalDiscount int  NOT NULL,
    DiscountReason int  NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (PaymentId)
)
;





-- Table: PaymentType
CREATE TABLE PaymentType (
    PaymentTypeId int  NOT NULL,
    Type text  NOT NULL,
    SubType text  NOT NULL,
    CONSTRAINT PaymentType_pk PRIMARY KEY (PaymentTypeId)
)
;





-- Table: PrimaryPhoneLookup
CREATE TABLE PrimaryPhoneLookup (
    PrimaryPhoneId int  NOT NULL,
    ContactId int  NOT NULL,
    CountryCode int  NOT NULL,
    PrimaryPhone text  NOT NULL,
    CONSTRAINT PrimaryPhoneLookup_pk PRIMARY KEY (PrimaryPhoneId)
)
;





-- Table: Role
CREATE TABLE Role (
    RoleId int  NOT NULL,
    Department int  NOT NULL,
    Location int  NOT NULL,
    Title text  NOT NULL,
    Designation text  NOT NULL,
    CONSTRAINT Role_pk PRIMARY KEY (RoleId)
)
;





-- Table: Route
CREATE TABLE Route (
    RouteId int  NOT NULL,
    Destination int  NOT NULL,
    Origin int  NOT NULL,
    CONSTRAINT Route_pk PRIMARY KEY (RouteId)
)
;





-- Table: Runway
CREATE TABLE Runway (
    RunwayId int  NOT NULL,
    Airport int  NOT NULL,
    Direction int  NOT NULL,
    CallSign text  NOT NULL,
    RunwayNumber text  NOT NULL,
    Length int  NOT NULL,
    CONSTRAINT Runway_pk PRIMARY KEY (RunwayId)
)
;





-- Table: RunwayDirection
CREATE TABLE RunwayDirection (
    DirectionId int  NOT NULL,
    Direction text  NOT NULL,
    CONSTRAINT RunwayDirection_pk PRIMARY KEY (DirectionId)
)
;





-- Table: Salary
CREATE TABLE Salary (
    SalaryId int  NOT NULL,
    GrossSalary float(10)  NOT NULL,
    TotalTaxableIncome float(10)  NOT NULL,
    Allowances float(10)  NOT NULL,
    CONSTRAINT Salary_pk PRIMARY KEY (SalaryId)
)
;





-- Table: SeatCharges
CREATE TABLE SeatCharges (
    CostId int  NOT NULL,
    EconomyCost float(10)  NOT NULL,
    PremiumEconomyCost float(10)  NOT NULL,
    BusinessCost float(10)  NOT NULL,
    FirstClassCost float(10)  NOT NULL,
    CONSTRAINT SeatCharges_pk PRIMARY KEY (CostId)
)
;





-- Table: State
CREATE TABLE State (
    StateId int  NOT NULL,
    State text  NOT NULL,
    CONSTRAINT State_pk PRIMARY KEY (StateId)
)
;





-- Table: Terminals
CREATE TABLE Terminals (
    TerminalId int  NOT NULL,
    Airport int  NOT NULL,
    TeminalNumber int  NOT NULL,
    Capacity int  NOT NULL,
    CONSTRAINT Terminals_pk PRIMARY KEY (TerminalId)
)
;





-- Table: Transactions
CREATE TABLE Transactions (
    TransactionId int  NOT NULL,
    CardDetails int  NULL,
    PaymentTypeId int  NOT NULL,
    TransactionNumber int  NOT NULL,
    Status text  NOT NULL,
    AuthenticationId int  NOT NULL,
    CONSTRAINT Transactions_pk PRIMARY KEY (TransactionId)
)
;





-- Table: Trip
CREATE TABLE Trip (
    TripId int  NOT NULL,
    CustomerId int  NOT NULL,
    PurchaseDate date  NOT NULL,
    CONSTRAINT Trip_pk PRIMARY KEY (TripId)
)
;









-- foreign keys
-- Reference:  AcceptableAircrafts_Airport (table: AcceptableAircrafts)


ALTER TABLE AcceptableAircrafts ADD CONSTRAINT AcceptableAircrafts_Airport 
    FOREIGN KEY (Airport)
    REFERENCES Airport (AirportId)
;

-- Reference:  AcceptableAircrafts_Fleet (table: AcceptableAircrafts)


ALTER TABLE AcceptableAircrafts ADD CONSTRAINT AcceptableAircrafts_Fleet 
    FOREIGN KEY (Aircraft)
    REFERENCES Fleet (AircraftId)
;

-- Reference:  AcceptableAircrafts_Hangars (table: AcceptableAircrafts)


ALTER TABLE AcceptableAircrafts ADD CONSTRAINT AcceptableAircrafts_Hangars 
    FOREIGN KEY (Hangar)
    REFERENCES Hangars (HangarId)
;

-- Reference:  AddressList_Address (table: AddressList)


ALTER TABLE AddressList ADD CONSTRAINT AddressList_Address 
    FOREIGN KEY (Address)
    REFERENCES Address (AddressId)
;

-- Reference:  AddressList_ContactInfo (table: AddressList)


ALTER TABLE AddressList ADD CONSTRAINT AddressList_ContactInfo 
    FOREIGN KEY (ContactId)
    REFERENCES ContactInfo (ContactId)
;

-- Reference:  Address_City (table: Address)


ALTER TABLE Address ADD CONSTRAINT Address_City 
    FOREIGN KEY (City)
    REFERENCES City (CityId)
;

-- Reference:  Address_Country (table: Address)


ALTER TABLE Address ADD CONSTRAINT Address_Country 
    FOREIGN KEY (Country)
    REFERENCES Country (CountryId)
;

-- Reference:  Address_State (table: Address)


ALTER TABLE Address ADD CONSTRAINT Address_State 
    FOREIGN KEY (State)
    REFERENCES State (StateId)
;

-- Reference:  Aerobridges_Gates (table: Aerobridges)


ALTER TABLE Aerobridges ADD CONSTRAINT Aerobridges_Gates 
    FOREIGN KEY (Gate)
    REFERENCES Gates (GateId)
;

-- Reference:  Airlines_Lounge (table: Lounge)


ALTER TABLE Lounge ADD CONSTRAINT Airlines_Lounge 
    FOREIGN KEY (OwnedBy)
    REFERENCES Airlines (AirlineId)
;

-- Reference:  Airport_AirportFees (table: Airport)


ALTER TABLE Airport ADD CONSTRAINT Airport_AirportFees 
    FOREIGN KEY (Fees)
    REFERENCES AirportFees (AirportFeesId)
;

-- Reference:  Airport_GroundCrew (table: GroundCrew)


ALTER TABLE GroundCrew ADD CONSTRAINT Airport_GroundCrew 
    FOREIGN KEY (Airport)
    REFERENCES Airport (AirportId)
;

-- Reference:  Airport_Locations (table: Airport)


ALTER TABLE Airport ADD CONSTRAINT Airport_Locations 
    FOREIGN KEY (Location)
    REFERENCES Locations (DestinationId)
;

-- Reference:  ContactInfo_Customer (table: Customer)


ALTER TABLE Customer ADD CONSTRAINT ContactInfo_Customer 
    FOREIGN KEY (ContactInfo)
    REFERENCES ContactInfo (ContactId)
;

-- Reference:  ContactInfo_Employees (table: Employees)


ALTER TABLE Employees ADD CONSTRAINT ContactInfo_Employees 
    FOREIGN KEY (Contactnfo)
    REFERENCES ContactInfo (ContactId)
;

-- Reference:  CreditCardType_CardDetails (table: CardDetails)


ALTER TABLE CardDetails ADD CONSTRAINT CreditCardType_CardDetails 
    FOREIGN KEY (Type)
    REFERENCES CreditCardType (TypeId)
;

-- Reference:  CustomerMembership_FrequentFlierProgram (table: CustomerMembership)


ALTER TABLE CustomerMembership ADD CONSTRAINT CustomerMembership_FrequentFlierProgram 
    FOREIGN KEY (ProgramId)
    REFERENCES FrequentFlierProgram (ProgramId)
;

-- Reference:  Customer_CustomerMembership (table: CustomerMembership)


ALTER TABLE CustomerMembership ADD CONSTRAINT Customer_CustomerMembership 
    FOREIGN KEY (CustomerId)
    REFERENCES Customer (CustomerId)
;

-- Reference:  Customer_PassengerList (table: PassengerList)


ALTER TABLE PassengerList ADD CONSTRAINT Customer_PassengerList 
    FOREIGN KEY (PassengerId)
    REFERENCES Customer (CustomerId)
;

-- Reference:  Customer_Trip (table: Trip)


ALTER TABLE Trip ADD CONSTRAINT Customer_Trip 
    FOREIGN KEY (CustomerId)
    REFERENCES Customer (CustomerId)
;

-- Reference:  Department_Department (table: Department)


ALTER TABLE Department ADD CONSTRAINT Department_Department 
    FOREIGN KEY (ParentDepartment)
    REFERENCES Department (DepartmentId)
;

-- Reference:  Destinations_Iternary (table: Iternary)


ALTER TABLE Iternary ADD CONSTRAINT Destinations_Iternary 
    FOREIGN KEY (Destination,Origin)
    REFERENCES Locations (DestinationId,DestinationId)
;

-- Reference:  EmployeeRole_Employees (table: EmployeeRole)


ALTER TABLE EmployeeRole ADD CONSTRAINT EmployeeRole_Employees 
    FOREIGN KEY (Employee)
    REFERENCES Employees (EmployeeId)
;

-- Reference:  EmployeeRole_Role (table: EmployeeRole)


ALTER TABLE EmployeeRole ADD CONSTRAINT EmployeeRole_Role 
    FOREIGN KEY (Role)
    REFERENCES Role (RoleId)
;

-- Reference:  Employees_Employees (table: Employees)


ALTER TABLE Employees ADD CONSTRAINT Employees_Employees 
    FOREIGN KEY (Supervisor)
    REFERENCES Employees (EmployeeId)
;

-- Reference:  Employees_FlightCrew (table: FlightCrew)


ALTER TABLE FlightCrew ADD CONSTRAINT Employees_FlightCrew 
    FOREIGN KEY (Employee)
    REFERENCES Employees (EmployeeId)
;

-- Reference:  Employees_Salary (table: Employees)


ALTER TABLE Employees ADD CONSTRAINT Employees_Salary 
    FOREIGN KEY (Salary)
    REFERENCES Salary (SalaryId)
;

-- Reference:  Engine_EngineType (table: Engine)


ALTER TABLE Engine ADD CONSTRAINT Engine_EngineType 
    FOREIGN KEY (Type)
    REFERENCES EngineType (EngineTypeId)
;

-- Reference:  Engine_Manufacturer (table: Engine)


ALTER TABLE Engine ADD CONSTRAINT Engine_Manufacturer 
    FOREIGN KEY (Manufacturer)
    REFERENCES Manufacturer (ManufacturerId)
;

-- Reference:  Engine_Model (table: Model)


ALTER TABLE Model ADD CONSTRAINT Engine_Model 
    FOREIGN KEY (Engines)
    REFERENCES Engine (EngineId)
;

-- Reference:  EntertainmentFeature_ClassId (table: EntertainmentFeature)


ALTER TABLE EntertainmentFeature ADD CONSTRAINT EntertainmentFeature_ClassId 
    FOREIGN KEY (Class)
    REFERENCES Class (ClassId)
;

-- Reference:  FeatureList_EntertainmentFeature (table: FeatureList)


ALTER TABLE FeatureList ADD CONSTRAINT FeatureList_EntertainmentFeature 
    FOREIGN KEY (EntertainmentFeatures)
    REFERENCES EntertainmentFeature (EntertainmentFeatureId)
;

-- Reference:  Fleet_AircraftHistory (table: Fleet)


ALTER TABLE Fleet ADD CONSTRAINT Fleet_AircraftHistory 
    FOREIGN KEY (AirCraftHistory)
    REFERENCES AircraftHistory (AirCraftHistoryId)
;

-- Reference:  Fleet_FlightCrew (table: FlightCrew)


ALTER TABLE FlightCrew ADD CONSTRAINT Fleet_FlightCrew 
    FOREIGN KEY (Flight)
    REFERENCES Fleet (AircraftId)
;

-- Reference:  Fleet_FlightSchedule (table: Fleet)


ALTER TABLE Fleet ADD CONSTRAINT Fleet_FlightSchedule 
    FOREIGN KEY (Schedule)
    REFERENCES FlightSchedule (ScheduleId)
;

-- Reference:  Fleet_Locations (table: Fleet)


ALTER TABLE Fleet ADD CONSTRAINT Fleet_Locations 
    FOREIGN KEY (CurrentLocation)
    REFERENCES Locations (DestinationId)
;

-- Reference:  Fleet_Model (table: Fleet)


ALTER TABLE Fleet ADD CONSTRAINT Fleet_Model 
    FOREIGN KEY (Model)
    REFERENCES Model (ModelId)
;

-- Reference:  FlightPilots_Employees (table: FlightPilots)


ALTER TABLE FlightPilots ADD CONSTRAINT FlightPilots_Employees 
    FOREIGN KEY (Employee)
    REFERENCES Employees (EmployeeId)
;

-- Reference:  FlightPilots_Fleet (table: FlightPilots)


ALTER TABLE FlightPilots ADD CONSTRAINT FlightPilots_Fleet 
    FOREIGN KEY (Flight)
    REFERENCES Fleet (AircraftId)
;

-- Reference:  FlightSchedule_Flight (table: FlightSchedule)


ALTER TABLE FlightSchedule ADD CONSTRAINT FlightSchedule_Flight 
    FOREIGN KEY (Flight)
    REFERENCES FlightInfo (FlightId)
;

-- Reference:  FlightSchedule_Route (table: FlightSchedule)


ALTER TABLE FlightSchedule ADD CONSTRAINT FlightSchedule_Route 
    FOREIGN KEY (Route)
    REFERENCES Route (RouteId)
;

-- Reference:  GroundCrew_Employees (table: GroundCrew)


ALTER TABLE GroundCrew ADD CONSTRAINT GroundCrew_Employees 
    FOREIGN KEY (Employee)
    REFERENCES Employees (EmployeeId)
;

-- Reference:  Hangars_Airport (table: Hangars)


ALTER TABLE Hangars ADD CONSTRAINT Hangars_Airport 
    FOREIGN KEY (Airport)
    REFERENCES Airport (AirportId)
;

-- Reference:  Hub_Airport (table: Hub)


ALTER TABLE Hub ADD CONSTRAINT Hub_Airport 
    FOREIGN KEY (Airport)
    REFERENCES Airport (AirportId)
;

-- Reference:  Iternary_Payment (table: Payment)


ALTER TABLE Payment ADD CONSTRAINT Iternary_Payment 
    FOREIGN KEY (IternaryId)
    REFERENCES Iternary (IternaryId)
;

-- Reference:  Locations_Role (table: Role)


ALTER TABLE Role ADD CONSTRAINT Locations_Role 
    FOREIGN KEY (Location)
    REFERENCES Locations (DestinationId)
;

-- Reference:  Meal_Category (table: Meal)


ALTER TABLE Meal ADD CONSTRAINT Meal_Category 
    FOREIGN KEY (Category)
    REFERENCES Category (CategoryId)
;

-- Reference:  Meal_ClassId (table: Meal)


ALTER TABLE Meal ADD CONSTRAINT Meal_ClassId 
    FOREIGN KEY (Class)
    REFERENCES Class (ClassId)
;

-- Reference:  Meal_DietType (table: Meal)


ALTER TABLE Meal ADD CONSTRAINT Meal_DietType 
    FOREIGN KEY (DietType)
    REFERENCES DietType (DietTypeId)
;

-- Reference:  Meal_FeatureList (table: FeatureList)


ALTER TABLE FeatureList ADD CONSTRAINT Meal_FeatureList 
    FOREIGN KEY (Meals)
    REFERENCES Meal (MealId)
;

-- Reference:  Meal_MealType (table: Meal)


ALTER TABLE Meal ADD CONSTRAINT Meal_MealType 
    FOREIGN KEY (Type)
    REFERENCES MealType (MealTypeId)
;

-- Reference:  Model_Configuration (table: Model)


ALTER TABLE Model ADD CONSTRAINT Model_Configuration 
    FOREIGN KEY (Configuration)
    REFERENCES Configuration (ConfigurationId)
;

-- Reference:  Model_FeatureList (table: Model)


ALTER TABLE Model ADD CONSTRAINT Model_FeatureList 
    FOREIGN KEY (Features)
    REFERENCES FeatureList (FeatureListId)
;

-- Reference:  Model_Manufacturer (table: Model)


ALTER TABLE Model ADD CONSTRAINT Model_Manufacturer 
    FOREIGN KEY (Manufacturer)
    REFERENCES Manufacturer (ManufacturerId)
;

-- Reference:  Model_SeatCharges (table: Model)


ALTER TABLE Model ADD CONSTRAINT Model_SeatCharges 
    FOREIGN KEY (SeatCharges)
    REFERENCES SeatCharges (CostId)
;

-- Reference:  PartnershipMember_AirlinePartnerships (table: PartnershipMember)


ALTER TABLE PartnershipMember ADD CONSTRAINT PartnershipMember_AirlinePartnerships 
    FOREIGN KEY (Patrnership)
    REFERENCES AirlinePartnerships (PartnershipId)
;

-- Reference:  PartnershipMember_Airlines (table: PartnershipMember)


ALTER TABLE PartnershipMember ADD CONSTRAINT PartnershipMember_Airlines 
    FOREIGN KEY (Airline)
    REFERENCES Airlines (AirlineId)
;

-- Reference:  PassengerList_Iternary (table: PassengerList)


ALTER TABLE PassengerList ADD CONSTRAINT PassengerList_Iternary 
    FOREIGN KEY (IternaryId)
    REFERENCES Iternary (IternaryId)
;

-- Reference:  PaymentType_Transactions (table: Transactions)


ALTER TABLE Transactions ADD CONSTRAINT PaymentType_Transactions 
    FOREIGN KEY (PaymentTypeId)
    REFERENCES PaymentType (PaymentTypeId)
;

-- Reference:  Payment_AmountDetails (table: Payment)


ALTER TABLE Payment ADD CONSTRAINT Payment_AmountDetails 
    FOREIGN KEY (AmountId)
    REFERENCES AmountDetails (AmountId)
;

-- Reference:  Payment_Currency (table: Payment)


ALTER TABLE Payment ADD CONSTRAINT Payment_Currency 
    FOREIGN KEY (Currency)
    REFERENCES Currency (CurrencyId)
;

-- Reference:  PrimaryPhoneLookup_ContactInfo (table: PrimaryPhoneLookup)


ALTER TABLE PrimaryPhoneLookup ADD CONSTRAINT PrimaryPhoneLookup_ContactInfo 
    FOREIGN KEY (ContactId)
    REFERENCES ContactInfo (ContactId)
;

-- Reference:  PrimaryPhoneLookup_Country (table: PrimaryPhoneLookup)


ALTER TABLE PrimaryPhoneLookup ADD CONSTRAINT PrimaryPhoneLookup_Country 
    FOREIGN KEY (CountryCode)
    REFERENCES Country (CountryId)
;

-- Reference:  Role_Department (table: Role)


ALTER TABLE Role ADD CONSTRAINT Role_Department 
    FOREIGN KEY (Department)
    REFERENCES Department (DepartmentId)
;

-- Reference:  Route_Locations (table: Route)


ALTER TABLE Route ADD CONSTRAINT Route_Locations 
    FOREIGN KEY (Destination,Origin)
    REFERENCES Locations (DestinationId,DestinationId)
;

-- Reference:  Runway_Airport (table: Runway)


ALTER TABLE Runway ADD CONSTRAINT Runway_Airport 
    FOREIGN KEY (Airport)
    REFERENCES Airport (AirportId)
;

-- Reference:  Runway_RunwayDirection (table: Runway)


ALTER TABLE Runway ADD CONSTRAINT Runway_RunwayDirection 
    FOREIGN KEY (Direction)
    REFERENCES RunwayDirection (DirectionId)
;

-- Reference:  Terminals_Airport (table: Terminals)


ALTER TABLE Terminals ADD CONSTRAINT Terminals_Airport 
    FOREIGN KEY (Airport)
    REFERENCES Airport (AirportId)
;

-- Reference:  Terminals_Gates (table: Gates)


ALTER TABLE Gates ADD CONSTRAINT Terminals_Gates 
    FOREIGN KEY (Teminal)
    REFERENCES Terminals (TerminalId)
;

-- Reference:  Terminals_Lounge (table: Lounge)


ALTER TABLE Lounge ADD CONSTRAINT Terminals_Lounge 
    FOREIGN KEY (Terminal)
    REFERENCES Terminals (TerminalId)
;

-- Reference:  Transactions_CardDetails (table: Transactions)


ALTER TABLE Transactions ADD CONSTRAINT Transactions_CardDetails 
    FOREIGN KEY (CardDetails)
    REFERENCES CardDetails (CardDetailsId)
;

-- Reference:  Transactions_Payment (table: Payment)


ALTER TABLE Payment ADD CONSTRAINT Transactions_Payment 
    FOREIGN KEY (TransactionId)
    REFERENCES Transactions (TransactionId)
;

-- Reference:  Trip_Iternary (table: Iternary)


ALTER TABLE Iternary ADD CONSTRAINT Trip_Iternary 
    FOREIGN KEY (TripId)
    REFERENCES Trip (TripId)
;





-- End of file.

