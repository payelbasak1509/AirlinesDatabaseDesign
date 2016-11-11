CREATE FUNCTION GetFlightPrice (@Origin AS VARCHAR(20),
								@Destination AS VARCHAR(20),
								@Class AS VARCHAR(20))
RETURNS DECIMAL(10,2) AS
BEGIN
	IF @Class <> 'Economy' AND @Class <> 'Business' AND @Class <> 'First Class'
		BEGIN
			return 0.0
		END
	DECLARE @PriceOfFlight DECIMAL(10,2) 
	DECLARE @RouteId INT
	SELECT @RouteId = (SELECT TOP 1 RouteId 
						FROM Route 
						WHERE Destination = (SELECT DestinationId 
											FROM Locations 
											WHERE DestinationName = @Destination)
						AND Origin = (SELECT DestinationId 
										FROM Locations 
										WHERE DestinationName = @Origin))
	DECLARE @ScheduleId INT
	SELECT  @ScheduleId = (SELECT TOP 1 ScheduleId 
							FROM FlightSchedule 
							WHERE Route = @RouteId)
	DECLARE @ModelId INT
	SELECT  @ModelId = (SELECT Model 
							FROM Fleet 
							WHERE Schedule = @ScheduleId)
	DECLARE @CostId INT
	SELECT  @CostId = (SELECT SeatCharges 
							FROM Model 
							WHERE ModelId = @ModelId)

	IF (@Class = 'Economy')
		BEGIN
			SELECT @PriceOfFlight = (SELECT EconomyCost 
										FROM SeatCharges 
										WHERE CostId = @CostId)
		END
	IF (@Class = 'Business')
		BEGIN
			SELECT @PriceOfFlight = (SELECT BusinessCost 
										FROM SeatCharges 
										WHERE CostId = @CostId)
		END
	IF (@Class = 'First Class')
		BEGIN
			SELECT @PriceOfFlight = (SELECT FirstClassCost 
										FROM SeatCharges 
										WHERE CostId = @CostId)
		END
	RETURN  @PriceOfFlight
END


CREATE FUNCTION GetHomePostalAddress (@EmployeeId AS INT)
RETURNS VARCHAR(500) AS
BEGIN
	DECLARE @AddressLineOne VARCHAR(100),
			@AddressLineTwo VARCHAR(100),
			@ZipCode INT,
			@City VARCHAR(20),
			@State VARCHAR(20),
			@Country VARCHAR(20),
			@FinalAddress VARCHAR(500)

	SELECT @AddressLineOne = (SELECT AddressLineOne
							  FROM Address
							  WHERE AddressId = (SELECT Address 
												 FROM AddressList 
												 WHERE ContactId = (SELECT ContactInfo 
																	FROM Employees 
																	WHERE EmployeeId = @EmployeeId)
												 AND AddressType = 'Home'))
	SELECT @AddressLineTwo = (SELECT AddressLineOne
							  FROM Address
							  WHERE AddressId = (SELECT Address 
												 FROM AddressList 
												 WHERE ContactId = (SELECT ContactInfo 
																	FROM Employees 
																	WHERE EmployeeId = @EmployeeId)
												 AND AddressType = 'Home'))
	SELECT @ZipCode = (SELECT ZipCode
					   FROM Address
					   WHERE AddressId = (SELECT Address 
										  FROM AddressList 
										  WHERE ContactId = (SELECT ContactInfo 
															 FROM Employees 
															 WHERE EmployeeId = @EmployeeId)
										  AND AddressType = 'Home'))
	SELECT @City = (SELECT City 
					FROM City 
					WHERE CityId = (SELECT City
									FROM Address
									WHERE AddressId = (SELECT Address 
														FROM AddressList 
														WHERE ContactId = (SELECT ContactInfo 
																		FROM Employees 
																		WHERE EmployeeId = @EmployeeId)
														AND AddressType = 'Home')))
	SELECT @State = (SELECT State 
					 FROM State 
					 WHERE StateId = (SELECT City
									  FROM Address
									  WHERE AddressId = (SELECT Address 
														 FROM AddressList 
														 WHERE ContactId = (SELECT ContactInfo 
																			FROM Employees 
																			WHERE EmployeeId = @EmployeeId)
														 AND AddressType = 'Home')))
	SELECT @Country = (SELECT Country 
					   FROM Country 
					   WHERE CountryId = (SELECT City
									      FROM Address
										  WHERE AddressId = (SELECT Address 
															 FROM AddressList 
															 WHERE ContactId = (SELECT ContactInfo 
																				FROM Employees 
																				WHERE EmployeeId = @EmployeeId)
															 AND AddressType = 'Home')))
	SET @FinalAddress = @AddressLineOne + ', ' + @City + ', ' + @State + ' - ' + CONVERT(varchar(10), @ZipCode) + ', ' + @Country
	return @FinalAddress
END


CREATE FUNCTION GetTotalInventoryCost ()
RETURNS DECIMAL(10,2) AS
BEGIN
	DECLARE @TotalCost DECIMAL(10,2)
	DECLARE @ModelId INT
	DECLARE @EachCost INT
	DECLARE TotalCost CURSOR FOR 
		SELECT Model 
		FROM Fleet

	OPEN TotalCost  
		FETCH NEXT FROM TotalCost INTO @ModelId
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT @EachCost = (SELECT Price 
							 FROM Model
							 WHERE ModelId = @ModelId)
								 
			SET @TotalCost = @TotalCost + @EachCost	

			FETCH NEXT FROM TotalCost INTO @ModelId 
		END
	CLOSE TotalCost 
	RETURN  @TotalCost
END