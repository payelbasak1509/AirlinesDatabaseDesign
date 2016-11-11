CREATE PROCEDURE dbo.AddFlight (	@Source VARCHAR(20),
									@Destination  VARCHAR(20),
									@FlightInfo INT,
									@Distance DECIMAL(10,2),
									@Duration TIME(0),
									@ArrivalTime TIME(0),
									@DepartureTime TIME(0))  AS

IF
	NOT EXISTS(SELECT * 
			   FROM FlightInfo
		       WHERE FlightId = @FlightInfo)

	BEGIN
		PRINT 'The Flight Information record does not exixts'
	END

ELSE IF
	NOT EXISTS(SELECT *
			   FROM Locations
			   WHERE DestinationName = @Source)

	BEGIN
		PRINT 'The Source Location does not exixts'
	END

ELSE IF
	NOT EXISTS(SELECT *
			   FROM Locations
			   WHERE DestinationName = @Destination)

	BEGIN
		PRINT 'The Destination Location does not exixts'
	END
DECLARE @FlightId INT
SELECT @FlightId = (SELECT FlightId 
					FROM FlightInfo
					WHERE FlightId = @FlightInfo)
DECLARE @SourceId INT
SELECT @SourceId = (SELECT DestinationId 
					FROM Locations
					WHERE DestinationName = @Source)

DECLARE @DestinationId INT
SELECT @DestinationId = (SELECT DestinationId
						 FROM Locations 
						 WHERE DestinationName = @Destination)

DECLARE @RouteId INT
SELECT @RouteId = (SELECT RouteId 
				   FROM Route
				   WHERE Destination = @DestinationId
				   AND Origin = @SourceId)

INSERT INTO FlightSchedule
			(Flight, Route, Distance, AverageTime, DepartureTime, ArrivalTime)
     VALUES
            (@FlightId, @RouteId, @Distance, @Duration, @DepartureTime, @ArrivalTime);
				   

CREATE PROCEDURE dbo.ShowCreditCardDetails (@IternaryId INT) AS

IF
	NOT EXISTS(SELECT * 
			   FROM Iternary
		       WHERE IternaryId = @IternaryId)

	BEGIN
		PRINT 'The Iternary Id Provided is invalid'
	END

	SELECT details.CardNumber, details.NameOnCard, details.ExpiryDate,
		(SELECT Type 
		FROM CreditCardType
		WHERE TypeId = details.Type) AS CardType
	FROM CardDetails details
	WHERE details.CardDetailsId = (SELECT CardDetails
								   FROM Transactions 
								   WHERE TransactionId = (SELECT TransactionId 
														  FROM Payment 
														  WHERE IternaryId = @IternaryId))

CREATE PROCEDURE dbo.ShowAllFlights AS

	SELECT rt.RouteId, flSchedule.DepartureTime, flSchedule.ArrivalTime, flInfo.AirlineCode,
		(SELECT DestinationName FROM Locations WHERE DestinationId = rt.Destination) AS Destination,
		(SELECT DestinationName FROM Locations WHERE DestinationId = rt.Origin) AS Source
	FROM Route rt
	LEFT JOIN FlightSchedule flSchedule
	ON rt.RouteId = flSchedule.Route
	LEFT JOIN Fleet fl
	ON fl.Schedule = flSchedule.ScheduleId
	LEFT JOIN FlightInfo flInfo
	ON flInfo.FlightId = flSchedule.Flight
	

CREATE PROCEDURE dbo.showFlightFeatures(@ModelId INT) AS

IF
	
	NOT EXISTS(SELECT * 
			   FROM Model 
			   WHERE ModelId = @ModelId)

	BEGIN
		PRINT 'No Flights found for the Model Id'
	END

	(SELECT 
		(SELECT ml.MealName 
		 FROM Meal ml
		 WHERE ml.MealId = fl.Meals) AS Meal,
		(SELECT ef.FeatureName   
		 FROM EntertainmentFeature ef
		 WHERE ef.EntertainmentFeatureId = fl.EntertainmentFeatures) AS Feature
	 FROM FeatureList fl
	 WHERE fl.Model = @ModelId)