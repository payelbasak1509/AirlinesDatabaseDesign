CREATE VIEW CustomerDetalisView AS
SELECT cust.FirstName + ' ' + cust.LastName AS Name, conInfo.MobileNumber,
conInfo.OfficeNumber, conInfo.HomeNumber, conInfo.Email, address.AddressLineOne + ', '
+ city.City + ', ' + state.State + ', ' + country.Country AS Address,
custMem.MembershipNumber, freeProg.ProgramName
FROM Customer cust
      INNER JOIN ContactInfo conInfo
      ON cust.ContactInfo = conInfo.ContactId
      INNER JOIN AddressList addList
      ON addList.ContactId = conInfo.ContactId
	  INNER JOIN Address address
      ON addList.Address = address.AddressId
	  INNER JOIN City city
	  ON address.City = city.CityId
	  INNER JOIN State state
	  ON address.State = state.StateId
	  INNER JOIN Country country
	  ON address.Country = country.CountryId
	  INNER JOIN CustomerMembership custMem
	  ON cust.CustomerId = custMem.CustomerId
	  INNER JOIN FrequentFlierProgram freeProg
	  ON freeProg.ProgramId = custMem.MembershipId

CREATE VIEW EmployeeDetails AS
SELECT emp.FirstName + ' ' + emp.LastName AS EmployeeNameName, emp.EmployeeId,
sal.GrossSalary, rol.Title, dep.DepartmentName
FROM Employees emp
	 INNER JOIN Salary sal
	 ON emp.Salary = sal.SalaryId
	 INNER JOIN Role rol
	 ON rol.RoleId = emp.Role
	 INNER JOIN Department dep
	 ON dep.DepartmentId = rol.Department

CREATE VIEW HubInformation AS
SELECT aPort.AirportName, loc.DestinationName, terms.TerminalNumber,
terms.Capacity, ga.Number AS GateNumber, aBridge.Number AS AeroBridgeNumber,
mod.Name AS AcceptableAircraft, hang.HangarNumber
FROM Hub h
	 INNER JOIN Airport aPort
	 ON h.Airport = aPort.AirportId
	 INNER JOIN Locations loc
	 ON aPort.Location = loc.DestinationId
	 INNER JOIN Terminals terms
	 ON terms.Airport = aPort.AirportId
	 INNER JOIN Gates ga
	 ON ga.Terminal = terms.TerminalId
	 LEFT JOIN Aerobridges aBridge
	 ON aBridge.Gate = ga.GateId
	 LEFT JOIN AcceptableAircrafts accAirCraft
	 ON accAirCraft.Airport = aPort.AirportId
	 LEFT JOIN Fleet fl
	 ON accAirCraft.Aircraft = fl.AircraftId
	 LEFT JOIN Model mod
	 ON fl.Model = mod.ModelId
	 LEFT JOIN Hangars hang
	 ON hang.Airport = aPort.AirportId

CREATE VIEW IternaryInformation AS
SELECT iter.IternaryId, iter.SeatNumber,CONVERT (DATE, iter.Date) AS TravelDate, flSch.DepartureTime,
flSch.ArrivalTime, (COALESCE(amtDet.FlightCost, 0) + COALESCE(amtDet.GroundTransportCost, 0)
+ COALESCE(amtDet.TaxAmount, 0) + COALESCE(amtDet.FuelCharges, 0) + COALESCE(amtDet.HotelCharges, 0)
+ COALESCE(amtDet.AdditionalServiceCost, 0) + COALESCE(amtDet.LuggageCharges, 0)) AS TotalCost,
pay.PaymentId, trans.AuthenticationId, payType.Type
FROM Iternary iter
	 RIGHT JOIN Trip tr
	 ON tr.TripId = iter.TripId
	 INNER JOIN FlightSchedule flSch
	 ON flSch.ScheduleId = iter.FlightSchedule
	 INNER JOIN Payment pay
	 ON pay.IternaryId = iter.IternaryId
	 INNER JOIN AmountDetails amtDet
	 ON amtDet.AmountId = pay.AmountId
	 INNER JOIN Transactions trans
	 ON trans.TransactionId = pay.TransactionId
	 INNER JOIN PaymentType payType
	 ON payType.PaymentTypeId = trans.PaymentTypeId