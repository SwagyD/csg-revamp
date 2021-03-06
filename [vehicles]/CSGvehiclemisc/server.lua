-- Table with vehicles that are not lockable with MTA functions
local notLockableVehicles = {
	[594] = true, [606] = true, [607] = true, [611] = true, [584] = true, [608] = true,
	[435] = true, [450] = true, [591] = true, [539] = true, [441] = true, [464] = true,
	[501] = true, [465] = true, [564] = true, [472] = true, [473] = true, [493] = true,
	[595] = true, [484] = true, [430] = true, [453] = true, [452] = true, [446] = true,
	[454] = true, [581] = true, [509] = true, [481] = true, [462] = true, [521] = true,
	[463] = true, [510] = true, [522] = true, [461] = true, [448] = true, [468] = true,
	[586] = true, [425] = true, [520] = true, [523] = true,
}

-- On enter
addEventHandler ( "onVehicleStartEnter", root,
	function ( thePlayer, seat, jacked )
		if ( seat == 0 ) then
			if ( getElementData( source, "theFreeVehicleType" ) == "freeVehicle" ) and not ( getElementData( source, "isVehicleBikeVehicle" ) ) then
				if ( getTeamName( getPlayerTeam ( thePlayer ) ) == "Staff" ) then
					setVehicleLocked( source, false )
				elseif ( jacked ) and ( isElement( getVehicleOccupant ( source, 0 ) ) ) and ( exports.DENlaw:isPlayerLawEnforcer( thePlayer ) ) then
					if ( isElement( getVehicleOccupant ( source, 0 ) ) ) and ( getPlayerWantedLevel ( getVehicleOccupant ( source, 0 ) ) >= 1 ) or ( getPlayerTeam( getVehicleOccupant ( source, 0 ) ) == getPlayerTeam( thePlayer ) ) then
						setVehicleLocked( source, false )
					else
						exports.DENdxmsg:createNewDxMessage( thePlayer, "You are not allowed to enter this vehicle!", 0, 200, 0 )
						cancelEvent()
						return
					end
				else
					if ( getTeamName( getPlayerTeam ( thePlayer ) ) == "SWAT" ) and ( getElementData(source, "vehicleTeam") == "SWAT" ) or ( getElementData(source, "vehicleTeam") == "Police" ) then
						-- Enter is allowed
					elseif ( getTeamName( getPlayerTeam ( thePlayer ) ) == "Government Agency" ) and ( getElementData(source, "vehicleTeam") == "Government Agency" ) or ( getElementData(source, "vehicleTeam") == "Police" ) then
						-- Enter is allowed
					elseif ( getTeamName( getPlayerTeam ( thePlayer ) ) == "Military Forces" ) and ( getElementData(source, "vehicleTeam") == "Military Forces" ) or ( getElementData(source, "vehicleTeam") == "Police" ) then
						-- Enter is allowed
					elseif ( getTeamName( getPlayerTeam ( thePlayer ) ) == "Police" ) and ( getElementData(source, "vehicleTeam") == "Police" ) then
						-- Enter is allowed
					elseif ( getTeamName( getPlayerTeam ( thePlayer ) ) == "Criminals" ) and ( getElementData(source, "vehicleTeam") == "Criminals" ) then
						-- Enter is allowed
					elseif ( getTeamName( getPlayerTeam ( thePlayer ) ) == "Paramedics" ) and ( getElementData(source, "vehicleTeam") == "Paramedics" ) then
						-- Enter is allowed
					elseif ( getTeamName( getPlayerTeam ( thePlayer ) ) == "Civilian Workers" ) and ( getElementData(thePlayer, "Occupation" ) == getElementData(source, "vehicleOccupation") ) then
						-- Enter is allowed
					elseif ( getTeamName( getPlayerTeam ( thePlayer ) ) == "Firefighters" ) and ( getElementData(thePlayer, "Occupation" ) == getElementData(source, "vehicleOccupation") ) then
						-- Enter is allowed
					else
						exports.DENdxmsg:createNewDxMessage( thePlayer, "You are not allowed to enter this vehicle!", 0, 200, 0 )
						cancelEvent()
						return
					end
				end
			elseif ( getElementData( source, "isVehicleBikeVehicle" ) ) then
				if (getPlayerWantedLevel(thePlayer) > 1) then
					exports.DENdxmsg:createNewDxMessage( thePlayer, "You are not allowed to use this vehicle with more then 1 wanted star!", 225, 0, 0 )
					cancelEvent()
					return
				end
			end
		end

		if ( notLockableVehicles[getElementModel(source)] ) and ( getElementData( source, "vehicleLocked" ) ) then
			if (getTeamName(getPlayerTeam(thePlayer)) == "Staff") then
				-- nothing
			elseif (getTeamName(getPlayerTeam(thePlayer)) == "SWAT") or (getTeamName(getPlayerTeam(thePlayer)) == "Military Forces") or (getTeamName(getPlayerTeam(thePlayer)) == "Police") or (getTeamName(getPlayerTeam(thePlayer)) == "Government Agency") then
				if isElement(getVehicleController ( source )) then
					local driverWantedLevel = getPlayerWantedLevel ( getVehicleController ( source ) )
					if driverWantedLevel > 0 then
						-- nothing
					else
						cancelEvent()
						exports.DENdxmsg:createNewDxMessage(thePlayer, "You cant enter this vehicle its locked!", 0, 200, 0)
					end
				else
					cancelEvent()
					exports.DENdxmsg:createNewDxMessage(thePlayer, "You cant enter this vehicle its locked!", 0, 200, 0)
				end
			else
				cancelEvent()
				exports.DENdxmsg:createNewDxMessage(thePlayer, "You cant enter this vehicle its locked!", 0, 200, 0)
			end
		elseif isVehicleLocked(source) then
			if (getTeamName(getPlayerTeam(thePlayer)) == "Staff") then
				setVehicleLocked(source, false)
			elseif (getTeamName(getPlayerTeam(thePlayer)) == "SWAT") or (getTeamName(getPlayerTeam(thePlayer)) == "Military Forces") or (getTeamName(getPlayerTeam(thePlayer)) == "Police") or ( getElementData(source, "vehicleTeam") == "Government Agency" ) and getPlayerWantedLevel(jacked) > 0 then
				setVehicleLocked(source, false)
			else
				exports.DENdxmsg:createNewDxMessage(thePlayer, "You cant enter this vehicle its locked!", 0, 200, 0)
			end
		end
	end
)

