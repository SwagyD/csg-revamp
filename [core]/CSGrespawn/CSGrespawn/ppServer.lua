
local hos = {
	--{x,y,z,name,rot,ax,ay,az,arot,cx,cy,cz}
	{-1514.71, 2528.21, 55.72,"EL QUEBRADOS Medical Center",3, -1490.33, 2565.89, 55.83,137,-1488.94, 2567.31, 74.57,1500},
	{1178.24, -1324.42, 14.11,"All Saints General Hospital",270.81, 1192.27, -1292.83, 13.38,178,1218.27, -1324.49, 33.43,1500},
	{1607.34, 1818.58, 10.82,"Las Venturas General Hospital",1,1657.8, 1832.15, 10.85,91,1627.52, 1863.75, 27,2000},
	{1244.51, 332.75, 19.55,"Crippen Hospital",335,1289.33, 320.76, 19.4,66,1260.37, 356.91, 35.94,2000},
	{-316.64, 1055.68, 19.74,"Fort Carson Hospital",206,-277.39, 1059.74, 19.59,91, -307.92, 1080.05, 35.59,1500},
	{2027.51, -1420.98, 16.99,"Jefferson County General Hospital",131,1985.51, -1444.65, 13.39,269, 1989.62, -1461.12, 40.18,2000},
	{-2191.13, -2302.95, 30.62,"Angel Pine Medical center",6,-2147.91, -2317.92, 30.46,65.5, -2171.06, -2279.11, 47.87,1500},
	{-2649.67, 633.34, 14.45,"San Fierro Medical Center",181,-2708.49, 606.55, 14.45,299, -2662.16, 591.62, 24.35,1500},
	{ 827.826171875,-2505.640625,12.937484741211,"CSG Federal Prison Medical Center",269,_,_,_,_,884,-2490,39}
}

pendingCustomRespawns = {}

addEvent("rs.spawnSequence",true)
addEventHandler("rs.spawnSequence",root,function(p,i,fees)

	setTimer(function()
		local skin = getElementModel(p)
		spawnPlayer(p,hos[i][1],hos[i][2],hos[i][3],hos[i][5])
		takePlayerMoney(p,fees)
		setElementModel(p,skin)
		exports.dendxmsg:createNewDxMessage(p,"Immediate medical assistance provided. Total Fees $"..fees..".",0,255,0)
		local t = fromJSON(exports.CSGaccounts:getPlayerWeaponString(p))
		for k,v in pairs(t) do
			giveWeapon(p,k,v)
		end
		if pendingCustomRespawns[p] ~= nil then
			setElementPosition(p,pendingCustomRespawns[p][1],pendingCustomRespawns[p][2],pendingCustomRespawns[p][3])
			local msg = pendingCustomRespawns[p][5]
			setPedRotation(p,pendingCustomRespawns[p][4])
			pendingCustomRespawns[p] = nil
			exports.dendxmsg:createNewDxMessage(p,msg,0,255,0)
		end
	end,12000,1)
end)


addEvent("spawnTurfingPlayer",true)
addEventHandler("spawnTurfingPlayer",root,function(x,y,z,rot)
	pendingCustomRespawns[source]={x,y,z+3,rot,"You have been taken to the nearest turf of your group, "..getElementData(source,"Group").."!"}
end)

addEvent("spawnLawPlayer",true)
addEventHandler("spawnLawPlayer",root,function(x,y,z,rot,msg)
	pendingCustomRespawns[source]={x,y,z,rot,msg}
end)

addEvent("cancelCustomSpawn",true)
addEventHandler("cancelCustomSpawn",root,function()
	pendingCustomRespawns[source]=nil
end)
