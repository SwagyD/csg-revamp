-------------------------------------------------------------------------------
-------------- HOUSING SYSTEM V1.1 COPYRIGHT PRIYEN! --------------
-------------------------------------------------------------------------------
local currRate=1
local intids = {
-- House interoirs with locations
[1]="3|235.22|1188.84|1080.25",
[2]="2|225.13|1240.07|1082.14",
[3]="1|223.2|1288.84|1082.13",
[4]="15|328.03|1479.42|1084.43",
[5]="2|2466.27|-1698.18|1013.5",
[6]="5|227.76|1114.44|1080.99",
[7]="15|385.72|1471.91|1080.18",
[8]="7|225.83|1023.95|1084",
[9]="8|2807.61|-1172.83|1025.57",
[10]="10|2268.66|-1210.38|1047.56",
[11]="3|2495.79|-1694.12|1014.74",
[12]="10|2261.62|-1135.71|1050.63",
[13]="8|2365.2|-1133.07|1050.87",
[14]="5|2233.68|-1113.33|1050.88",
[15]="11|2283|-1138.13|1050.89",
[16]="6|2194.83|-1204.12|1049.02",
[17]="6|2308.73|-1210.88|1049.02",
[18]="1|2215.42|-1076.06|1050.48",
[19]="2|2237.74|-1078.89|1049.02",
[20]="9|2318.03|-1024.64|1050.21",
[21]="6|2333.03|-1075.38|1049.02",
[22]="5|1263.44|-785.63|1091.9",
[23]="1|245.98|305.13|999.14",
[24]="2|269.09|305.15|999.14",
[25]="12|2324.39|-1145.2|1050.71",
[26]="5|318.56|1118.2|1083.88",
[27]="1|245.78|305.12|999.14",
[28]="5|140.33|1368.78|1083.86",
[29]="6|234.21|1066.84|1084.2",
[30]="9|83.52|1324.48|1083.85",
[31]="10|24.15|1341.64|1084.37",
[32]="15|374.34|1417.51|1081.32",
[33]="1|2525.0420|-1679.1150|1015.4990",
}

local leavingCols = {
-- Leaving positions for the doors
[1] = {3, 235.23, 1186.67, 1080.25},
[2] = {2, 226.78, 1239.93, 1082.14},
[3] = {1, 223.07, 1287.08, 1082.13},
[4] = {15, 327.94, 1477.72, 1084.43},
[5] = {2, 2468.84, -1698.36, 1013.5},
[6] = {5, 226.29, 1114.27, 1080.99},
[7] = {15, 387.22, 1471.73, 1080.18},
[8] = {7, 225.66, 1021.44, 1084},
[9] = {8, 2807.62, -1174.76, 1025.57},
[10] = {10, 2270.41, -1210.53, 1047.56},
[11] = {3, 2496.05, -1692.09, 1014.74},
[12] = {10, 2259.38, -1135.9, 1050.63},
[13] = {8, 2365.18, -1135.6, 1050.87},
[14] = {5, 2233.64, -1115.27, 1050.88},
[15] = {11, 2282.82, -1140.29, 1050.89},
[16] = {6, 2196.85, -1204.45, 1049.02},
[17] = {6, 2308.76, -1212.94, 1049.02},
[18] = {1, 2218.4, -1076.36, 1050.48},
[19] = {2, 2237.55, -1081.65, 1049.02},
[20] = {9, 2317.77, -1026.77, 1050.21},
[21] = {6, 2333, -1077.36, 1049.02},
[22] = {5, 1260.64, -785.34, 1091.9},
[23] = {1, 243.71, 305.01, 999.14},
[24] = {2, 266.49, 304.99, 999.14},
[25] = {12, 2324.31, -1149.55, 1050.71},
[26] = {5, 318.57, 1114.47, 1083.88},
[27] = {1, 243.71, 304.96, 999.14},
[28] = {5, 140.32, 1365.91, 1083.86},
[29] = {6, 234.13, 1063.72, 1084.2},
[30] = {9, 83.04, 1322.28, 1083.85},
[31] = {10, 23.92, 1340.16, 1084.37},
[32] = {15, 377.15, 1417.3, 1081.32},
[33] = {5, 1298.87, -797.01, 1084, 1015.4990}
}

local speakerPos = {
	[15] = {2286.3, -1134.14, 1050.630,0,0,327},
	[6] = {242.63, 1119.49,1079.99,0,0,50},
}

local furnPos = { --USES HOUSE SYSTEM IDS, not the interiors
	[1] = {231.3134765625,1187.427734375,1080.2578125,0,0,146.3483581543,3},
	[2] = {223.4521484375,1247.03125,1082.140625,0,0,99.419555664062,2},
	[3] = {226.8798828125,1287.2646484375,1082.140625,0,0,215.88189697266,1},
	[4] = {327.1201171875,1481.798828125,1084.4375,0,0,214.43716430664,15},
	[5] = {2454.0302734375,-1697.9609375,1013.5078125,0,0,353.1032409668,2},
	[6] = {247.9013671875,1113.1826171875,1080.9921875,0,0,229.64797973633,5},
	[7] = {373.0244140625,1472.4287109375,1080.1875,0,0,62.955383300781,15},
	[8] = {225.693359375,1039.38671875,1084.0119628906,0,0,1.2277526855469,7}, -- empty open house
	[9] = {2806.9892578125,-1165.3701171875,1025.5703125,0,0,184.9878692627,8},
	[10] = {2264.1337890625,-1211.7802734375,1049.0234375,0,0,230.01052856445,10},
	[11] = {2497.921875,-1694.5625,1014.7421875,0,0,286.62942504883,3},
	[12] = {2264.931640625,-1141.9716796875,1050.6328125,0,0,200.77546691895,10},
	[13] = {2363.7900390625,-1125.802734375,1050.875,0,0,62.592803955078,8},
	[14] = {2235.43359375,-1111.9755859375,1050.8828125,0,0,273.44564819336,5},
	[15] = {2285.943359375,-1137.703125,1050.8984375,0,0,279.10919189453,11},
	[16] = {2188.8369140625,-1200.693359375,1049.0234375,0,0,4.3094482421875,6},
	[17] = {2305.6669921875,-1211.365234375,1049.0234375,0,0,96.409240722656,6},
	[18] = {2213.77734375,-1078.28125,1050.484375,0,0,186.65231323242,1},
	[19] = {2235.8876953125,-1071.4580078125,1049.0234375,0,0,273.9235534668,2},
	[20] = {2318.365234375,-1019.263671875,1050.2109375,0,0,88.542907714844,9},
	[21] = {2331.70703125,-1070.326171875,1049.0234375,0,0,110.54885864258,6},
	[22] = {1225.36328125,-807.109375,1084.0078125,0,0,350.13137817383,5},
	[23] = {249.2001953125,302.2255859375,999.1484375,0,0,175.22088623047,1},
	[24] = {273.453125,303.62109375,999.1484375,0,0,220.41381835938,2},
	[25] = {2332.5107421875,-1148.9560546875,1050.703125,0,0,86.521392822266,12},
	[26] = {316.19921875,1119.16015625,1083.8828125,0,0,105.07760620117,5},
	[27] = {249.08203125,302.0654296875,999.1484375,0,0,228.19775390625,1},
	[28] = {134.900390625,1366.173828125,1083.8609619141,0,0,132.31860351562,5},
	[29] = {231.283203125,1068.0166015625,1084.2059326172,0,0,213.01441955566,6},
	[30] = {83.8984375,1330,1083.859375,0,0,83.461669921875,9},
	[31] = {35.0595703125,1341.7080078125,1084.375,0,0,270.81439208984,10},
	[32] = {366.021484375,1418.2568359375,1081.328125,0,0,224.41290283203,15},
	[33] = {2532.83984375,-1680.5400390625,1015.4985961914,0,0,245.07301330566,1},
}