-- Turn the engine off when you exist the vehicle
addEventHandler("onPlayerVehicleExit", root,
	function( theVehicle, seat, jacked )
		if ( seat == 0 ) then
			if ( isElement( jacked ) ) then
				return
			else
				setVehicleEngineState( theVehicle, false)
			end
		end
	end
)

-- Output a message with the vehicle owner
addEventHandler( "onPlayerVehicleEnter", root,
	function( theVehicle, seat, jacked )
		if ( seat == 0 ) then
			if ( getElementData( theVehicle, "vehicleType" ) == "playerVehicle" ) then
				local vehicleOwner = getElementData( theVehicle, "vehicleOwner" )
				if ( vehicleOwner ) and ( isElement( vehicleOwner ) ) then
					if ( vehicleOwner == source ) then
						return
					else
						if ( getPlayerName( vehicleOwner ) ) then
							exports.DENdxmsg:createNewDxMessage(source, "This vehicle belongs to ".. getPlayerName( vehicleOwner ) .."!", 0, 200, 0)
						end
					end
				end
			end
		end
	end
)

-- Vehicle headlights
addCommandHandler( "headlights",
	function ( thePlayer, cmd, R, G, B )
		if not ( R ) then R = math.random( 1, 255 ) else R = tonumber ( R ) end
		if not ( G ) then G = math.random( 1, 255 ) else G = tonumber ( G ) end
		if not ( B ) then B = math.random( 1, 255 ) else B = tonumber ( B ) end

		if ( isPedInVehicle( thePlayer ) ) and ( getPedOccupiedVehicleSeat( thePlayer ) == 0 ) then
			if ( setVehicleHeadLightColor( getPedOccupiedVehicle( thePlayer ), R, G, B ) ) then
				exports.DENdxmsg:createNewDxMessage( thePlayer, "You're vehicle headlights have been changed.", 0, 255, 0 )
			else
				exports.DENdxmsg:createNewDxMessage( thePlayer, "Failed to set your vehicle headlights, rememeber! use numbers!!", 255, 0, 0 )
			end
		end
	end
)
