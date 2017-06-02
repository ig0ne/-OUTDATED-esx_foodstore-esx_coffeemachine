local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Magasin",
    menu_subtitle = "Categories",
    color_r = 30,
    color_g = 144,
    color_b = 255,
}

RegisterNetEvent("mp:firstspawn")
AddEventHandler("mp:firstspawn",function()
	Main() -- Menu to draw
    Menu.hidden = not Menu.hidden -- Hide/Show the menu
    Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
end)

function changemodel(model)
	
	local modelhashed = GetHashKey(model)

	RequestModel(modelhashed)
	while not HasModelLoaded(modelhashed) do 
	    RequestModel(modelhashed)
	    Citizen.Wait(0)
	end

	SetPlayerModel(PlayerId(), modelhashed)
	local a = "" -- nil doesnt work
	SetPedRandomComponentVariation(GetPlayerPed(-1), true)
	SetModelAsNoLongerNeeded(modelhashed)
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function Main()
    options.menu_subtitle = "Magasin             Page 1 sur 1"
    ClearMenu()
    Menu.addButton("Miche de pain (85$)", "bread", nil)
    Menu.addButton("Sandwich (100$)", "Sandwich", nil)
	Menu.addButton("Bouteille d'eau (100$)", "eau", nil)
	Menu.addButton("Canette de cola (85$)", "cocase", nil)
end

------------------------------
--FONCTIONS
-------------------------------
local twentyfourseven_shops = {
	{ ['x'] = 1961.1140136719,	 ['y'] = 3741.4494628906,	 ['z'] = 32.34375 },
	{ ['x'] = 1392.4129638672,	 ['y'] = 3604.47265625,		 ['z'] = 34.980926513672 },
	{ ['x'] = 546.98962402344,	 ['y'] = 2670.3176269531,	 ['z'] = 42.156539916992 },
	{ ['x'] = 2556.2534179688,	 ['y'] = 382.876953125,		 ['z'] = 108.62294769287 },
	{ ['x'] = -1821.9542236328,	 ['y'] = 792.40191650391,	 ['z'] = 138.13920593262 },
	{ ['x'] = 128.1410369873,	 ['y'] = -1286.1120605469,	 ['z'] = 29.281036376953 },
	{ ['x'] = -1223.6690673828,	 ['y'] = -906.67517089844,	 ['z'] = 12.326356887817 },
	{ ['x'] = -708.19256591797,	 ['y'] = -914.65264892578,	 ['z'] = 19.215591430664 },
	{ ['x'] = 26.419162750244,	 ['y'] = -1347.5804443359,	 ['z'] = 29.497024536133 },
	{ ['x'] = 1135.67,			 ['y'] = -982.177,			 ['z'] = 46.4158 },
	{ ['x'] = -47.124,			 ['y'] = -1756.52,			 ['z'] = 29.421 },
	{ ['x'] = -1487.48,			 ['y'] = -378.918,			 ['z'] = 40.1634},
	{ ['x'] = 374.208,			 ['y'] = 328.134,			 ['z'] = 103.566 },
	{ ['x'] = 2676.99,			 ['y'] = 3281.37,			 ['z'] = 55.2412 },
	{ ['x'] = -2967.86,			 ['y'] = 391.037,			 ['z'] = 15.0433 },
}

Citizen.CreateThread(function()
	for k,v in ipairs(twentyfourseven_shops)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 52)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Magasin")
		EndTextCommandSetBlipName(blip)
	end
end)

RegisterNetEvent("Sandwich")
AddEventHandler("Sandwich", function()
	Menu.hidden = false  
end)

function Sandwich()
    TriggerServerEvent("Sandwichs")
	Menu.hidden = false
end

RegisterNetEvent("Pain")
AddEventHandler("Pain", function()
	Menu.hidden = false  
end)

function bread()
    TriggerServerEvent("Pains")
	Menu.hidden = false
end

RegisterNetEvent("eau")
AddEventHandler("eau", function()
	Menu.hidden = false  
end)

function eau()
    TriggerServerEvent("eaus")
	Menu.hidden = false
end

RegisterNetEvent("Cocat")
AddEventHandler("Cocat", function()
	Menu.hidden = false  
end)

function cocase()
    TriggerServerEvent("cocasee")
	Menu.hidden = false
end


-------------------------
---INVENTAIRE
-------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Press F2 to open menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(twentyfourseven_shops) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
				DrawMarker(1, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 0, 25, 165, 165, 0,0, 0,0)
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 2.0)then
					DisplayHelpText("Appuyer sur ~INPUT_VEH_EXIT~ pour ~g~Acheter.")
					if IsControlJustPressed(1, 23) then
                        Main()
                        Menu.hidden = not Menu.hidden
				    end
                  Menu.renderGUI(options)
                end
            end
		end
	end
end)