local allHouses = {} --[int][dim]
local houseData = {}
local houseSoundPlaying={}
local houseSoundPosCurrent={}
local houseSoundLength = {}
-------------------------------------------------------------------------------
-------------------------------- DATABASE FUNCTIONS ---------------------------
-------------------------------------------------------------------------------

local bandwidthOptimizationIndexToName = {
	["1"] = "houseid",
	["2"] = "ownername",
	["3"] = "ownerid",
	["4"] = "interiorid",
	["5"] = "housesale",
	["6"] = "houseprice",
	["7"] = "housename",
	["8"] = "houselocked",
	["9"] = "boughtprice",
	["10"] = "housepassword",
	["11"] = "passwordlocked",
	["12"] = "",
	["13"] = "originalPrice",
}
local hswp = {}
function takePos(ps)
	local int = getElementInterior(ps)
	local x,y,z = getElementPosition(ps)
	local rx,ry,rz = getElementRotation(ps)
	outputChatBox('['..hswp[ps]..'] = {'..x..','..y..','..z..','..rx..','..ry..','..rz..','..int..'},',ps)
end
addCommandHandler("ipos",takePos)

function wp(ps,cmdname,interiorid)
	interiorid=tonumber(interiorid)
	local portstring = intids[tonumber(interiorid)]
			local tInt = gettok ( portstring, 1, string.byte('|') )
			local tX = gettok ( portstring, 2, string.byte('|') )
			local tY = gettok ( portstring, 3, string.byte('|') )
			local tZ = gettok ( portstring, 4, string.byte('|') )
	setElementPosition(ps,tX,tY,tZ)
	setElementInterior(ps,tInt)
	setElementDimension(ps,1)
	hswp[ps]=interiorid
end
addCommandHandler("csghswp",wp)

function onUpdateHouseData ( houseID, column1, data1, column2, data2, column3, data3 )
	if ( houseID ) then
		if bandwidthOptimizationIndexToName[column1] ~= nil then
			column1 = bandwidthOptimizationIndexToName[column1]
		end
		if bandwidthOptimizationIndexToName[column2] ~= nil then
			column2 = bandwidthOptimizationIndexToName[column2]
		end
		if bandwidthOptimizationIndexToName[column3] ~= nil then
			column3 = bandwidthOptimizationIndexToName[column3]
		end
		if ( column1 ) and ( column2 ) and ( column3 ) and ( data1 ) and ( data2 ) and ( data3 ) then
			exports.DENmysql:exec("UPDATE housing SET `??`=?, `??`=?, `??`=? WHERE id=?", column1, data1, column2, data2, column3, data3, houseID )
		elseif ( column1 ) and ( column2 ) and ( data1 ) and ( data2 ) then
			exports.DENmysql:exec("UPDATE housing SET `??`=?, `??`=? WHERE id=?", column1, data1, column2, data2, houseID )
		elseif ( column1 ) and ( data1 ) then
			exports.DENmysql:exec("UPDATE housing SET `??`=? WHERE id=?", column1, data1, houseID )
		end
	end
end

function onPlayerUpdateLabels ( thePlayer, houseID )
	local houseTable = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", tonumber(houseID) )
	triggerClientEvent ( thePlayer, "updateLabels", thePlayer, houseTable.ownerid, houseTable.interiorid, houseTable.sale, houseTable.houseprice, houseTable.housename, houseTable.locked, houseTable.boughtprice, houseTable.passwordlocked )
	return true
end

function onPlayerUpdateLabelsOnBuy ( thePlayer, houseID )
	local playersid = exports.server:getPlayerAccountID( source )
	local houseTable = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", tonumber(houseID) )
	triggerClientEvent ( thePlayer, "updateLabelsOnBuy", thePlayer, playersid, houseTable.id, exports.server:getPlayerAccountName(thePlayer), houseTable.ownerid, houseTable.interiorid, houseTable.sale, houseTable.houseprice, houseTable.housename, houseTable.locked, houseTable.boughtprice )
	return true
end

-------------------------------------------------------------------------------
------------------------------ OTHER HOUSE FUNCTIONS --------------------------
-------------------------------------------------------------------------------

-- On resource start create the houses
local secs=1000
function onHousingStart ()
	local loaded=0
	local partsT={}
	local tempT={}
	local houses = exports.DENmysql:query( "SELECT * FROM housing" )
	if ( houses and #houses > 0 ) then
		for i=1,#houses do
			--if houses[i].id == 3932 then
				createHouse( houses[i].id, houses[i].ownerid, houses[i].interiorid, houses[i].x, houses[i].y, houses[i].z, houses[i].sale, houses[i].houseprice, houses[i].housename, houses[i].locked, houses[i].boughtprice, houses[i].passwordlocked, houses[i].password,houses[i].weaponsStorage,houses[i].drugsStorage,houses[i].moneyStorage,houses[i].perms,houses[i].music,houses[i].originalPrice,houses[i].decorinv)
			--end
			if loaded<75 then
				loaded=loaded+1
				table.insert(tempT,i)
			else
				loaded=0
				table.insert(partsT,tempT)
				tempT={}
				table.insert(tempT,i)
			end
			-- Load the houses on resource start

		end
		table.insert(partsT,tempT)
		for k,v in pairs(partsT) do
			setTimer(function()
			for k2,i in pairs(v) do

					createHouse( houses[i].id, houses[i].ownerid, houses[i].interiorid, houses[i].x, houses[i].y, houses[i].z, houses[i].sale, houses[i].houseprice, houses[i].housename, houses[i].locked, houses[i].boughtprice, houses[i].passwordlocked, houses[i].password,houses[i].weaponsStorage,houses[i].drugsStorage,houses[i].moneyStorage,houses[i].perms,houses[i].music,houses[i].originalPrice,houses[i].decorinv)

			end
			end,secs,1)
			secs=secs+3000
		end
		--[[for k,v in pairs(getElementsByType("player")) do
			local dim,int = getElementDimension(v),getElementInterior(v)
			int=tonumber(int)
			if allHouses[int] == nil then return end
			if allHouses[int][dim] == nil then return end
			local theHouse = allHouses[int][dim]
			local myAccName = exports.server:getPlayerAccountName(v)
			triggerClientEvent(source,"CSGhousing.enteredHouse",v,theHouse,houseData[theHouse],myAccName)
		end--]]
	end
end
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), onHousingStart )

-- When a player hits the door warp him outside
function onHousingColHit ( thePlayer )
	local houseDimension = getElementDimension(thePlayer)
	local houseLocation = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", tonumber(houseDimension) )
	setElementInterior(thePlayer, 0, houseLocation.x, houseLocation.y, houseLocation.z)
	setElementPosition(thePlayer, houseLocation.x,houseLocation.y,houseLocation.z)
	setElementDimension(thePlayer, 0)
	triggerClientEvent(thePlayer,"CSGhousing.leftHouse",thePlayer)
end

-- Create the leaving markers
for i=1,#leavingCols do
	local x, y, z = leavingCols[i][2], leavingCols[i][3], leavingCols[i][4]
	local interior = leavingCols[i][1]
	colCircle = createColTube ( x, y, z -0.5, 1.3, 2.5 )
	setElementInterior (colCircle, interior)
	addEventHandler ( "onColShapeHit", colCircle, onHousingColHit )
end

-- Create houses
function createHouse ( houseid, ownerid, interiorid, housex, housey, housez, housesale, houseprice, housename, houselocked, boughtprice, passwordlocked, housepassword, weaponsStorage, drugsStorage, moneyStorage, perms, music, originalPrice, decorinv )
	--if houseid ~= 3932 then return end
	if houseData[_G["house"..tostring(houseid)]] ~= nil then return end
	if ( housesale == 0 ) then
		_G["house"..tostring(houseid)] = createPickup ( housex, housey, housez, 3, 1272, 0)
	else
		_G["house"..tostring(houseid)] = createPickup ( housex, housey, housez, 3, 1273, 0)
	end

	local house = _G["house"..tostring(houseid)]
	local houseOwner = exports.DENmysql:querySingle( "SELECT * FROM accounts WHERE id = ?", tonumber(ownerid) )

	if not ( houseOwner ) then
		outputServerLog( "House: " .. houseid .. " has no owner set, please check in the database!", 3 )
		return
	end
	local playerdim = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", houseid )
	playerdim=playerdim.id
	--[[
		Optimization,
		id to elementData
		1=houseid
		2=ownername
		3=ownerid
		4=interiorid
		5=housesale
		6=houseprice
		7=housename
		8=houselocked
		9=boughtprice
		10=housepassword
		11=passwordlocked
		12=aID
		13=originalPrice
	--]]
	interiorid=tonumber(interiorid)
	houseData[house] = {}
	houseData[house]["speakerpos"] = nil
	if speakerPos[interiorid] ~= nil then
		local x,y,z,rx,ry,rz = speakerPos[interiorid][1],speakerPos[interiorid][2],speakerPos[interiorid][3],speakerPos[interiorid][4],speakerPos[interiorid][5],speakerPos[interiorid][6]
		local obj = createObject(2229,x,y,z)
		setElementDimension(obj,playerdim)
		setElementInterior(obj,leavingCols[interiorid][1])
		setElementRotation(obj,rx,ry,rz)
		local t = {x,y,z}
		houseData[house]["speakerpos"] = toJSON(t)
	elseif speakerPos[interiorid] == nil then
		local x,y,z = leavingCols[interiorid][2],leavingCols[interiorid][3],leavingCols[interiorid][4]
		z=z-1
		local rx,ry,rz = 0,0,180
		local obj = createObject(2229,x,y,z)
		setElementDimension(obj,playerdim)
		setElementInterior(obj,leavingCols[interiorid][1])
		setElementRotation(obj,rx,ry,rz)
		local t = {x,y,z}
		houseData[house]["speakerpos"] = toJSON(t)
	end
	aID=leavingCols[interiorid][1]
	setElementData(house, "1", houseid)
	setElementData(house, "2", houseOwner.username)
	setElementData(house, "3",  tonumber(ownerid))
	setElementData(house, "4",  tonumber(interiorid))
	setElementData(house, "5",  tonumber(housesale))
	setElementData(house, "6", tonumber(houseprice))
	setElementData(house, "7", housename)
	setElementData(house, "8",  tonumber(houselocked))
	setElementData(house, "9",  tonumber(boughtprice))
	setElementData(house, "10",  tonumber(housepassword))
	setElementData(house, "11",  tonumber(passwordlocked))
	setElementData(house, "12",  tonumber(aID))
	setElementData(house, "13", tostring(originalPrice))
	--[[setElementData(house, "weaponsStorage", tostring(weaponsStorage))
	setElementData(house, "drugsStorage", tostring(drugsStorage))
	setElementData(house, "moneyStorage", tostring(moneyStorage))
	setElementData(house, "perms", tostring(perms))--]]
	houseData[house]["moneyStorage"] = moneyStorage
	houseData[house]["drugsStorage"] = drugsStorage
	houseData[house]["weaponsStorage"] = weaponsStorage
	houseData[house]["perms"] = perms
	houseData[house]["music"] = music
	if decorinv == nil or decorinv == "" then
		decorinv=toJSON({{1429,"TV",1}})
	end
	houseData[house]["decorinv"] = decorinv

	setElementData(house,"14",currRate,true)
	if tonumber(originalPrice) == nil or tonumber(originalPrice) == 0 then
		if tonumber(boughtprice) == 0 then
			setElementData(house,"13", tonumber(houseprice))
			onUpdateHouseData(houseid,"13",tonumber(houseprice))
		else
			setElementData(house,"13", tonumber(boughtprice))
			onUpdateHouseData(houseid,"13",tonumber(boughtprice))
		end
	end
	local moneyT = fromJSON(tostring(moneyStorage))
	if moneyT == nil then
		moneyT = {}
		houseData[house]["moneyStorage"] = toJSON(moneyT)
	end
	while (#moneyT>30) do
		table.remove(moneyT,31)
	end
	houseData[house]["moneyStorage"] = toJSON(moneyT)

	local drugsT = fromJSON(tostring(drugsStorage))
	if drugsT == nil or drugsT["Ritalin"] == nil then
		drugsT = {}
		houseData[house]["drugsStorage"] = toJSON(drugsT)
	end
	local weaponsT = fromJSON(tostring(weaponsStorage))
	if drugsT == nil or drugsT["Ritalin"] == nil or type(drugsT["Ritalin"]) ~= "number"  then
		weaponsT = {0,0,0,0,0,0}
		houseData[house]["weaponsStorage"] = toJSON(weaponsT)
	end
	local permsT = fromJSON(tostring(perms))
	if permsT == nil then
		permsT = {{"All Players","Public","",{false,false,false,false,false,false,false,false,true,true,true,false}}}
		houseData[house]["perms"] = toJSON(permsT)
	end
	for k,v in pairs(permsT) do
		if v[4][12] == nil then
			permsT[k][4][12] = false
		end
	end
	houseData[house]["perms"] = toJSON(permsT)

	local musicT = fromJSON(tostring(music))
	if musicT == nil then
		musicT = {["Playing"] = "None",["Next to You"] = {"[CSG]Priyen","http://k004.kiwi6.com/hotlink/9xfj073lp5/next_to_you-chris_brown_feat._justin_bieber_cover_megan_nicole_and_dave_days.mp3"}}
		houseData[house]["music"] = toJSON(musicT)
	end
	if allHouses[tonumber(leavingCols[interiorid][1])] == nil then
		allHouses[tonumber(leavingCols[interiorid][1])] = {}
	end
	allHouses[tonumber(leavingCols[interiorid][1])][playerdim] = house
	local t = fromJSON(houseData[house]["music"])
	if t["Playing"] ~= "None" then
		playHouseMusic(false,house)
	end
end

-- Show the housing gui
addEventHandler ( "onPickupHit", root,
function ( thePlayer )
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if not ( theVehicle ) then
		local houseElementID = getElementData(source, "1")
		local houseElement = _G["house"..tostring( houseElementID )]
		if ( source == houseElement ) then
			local playerID = exports.server:getPlayerAccountID( thePlayer )
			local houseid = getElementData(source, "1")
			local ownersid = getElementData(source, "3")
			local ownername = getElementData(source, "2")
			local interiorid = getElementData(source, "4")
			local housesale = getElementData(source, "5")
			local houseprice = getElementData(source, "6")
			local housename = getElementData(source, "7")
			local houselocked = getElementData(source, "8")
			local marketvalue = getElementData(source, "13")
			local passwordlocked = getElementData(source, "11")
			local permsT = fromJSON(houseData[source]["perms"])
			houselocked=permsT[1][4][1]
			if houselocked==true then houselocked=1 elseif houselocked==false then houselocked=0 end
			--market value
			marketvalue=math.floor((marketvalue+(marketvalue*(currRate/100)))+0.5)
			if ownersid == 0 then
				houseprice=marketvalue
				setElementData(source,"6",marketvalue)
			end
			local permsT = houseData[houseElement]["perms"]
			triggerClientEvent ( thePlayer, "showHousingGui", thePlayer, source, currRate,playerID, houseid, ownername, ownersid, interiorid, housesale, houseprice, housename, houselocked, marketvalue, passwordlocked, _,permsT )
		end
	end
end )

function doHouseRates()
	local add = 0
	local num = math.random(1,100)
	if num > 66 then
		add = 1 --math.random(1,3)
	elseif num > 33 then
		add=0
	else
		add=-1*1
	end
	currRate=currRate+add
	for k,v in pairs(houseData) do
		setElementData(k,"14",currRate,true)
	end
end
setTimer(doHouseRates,900000,0)

addCommandHandler("csghousessetrate",function(ps,_,rate)
	local rate2=tonumber(rate)
	currRate=rate2
	for k,v in pairs(houseData) do
		setElementData(k,"14",currRate,true)
	end
end)

addEvent("CSGhousing.showHouseSettings",true)
addEventHandler("CSGhousing.showHouseSettings",root,function(houseE)
		local playerID = exports.server:getPlayerAccountID( source )
		local houseid = getElementData(houseE, "1")
		local ownersid = getElementData(houseE, "3")
		local ownername = getElementData(houseE, "2")
		local interiorid = getElementData(houseE, "4")
		local housesale = getElementData(houseE, "5")
		local houseprice = getElementData(houseE, "6")
		local housename = getElementData(houseE, "7")
		local houselocked = getElementData(houseE, "8")
		local marketvalue = getElementData(houseE, "13")
		local passwordlocked = getElementData(houseE, "11")
		local permsT = fromJSON(houseData[houseE]["perms"])
		houselocked=permsT[1][4][1]
		marketvalue=math.floor((marketvalue+marketvalue*(currRate/100))+0.5)
		if houselocked==true then houselocked=1 elseif houselocked==false then houselocked=0 end
		triggerClientEvent ( source, "showHousingGui", source, houseE, currRate,playerID, houseid, ownername, ownersid, interiorid, housesale, houseprice, housename, houselocked, marketvalue, passwordlocked, true )
end)

addEvent("CSGhousing.brokeIn",true)
addEventHandler("CSGhousing.brokeIn",root,function(attempt)
	if exports.denlaw:isPlayerLawEnforcer(source) == true then return end
	local x,y,z = getElementPosition(source)
	if attempt == "Success" then
		exports.CSGwanted:addWanted(source,26,false,x,y,z)
	elseif attempt == "Fail" then
		exports.CSGwanted:addWanted(source,27,false,x,y,z)
	end
end)
-- Function when player enters the house
addEvent( "enterHouse", true )
function enterHouse (houseid, interiorid, isPassword, password,breakIn)
	local theHouse = _G["house"..tostring( houseid )]
	local ownersid = getElementData( theHouse, "3" )
	local playersid = exports.server:getPlayerAccountID( source )
	local sourceTeam = getTeamName( getPlayerTeam( source ) )
	if breakIn ~= nil then
		if breakIn == true then
			local playerdim = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", houseid)
			local portstring = intids[tonumber(interiorid)]
			local tInt = gettok ( portstring, 1, string.byte('|') )
			local tX = gettok ( portstring, 2, string.byte('|') )
			local tY = gettok ( portstring, 3, string.byte('|') )
			local tZ = gettok ( portstring, 4, string.byte('|') )

			setElementInterior(source, tInt, tX, tY, tZ)
			setElementPosition(source, tX,tY,tZ)
			setElementDimension(source, tonumber(playerdim.id))
			local myAccName = exports.server:getPlayerAccountName(source)
			triggerClientEvent(source,"CSGhousing.enteredHouse",source,theHouse,houseData[theHouse],myAccName,tonumber(interiorid))
			if houseSoundPlaying[theHouse]==true then
				playHouseMusicForP(source,false,theHouse)
			end
			return
		end
	end
	if ( isPassword ) or ( sourceTeam == "Staff" ) or ( sourceTeam == "SWAT" ) or ( sourceTeam == "Military Forces" ) then
		if ( tostring(getElementData(theHouse, "10")) == tostring(password) ) or ( sourceTeam == "Staff" ) or ( sourceTeam == "SWAT" ) or ( sourceTeam == "Military Forces" ) then
			local playerdim = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", houseid )
			local portstring = intids[tonumber(interiorid)]
			local tInt = gettok ( portstring, 1, string.byte('|') )
			local tX = gettok ( portstring, 2, string.byte('|') )
			local tY = gettok ( portstring, 3, string.byte('|') )
			local tZ = gettok ( portstring, 4, string.byte('|') )

			setElementInterior(source, tInt, tX, tY, tZ)
			setElementPosition(source, tX,tY,tZ)
			setElementDimension(source, tonumber(playerdim.id))
			local myAccName = exports.server:getPlayerAccountName(source)
			triggerClientEvent(source,"CSGhousing.enteredHouse",source,theHouse,houseData[theHouse],myAccName,tonumber(interiorid))
			local musicT = fromJSON(houseData[theHouse]["music"])
			if musicT["Playing"] ~= "None" then
				playHouseMusicForP(source,false,theHouse)
			end
		else
			outputChatBox("Wrong house password! Try again.", source, 225, 0, 0)
		end
	else
		if ( ownersid ~= playersid ) and getElementData(theHouse, "11") == 1 then
			triggerClientEvent( source, "showPasswordWindow", source )
		else
			local playerdim = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", houseid)
			local portstring = intids[tonumber(interiorid)]
			local tInt = gettok ( portstring, 1, string.byte('|') )
			local tX = gettok ( portstring, 2, string.byte('|') )
			local tY = gettok ( portstring, 3, string.byte('|') )
			local tZ = gettok ( portstring, 4, string.byte('|') )

			setElementInterior(source, tInt, tX, tY, tZ)
			setElementPosition(source, tX,tY,tZ)
			setElementDimension(source, tonumber(playerdim.id))
			local myAccName = exports.server:getPlayerAccountName(source)
			triggerClientEvent(source,"CSGhousing.enteredHouse",source,theHouse,houseData[theHouse],myAccName)
			if houseSoundPlaying[theHouse]==true then
				playHouseMusicForP(source,false,theHouse)
			end
		end
	end
end
addEventHandler( "enterHouse", root, enterHouse )

function getFormattedHouseListForPhone(p)
	local t = {}
		local id = exports.server:getPlayerAccountID(p)
		local hT = exports.DENmysql:query( "SELECT * FROM housing WHERE ownerid = ?", id)
		for k,v in pairs(hT) do
			local x,y,z = v.x,v.y,v.z
			local zoneName = getZoneName(x,y,z)
			local theHouseT = {v.id,""..(v.housename.." @ "..zoneName.."").."",false,x,y,z}
			table.insert(t,theHouseT)
		end
	return t
end

addEventHandler("onPlayerLogin",root,function()
	local p = source
	setTimer(function() local myHouseList = getFormattedHouseListForPhone(p)
	triggerClientEvent(p,"CSGphone.recHouseList",p,myHouseList) end,5000,1)
	local dim,int = getElementDimension(source),getElementInterior(source)
	int=tonumber(int)
	if allHouses[int] == nil then return end
	if allHouses[int][dim] == nil then return end
	local theHouse = allHouses[int][dim]
	local myAccName = exports.server:getPlayerAccountName(source)
	triggerClientEvent(source,"CSGhousing.enteredHouse",source,theHouse,houseData[theHouse],myAccName)

end)

-- Function for changing the password of the house
addEvent( "setHousePassword", true )
function setHousePassword ( houseid, password )
	local theHouse = _G["house"..tostring(houseid)]
	setElementData( theHouse, "10", password )
	setElementData( theHouse, "11", 1 )
	setElementData( theHouse, "8", 1 )
	onUpdateHouseData ( houseid, "locked", 1, "11", 1, "password", password )
	onPlayerUpdateLabels ( source, houseid )
	outputChatBox("New house password is set to: "..password, source, 0, 225, 0)
end
addEventHandler( "setHousePassword", root, setHousePassword )

-- Function that removes the lock from a house
addEvent( "removeHousePassword", true )
function removeHousePassword ( houseid )
	local theHouse = _G["house"..tostring(houseid)]
	if ( getElementData( theHouse, "11" ) == 1 ) then
		local theHouse = _G["house"..tostring( houseid )]
		setElementData( theHouse, "11", 0 )
		onUpdateHouseData ( houseid, "11", 0 )
		onPlayerUpdateLabels ( source, houseid )
		outputChatBox("The password is removed from your house!", source, 0, 225, 0)
	else
		outputChatBox("Your house isn't password locked!", source, 225, 0, 0)
	end
end
addEventHandler( "removeHousePassword", root, removeHousePassword )

-- Function that sets the house closed
addEvent( "toggleClosed", true )
function toggleClosed (houseid, houseinglocked)
	local theHouse = _G["house"..tostring( houseid )]
	local houseLockStatus = getElementData( theHouse, "8" )
	if ( houseLockStatus == 1 ) then
		setElementData( theHouse,"8", 0 )
		onUpdateHouseData ( houseid, "locked", 0 )
		onPlayerUpdateLabels ( source, houseid )
	else
		setElementData( theHouse,"8", 1 )
		onUpdateHouseData ( houseid, "locked", 1 )
		onPlayerUpdateLabels ( source, houseid )
	end
end
addEventHandler( "toggleClosed", root, toggleClosed )

-- Function that toggle the house his sale status
addEvent( "toggleSale", true )
function toggleSale (houseid, houseinglocked)
	local theHouse = _G["house"..tostring( houseid )]
	local houseSaleStatus = getElementData( theHouse, "5" )
	if ( houseSaleStatus == 1 ) then
		setElementData( theHouse, "5", 0 )
		setPickupType( theHouse, 3, 1272, 0 )
		onUpdateHouseData ( houseid, "sale", 0 )
		onPlayerUpdateLabels ( source, houseid )
	else
		setElementData( theHouse, "5", 1 )
		setPickupType( theHouse, 3, 1273, 0 )
		onUpdateHouseData ( houseid, "sale", 1 )
		onPlayerUpdateLabels ( source, houseid )
	end
end
addEventHandler( "toggleSale", root, toggleSale )

-- Function that toggle the sale price of the house
addEvent( "toggleSalePrice", true )
function toggleSalePrice (houseid, thePrice)
	local theHouse = _G["house"..tostring( houseid )]
	setElementData( theHouse, "6", tonumber(thePrice))
	onUpdateHouseData ( houseid, "6", tonumber(thePrice) )
	onPlayerUpdateLabels ( source, houseid )
end
addEventHandler( "toggleSalePrice", root, toggleSalePrice )



addEvent("sellToBank",true)
addEventHandler("sellToBank",root,function(houseid,marketValue)
	local theHouse = _G["house"..tostring( houseid )]
	setElementData(theHouse, "2","CSG Housing",true)
	setElementData(theHouse, "3",0,true)
	givePlayerMoney(source,math.floor((marketValue*0.75)+0.5))
	setElementData(theHouse,"6",math.floor(marketValue+0.5),true)
	setElementData(theHouse,"9",math.floor((marketValue*0.75)+0.5),true)
	setElementData(theHouse,"5",1)
	onUpdateHouseData(houseid,"ownerid",0,"boughtprice",math.floor((marketValue*0.75)+0.5),"houseprice",math.floor(marketValue+0.5))
	onUpdateHouseData(houseid,"sale",1)
	setPickupType( theHouse, 3, 1273, 0 )
	onPlayerUpdateLabels ( source, houseid )
	local myHouseList = getFormattedHouseListForPhone(source)
	triggerClientEvent(source,"CSGphone.recHouseList",source,myHouseList)
end)

-- Function for buying the house
addEvent( "buyHouse", true )
function buyHouse (houseid)
	local theHouse = _G["house"..tostring( houseid )]
	local theHousePrice = getElementData( theHouse, "6" )
	local theHouseOwnerID = getElementData( theHouse, "3" )
	local isHouseForSale = getElementData( theHouse, "5" )
	local playerMoney = getPlayerMoney( source )
	local playerID = exports.server:getPlayerAccountID( source )

	local maxHouses = getPlayerMaxHouses( source )

	local getPlayerHouses = exports.DENmysql:query( "SELECT * FROM housing WHERE ownerid = ?", playerID )
	if ( playerMoney < theHousePrice ) then
		exports.DENdxmsg:createNewDxMessage(source, "You dont have enough money for this house!", 200, 0, 0)
		triggerClientEvent ( source, "closeBuyWindow", source)
	elseif ( getPlayerHouses and #getPlayerHouses > maxHouses ) then
		exports.DENdxmsg:createNewDxMessage(source, "You can't have more then " .. maxHouses .. " houses!", 200, 0, 0)
		triggerClientEvent ( source, "closeBuyWindow", source)
	elseif ( isHouseForSale == 0 ) then
		exports.DENdxmsg:createNewDxMessage(source, "This house is already sold!", 200, 0, 0)
		triggerClientEvent ( source, "closeAllHousingWindows", source)
	else
		local theHouseOwnerBank = exports.DENmysql:querySingle( "SELECT * FROM banking WHERE userid = ?", theHouseOwnerID )
		local theHouseOwnerBalance = theHouseOwnerBank.balance
		if ( theHouseOwnerBalance ) then
			local theOwnerNewBalance = ( theHouseOwnerBalance + theHousePrice )
			local theOwnerGiveMoney = exports.DENmysql:exec( "UPDATE banking SET balance=? WHERE userid=?", theOwnerNewBalance, theHouseOwnerID )
			if ( theOwnerGiveMoney ) then
				takePlayerMoney(source, theHousePrice)
				local playerAccountName = getElementData(source, "playerAccount")
				setElementData( theHouse, "2", playerAccountName)
				setElementData( theHouse, "3", playerID)
				setElementData( theHouse, "9", theHousePrice)
				onUpdateHouseData ( houseid, "3", playerID, "9", theHousePrice, "sale", 0 )
				setElementData( theHouse,"5", 0)
				setPickupType( theHouse, 3, 1272, 0)
				triggerClientEvent ( source, "closeBuyWindow", source)
				onPlayerUpdateLabelsOnBuy ( source, houseid )
				exports.CSGlogging:createLogRow ( source, "money", getPlayerName(source).." bought a house for $" .. theHousePrice .. " (HOUSEID: " .. houseid .. ") (PREVIOUS OWNER: " .. theHouseOwnerID .. ")" )
				local transaction = exports.DENmysql:exec( "INSERT INTO banking_transactions SET userid=?, transaction=?"
                            ,tonumber(theHouseOwnerID)
                            ,"You're house was sold for $".. theHousePrice .."" .. " to ".. getPlayerName(source) ..""
                        )
				local myHouseList = getFormattedHouseListForPhone(source)
				triggerClientEvent(source,"CSGphone.recHouseList",source,myHouseList)
			end
		end
	end
end
addEventHandler( "buyHouse", root, buyHouse )

function getPlayerMaxHouses ( thePlayer )
	if ( getElementData(thePlayer, "isPlayerPremium") ) then
		return 10
	else
		return 7
	end
end

-- Create part for housing system
addEvent( "createTheNewHouse", true )
function createTheNewHouse (int, price, name)
	if ( int ) and ( price ) and ( name ) then
	local madeBy = getPlayerName(source)
	local x, y, z = getElementPosition (source)
	local makeHouse = exports.DENmysql:exec("INSERT INTO housing SET sale=?, locked=?, housename=?, x=?, y=?, z=?, interiorid=?, houseprice=?, createdBy=?"
			,1
			,1
			,name
			,x
			,y
			,z
			,int
			,price
			,madeBy
		)
		outputChatBox ("House created and putted into the database :)", source, 0, 225, 0)
		createPickup ( x, y, z, 3, 1277, 0)
	else
		outputChatBox ("Something is wrong, please check the fields!", source, 225, 225, 0)
	end
end
addEventHandler( "createTheNewHouse", root, createTheNewHouse )

--- Edit part for the housing system
function getTheHouseInfo ( houseid )
local houseinfo = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", houseid )
	if ( houseinfo ) then
		triggerClientEvent ( source, "updateEditGUI", source, houseinfo.interiorid, houseinfo.houseprice, houseinfo.housename )
	else
		outputChatBox("The ID of the house you enterd is wrong!", source, 225, 0, 0)
	end
end
addEvent( "getTheHouseInfo", true )
addEventHandler( "getTheHouseInfo", root, getTheHouseInfo )

addEvent( "doEditTheHouse", true )
function doEditTheHouse (int, price, street, houseID)
	local houseinfo = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", houseID )
	if ( houseinfo ) then
		local getHouse = _G["house"..tostring(houseID)]
		setElementData(getHouse,"4", int)
		setElementData(getHouse,"6", price)
		setElementData(getHouse,"7", street)
		local updatHouse = exports.DENmysql:exec("UPDATE housing SET houseprice=?, interiorid=?, housename=? WHERE id = ?", houseID
                ,tonumber(price)
                ,tonumber(int)
                ,street
            )
		triggerClientEvent ( source, "updateLabels", source, houseinfo.ownerid, int, houseinfo.sale, price, street, houseinfo.locked, houseinfo.boughtprice, houseinfo.boughtprice, houseinfo.passwordlocked )
		outputChatBox("Updating the house... Cleaning the house... Doing some laundry... DONE!", source, 0, 225, 0)
	else
		outputChatBox("The ID of the house you enterd is wrong!", source, 225, 0, 0)
	end
end
addEventHandler( "doEditTheHouse", root, doEditTheHouse )

-- Delete house part
function deleteHouse ( playerSource, command, houseid )
	if ( houseid ) then
		if getElementData(playerSource, "isPlayerStaff") == true then
		local checkHouse = exports.DENmysql:querySingle( "SELECT * FROM housing WHERE id = ?", houseid )
			if ( checkHouse ) then
				local deleteHouse = exports.DENmysql:exec( "DELETE FROM housing WHERE id = ?", houseid )
				local getTheHouse = _G["house"..tostring(houseid)]
				destroyElement( getTheHouse )
				outputChatBox("House Deleted!", playerSource, 0, 200, 0)
			else
				outputChatBox("The ID of the house you enterd is wrong!", playerSource, 225, 0, 0)
			end
		end
	end
end
addCommandHandler ( "deletehouse", deleteHouse )

function setDefaultStorageValues()
	local houses = exports.DENmysql:query( "SELECT * FROM housing" )
		local wepsT = {}
		for i=1,46 do wepsT[i] = 0 end
		local weaponsStorage = toJSON(wepsT)
		local drugT = fromJSON('[ { "1": 0, "8": 0, "3": 0, "2": 0, "5": 0, "4": 0, "7": 0, "6": 0 } ]')
		local drugsStorage = toJSON(drugT)
		local moneyT = {0,{}}
		local moneyStorage = toJSON(moneyT)
		local permsT = {}
		local perms = toJSON(permsT)
	for i=1,#houses do
		onUpdateHouseData(houses[i].id,"weaponsStorage",weaponsStorage,"drugsStorage",drugsStorage,"moneyStorage",moneyStorage,"perms",perms)
		--createHouse( houses[i].id, houses[i].ownerid, houses[i].interiorid, houses[i].x, houses[i].y, houses[i].z, houses[i].sale, houses[i].houseprice, houses[i].housename, houses[i].locked, houses[i].boughtprice, houses[i].passwordlocked, houses[i].password,houses[i].weaponsStorage,houses[i].drugsStorage,houses[i].moneyStorage )
	end
end
addCommandHandler("setdefstoragevalues",setDefaultStorageValues)

local ready = false
function changeEDATA(k,oldv)
	if ready == false then return end
	if k == "perms" or k == "moneyStorage" then
		local newV = getElementData(source,k)
		onUpdateHouseData(tonumber(getElementData(source,"1")),k,newV)
	end
end
addEventHandler("onElementDataChange",root,changeEDATA)

setTimer(function() ready = true end,5000,1)

function updatedAccess(p,i,v)
	if isElement(p) == false then return end
	if i == 1 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to enter their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to enter their house at [address]",0,255,0)
		end
	elseif i == 2 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to deposit money in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to deposit money in their house at [address]",0,255,0)
		end
	elseif i == 3 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to withdraw money in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to withdraw money in their house at [address]",0,255,0)
		end
	elseif i == 4 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to deposit drugs in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to deposit drugs in their house at [address]",0,255,0)
		end
	elseif i == 5 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to withdraw drugs in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to withdraw drugs in their house at [address]",0,255,0)
		end
	elseif i == 6 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to deposit weapons in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to deposit weapons in their house at [address]",0,255,0)
		end
	elseif i == 7 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to withdraw weapons in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to withdraw weapons in their house at [address]",0,255,0)
		end
	elseif i == 8 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to play music in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to play music in their house at [address]",0,255,0)
		end
	elseif i == 9 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to view money in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to view money in their house at [address]",0,255,0)
		end
	elseif i == 10 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to view drugs in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to view drugs in their house at [address]",0,255,0)
		end
	elseif i == 11 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to view weapons in their house at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to view weapons in their house at [address]",0,255,0)
		end
	elseif i == 12 then
		if v == true then
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has given you the ability to access the House Decor System at [address]",0,255,0)
		else
			exports.dendxmsg:createNewDxMessage(p,""..getPlayerName(source).." has removed your ability to access the House Decor System at [address]",0,255,0)
		end
	end
end

addEvent("CSGhousing.updatedAccess",true)
addEventHandler("CSGhousing.updatedAccess",root,updatedAccess)

addEvent("CSGhousing.moneyStorageTrans",true)
addEventHandler("CSGhousing.moneyStorageTrans",root,function(houseEDATA,am,typ)
	local user = exports.server:getPlayerAccountName(source)
	local name = getPlayerName(source)
	local moneyT = fromJSON(houseData[houseEDATA]["moneyStorage"])
	if moneyT == nil then moneyT = {} end
	if moneyT[1] == nil then moneyT[1] = 0 end
	if typ == "Deposit" then if getPlayerMoney(source) < am then exports.dendxmsg:createNewDxMessage(source,"You don't have this much money",255,0,0) return else takePlayerMoney(source,am) moneyT[1] = moneyT[1]+am end end
	if typ == "Withdraw" then if moneyT[1] < am then exports.dendxmsg:createNewDxMessage(source,"The house money storage doesn't have this much money",255,0,0) return else givePlayerMoney(source,am) moneyT[1]=moneyT[1]-am end end
	table.insert(moneyT,2,{""..user.."("..name..")",typ,"$"..am.."",exports.CSGpriyenmisc:getTimeStampYYYYMMDD()})
	houseData[houseEDATA]["moneyStorage"] = toJSON(moneyT)
	--setElementData(houseEDATA,"moneyStorage",toJSON(moneyT),true)
	syncKey(houseEDATA,"moneyStorage",houseData[houseEDATA]["moneyStorage"])
	local dim = getElementDimension(source)
	local int = getElementInterior(source)
	sync(dim,int,houseEDATA)
	if typ == "Deposit" then exports.dendxmsg:createNewDxMessage(source,"Successfully deposited $"..am.." into the house storage",0,255,0) return end
	if typ == "Withdraw" then exports.dendxmsg:createNewDxMessage(source,"Successfully withdrew $"..am.." from the house storage",0,255,0) return end
end)

addEvent("CSGhousing.weaponsTrans",true)
addEventHandler("CSGhousing.weaponsTrans",root,function(id,ammo,totalAmmoInSlot,currID,typ,val,houseE)
	local t = houseData[houseE]["weaponsStorage"]
	t=fromJSON(t)
	id=tonumber(id)
	ammo=tonumber(ammo)
	local found=false
	if typ == "Deposit" then

			for k,v in pairs(t) do
				local i=k
				if tonumber(i) == tonumber(id) then
					t[k]=t[k]+ammo
					val=toJSON(t)

					break
				end
			end
		local slot = getSlotFromWeapon(id)
		if slot ~= 1 and slot ~= 10 and slot ~= 11 then
			takeWeapon(source,id,ammo)
		else
			takeWeapon(source,id)
		end
		exports.CSGaccounts:forceWeaponSync(source)
	elseif typ == "Withdraw" then

		local found = false
		for k,v in pairs(t) do
			local i=k
			if tonumber(i) == tonumber(id) then
				if v >= ammo then
					t[k]=t[k]-ammo
					val=toJSON(t)
					found=true
					break
				else
		 			t=toJSON(t)
					syncKey(houseE,"weaponsStorage",t)
					sync(getElementDimension(source),getElementInterior(source),houseE)
					return
				end

			end

		end
		if found == false then
				t=toJSON(t)
				syncKey(houseE,"weaponsStorage",t)
				sync(getElementDimension(source),getElementInterior(source),houseE)
				return
		end
		if totalAmmoInSlot > 0 and currID ~= id then
			local currName = getWeaponNameFromID(currID)
			local newName = getWeaponNameFromID(id)
			exports.dendxmsg:createNewDxMessage(source,"You cannot withdraw "..newName.." ammo while carrying a "..currName.."",0,255,0)
			exports.dendxmsg:createNewDxMessage(source,"Deposit your "..currName.." ammo, then withdraw the "..newName.." ammo instead",0,255,0)
			return
		end
		giveWeapon(source,id,ammo)
		exports.CSGaccounts:forceWeaponSync(source)
	end
		syncKey(houseE,"weaponsStorage",val)
		sync(getElementDimension(source),getElementInterior(source),houseE)
	if typ == "Deposit" then exports.dendxmsg:createNewDxMessage(source,"Successfully deposited "..ammo.." "..getWeaponNameFromID(id).." ammo into the house storage.",0,255,0) return end
	if typ == "Withdraw" then exports.dendxmsg:createNewDxMessage(source,"Successfully withdrew "..ammo.." "..getWeaponNameFromID(id).." ammo from house storage.",0,255,0) return end

end)

addEvent("CSGhousing.drugsTrans",true)
addEventHandler("CSGhousing.drugsTrans",root,function(name,amount,typ,val,houseE)
	if typ == "Withdraw" then
		exports.CSGdrugs:giveDrug(source,name,amount)
	elseif typ == "Deposit" then
		exports.CSGdrugs:takeDrug(source,name,amount)
	end
		syncKey(houseE,"drugsStorage",val)
		sync(getElementDimension(source),getElementInterior(source),houseE)
	if typ == "Deposit" then exports.dendxmsg:createNewDxMessage(source,"Successfully deposited "..amount.." "..name.." into the house storage.",0,255,0) return end
	if typ == "Withdraw" then exports.dendxmsg:createNewDxMessage(source,"Successfully withdrew "..amount.." "..name.." from house storage.",0,255,0) return end
end)

addEvent("CSGhousing.updatedMusicTable",true)
addEventHandler("CSGhousing.updatedMusicTable",root,function(val,houseE)
	syncKey(houseE,"music",val)
	sync(getElementDimension(source),getElementInterior(source),houseE)
end)


function playHouseMusic(link,houseE)
	houseSoundPlaying[houseE]=true houseSoundPosCurrent[houseE] = 0 houseSoundLength[houseE] = 9999
	local sourceName=" - Autoplay - "
	if isElement(source) then
		if getElementType(source) == "player" then
			sourceName=getPlayerName(source)
		else
			sourceName=" - Autoplay - "
		end
	end
	if link == false then
		local musicT = fromJSON(houseData[houseE]["music"])
		local k = musicT["Playing"]
		if (musicT[k]) and (musicT[k][2]) then
			link = musicT[k][2]
		else
			link="http://k004.kiwi6.com/hotlink/9xfj073lp5/next_to_you-chris_brown_feat._justin_bieber_cover_megan_nicole_and_dave_days.mp3"
		end
	end
	local songName = fromJSON(houseData[houseE]["music"])
	songName=songName["Playing"]
	setElementData(houseE,"15",50)
	local t = fromJSON(houseData[houseE]["speakerpos"])
	local x,y,z = t[1],t[2],t[3]
	local dim = getElementData(houseE,"1")
	for k,v in pairs(getElementsByType("player")) do
		local vdim = getElementDimension(v) local vint = getElementInterior(v)
		if vdim == dim and int == int then
			triggerClientEvent(v,"CSGhousing.playSoundC",v,link,x,y,z,dim,houseSoundPosCurrent[houseE])
			exports.dendxmsg:createNewDxMessage(v,"House Music System: Song "..songName.." started by "..sourceName.."",0,255,0)
		end
	end
end
addEvent("CSGhousing.playSound",true)
addEventHandler("CSGhousing.playSound",root,playHouseMusic)

addEvent("CSGhousing.volChange",true)
addEventHandler("CSGhousing.volChange",root,function(houseE,typ)
	if typ == "up" then
		local rad = getElementData(houseE,"15")
		if rad < 300 then
			setElementData(houseE,"15",rad+10)
		end
	elseif typ == "down" then
		local rad = getElementData(houseE,"15")
		if rad > 0 then
			setElementData(houseE,"15",rad-10)
		end
	end
	local int,dim = getElementInterior(source),getElementDimension(source)
	local val = getElementData(houseE,"15")
	for k,v in pairs(getAllPlayersInIntDim(int,dim)) do
		triggerClientEvent(v,"CSGhousing.volChange",v,val)
	end
end)

function playHouseMusicForP(p,link,houseE)
	local t = fromJSON(houseData[houseE]["speakerpos"])
	local x,y,z = t[1],t[2],t[3]
	local dim = getElementData(houseE,"1")
	if link == false then
		local musicT = fromJSON(houseData[houseE]["music"])
		local k = musicT["Playing"]
		link = musicT[k][2]
	end
	triggerClientEvent(p,"CSGhousing.playSoundC",p,link,x,y,z,dim,houseSoundPosCurrent[houseE])
end

addEvent("CSGhousing.stopSound",true)
addEventHandler("CSGhousing.stopSound",root,function(houseE)
	houseSoundPlaying[houseE] = false
	local int,dim = getElementData(houseE,"aID"),getElementData(houseE,"1")
	local songName = fromJSON(houseData[houseE]["music"])
	songName=songName["Playing"]
	local sourceName = getPlayerName(source)
	for k,v in pairs(getAllPlayersInIntDim(int,dim)) do
		exports.dendxmsg:createNewDxMessage(v,"House Music System: Stopped by "..sourceName.."",0,255,0)
		triggerClientEvent(v,"CSGhousing.stopSoundC",v)
	end
end)

function manageSoundPos()
	for k,v in pairs(houseSoundPlaying) do
		if v then
			local houseE=k
			houseSoundPosCurrent[houseE]=houseSoundPosCurrent[houseE]+5
			if houseSoundLength[houseE] == 9999 or houseSoundLength[houseE] == 0 then
				local int,dim = getElementData(houseE,"aID"),getElementData(houseE,"1")
				for k,v in pairs(getAllPlayersInIntDim(int,dim)) do
					triggerClientEvent(v,"CSGhousing.sendSoundLengthUpdate",v)
				end
			end
			if houseSoundPosCurrent[houseE] > houseSoundLength[houseE] then
				houseSoundPosCurrent[houseE] = 0
				local int,dim = getElementData(houseE,"aID"),getElementData(houseE,"1")
				for k,v in pairs(getAllPlayersInIntDim(int,dim)) do
					playHouseMusicForP(v,false,houseE)
				end
			end
		end
	end
end
setTimer(manageSoundPos,5000,0)

function recSoundLengthUpdate(houseE,length)
	if length > 0 then
		houseSoundLength[houseE] = length
		--outputDebugString("rec'd sound length "..length.."")
	end
end
addEvent("recSoundLengthUpdate",true)
addEventHandler("recSoundLengthUpdate",root,recSoundLengthUpdate)

function syncKey(houseE,key,v)
	houseData[houseE][key] = v
	sync(getElementDimension(source),getElementInterior(source),houseE)
	onUpdateHouseData(tonumber(getElementData(houseE,"1")),key,v)
end
addEvent("CSGhousing.syncTableKey",true)
addEventHandler("CSGhousing.syncTableKey",root,syncKey)

function sync(dim,int,house)
	for k,v in pairs(getAllPlayersInIntDim(int,dim)) do
		triggerClientEvent(v,"CSGhousing.sync",v,house,houseData[house])
	end
end

function getAllPlayersInIntDim(int,dim)
	local t = {}
	for k,v in pairs(getElementsByType("player")) do
		local vdim = getElementDimension(v) local vint = getElementInterior(v)
		if vdim == dim and int == int then
			table.insert(t,v)
		end
	end
	return t
end

setTimer(function()
for k,v in pairs(getElementsByType("player")) do
	local myHouseList = getFormattedHouseListForPhone(v)
	triggerClientEvent(v,"CSGphone.recHouseList",v,myHouseList)
end
end,10000,1)

---HOUSE INV STUFF
addEvent("CSGhousing.hitInv",true)
addEventHandler("CSGhousing.hitInv",root,function(e)

end)

addEvent("destroyObjHS", true)
function destroyObj()
	if isElement(source) then
		destroyElement(source)
	end
end
addEventHandler("destroyObjHS", root, destroyObj)

colShapes={}
objectsTable={}
function createBarrier (id)
	if getElementData(source, "HS:hasObj") ~= true then
		unbindKey(source,"mouse2")
		local obj = createObject(id, 0, 0, 0, 0, 0, 0)
		setElementCollisionsEnabled(obj, false)
		objectsTable[#objectsTable+1] = {source, obj}
		triggerClientEvent("toggleEffectsHS",source)
		setElementDimension(obj,getElementDimension(source))
		setElementInterior(obj,getElementInterior(source))
			attachElements(obj, source, 0,1,0,0,0,180)
			local ssize = 1
			bindKey(source, "mouse2", "down", dropObj, obj, ssize)
			setElementData(source, "HS:hasObj", true)
	end
end
addEvent("spawnObjHS",true)
addEventHandler("spawnObjHS",root, createBarrier)

function dropObj (player, key, keyState, objToDelete, size)
	unbindKey(player,"mouse2")
	local px, py, pz = getElementPosition(player)
	local rX, rY, rZ = getElementRotation(player)
	if isElement(objToDelete) then
		detachElements(objToDelete)
		id = getElementModel(objToDelete)
		destroyElement(objToDelete)
	end
	local obj = createObject(id, px , py , pz, rX , rY , rZ)
	setElementDimension(obj,getElementDimension(player))
	setElementInterior(obj,getElementInterior(player))
	if isElement(obj) == false then return end
	local pivot = createObject(id, px, py , pz-100, rX , rY , rZ)
	setElementDimension(pivot,getElementDimension(player))
		setElementInterior(pivot,getElementInterior(player))
	id = nil
	triggerClientEvent("toggleEffectsHS",player)
	setElementCollisionsEnabled(pivot, false)
	setElementAlpha(pivot, 0)
	triggerUnbreakable (obj, player)
	local col = createColSphere( 0, 0, 0, size )
	setElementDimension(col,getElementDimension(player))
		setElementInterior(col,getElementInterior(player))

	if id == 2892 then
		attachElements(col, obj, 0,0,1)
	else
		attachElements(col, obj, 0,0,0)
	end
	for k,v in pairs(getElementsByType("player")) do
		triggerClientEvent(v,"addColHandlersHS", col)
	end
	attachElements(obj, pivot, 0,0,100)
	colShapes[#colShapes+1] = {col, obj, pivot}
	setElementData(player, "HS:hasObj", false, true)
end

function stingerPlant( thePlayer )
	setPedAnimation( thePlayer, "BOMBER", "BOM_plant", 3000, false, false, false )
	setTimer( setPedAnimation, 2000, 1, thePlayer )
end

function triggerUnbreakable (object)
	for i,thePlayer in ipairs( getElementsByType("player") ) do
		if ( exports.server:getPlayerAccountID(thePlayer) ) then
			triggerClientEvent(thePlayer,"setBarriersUnBreakableHS", thePlayer, object )
		end
	end
end

addEventHandler("onPlayerLogin",root,function()
	for k,v in pairs(colShapes) do
		if v ~= nil then
			if isElement(v[1]) == true then
				triggerClientEvent(source,"addColHandlersHS",v[1])
			end
		end
	end
end)

addEvent("onBarrierGetDestroyedHS", true)
function onBarrierGetDestroyed()
	for i=1, #colShapes do
		if colShapes[i][1] == source then
			if isElement(colShapes[i][1]) and isElement(colShapes[i][2]) and isElement(colShapes[i][3]) then
				destroyElement(colShapes[i][1])
				destroyElement(colShapes[i][2])
				destroyElement(colShapes[i][3])
			end
		end
	end
end
addEventHandler("onBarrierGetDestroyedHS", root, onBarrierGetDestroyed)

addEvent("HSobjClickCheck",true)
function HSobjClickCheck(e)
	local found = false
	for k,v in pairs(colShapes) do
		if v[2] == e then
			found=true
			break
		end
	end
	triggerClientEvent(source,"HSobjClickCheckRec",source,found)
end
addEventHandler("HSobjClickCheck",root,HSobjClickCheck)
