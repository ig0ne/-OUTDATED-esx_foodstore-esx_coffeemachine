--<-.(`-')               _                         <-. (`-')_  (`-')  _                          (`-')              _           (`-') (`-')  _ _(`-')    (`-')  _      (`-')
-- __( OO)      .->     (_)        .->                \( OO) ) ( OO).-/    <-.          .->   <-.(OO )     <-.     (_)         _(OO ) ( OO).-/( (OO ).-> ( OO).-/     _(OO )
--'-'---.\  ,--.'  ,-.  ,-(`-') ,---(`-')  .----.  ,--./ ,--/ (,------. (`-')-----.(`-')----. ,------,) (`-')-----.,-(`-'),--.(_/,-.\(,------. \    .'_ (,------.,--.(_/,-.\
--| .-. (/ (`-')'.'  /  | ( OO)'  .-(OO ) /  ..  \ |   \ |  |  |  .---' (OO|(_\---'( OO).-.  '|   /`. ' (OO|(_\---'| ( OO)\   \ / (_/ |  .---' '`'-..__) |  .---'\   \ / (_/
--| '-' `.)(OO \    /   |  |  )|  | .-, \|  /  \  .|  . '|  |)(|  '--.   / |  '--. ( _) | |  ||  |_.' |  / |  '--. |  |  ) \   /   / (|  '--.  |  |  ' |(|  '--.  \   /   / 
--| /`'.  | |  /   /)  (|  |_/ |  | '.(_/'  \  /  '|  |\    |  |  .--'   \_)  .--'  \|  |)|  ||  .   .'  \_)  .--'(|  |_/ _ \     /_) |  .--'  |  |  / : |  .--' _ \     /_)
--| '--'  / `-/   /`    |  |'->|  '-'  |  \  `'  / |  | \   |  |  `---.   `|  |_)    '  '-'  '|  |\  \    `|  |_)  |  |'->\-'\   /    |  `---. |  '-'  / |  `---.\-'\   /   
--`------'    `--'      `--'    `-----'    `---''  `--'  `--'  `------'    `--'       `-----' `--' '--'    `--'    `--'       `-'     `------' `------'  `------'    `-'    
local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Machine à café",
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
    --options.menu_subtitle = "           "
    ClearMenu()
    Menu.addButton("                 Café (50$)", "Coffee", nil)
end

------------------------------
--FONCTIONS
-------------------------------
local twentyfourseven_shops = {
  { ['x'] = 436.144, ['y'] = -985.824, ['z'] = 30.6896 },
  { ['x'] = -45.4649, ['y'] = -1754.41, ['z'] = 29.421 },
  { ['x'] = 24.5889, ['y'] = -1342.32, ['z'] = 29.497 },
  { ['x'] = -707.394, ['y'] = -910.114, ['z'] = 19.2156 },
  { ['x'] = 1162.87, ['y'] = -319.218, ['z'] = 69.2051 },
  { ['x'] = 373.872, ['y'] = 331.028, ['z'] = 103.566 },
  { ['x'] = 2552.47, ['y'] = 381.031, ['z'] = 108.623 },
  { ['x'] = -1823.67, ['y'] = 796.291, ['z'] = 138.126 },
  { ['x'] = 2673.91, ['y'] = 3281.77, ['z'] = 55.2411 },
  { ['x'] = 1957.64, ['y'] = 3744.29, ['z'] = 32.3438 },
  { ['x'] = 1701.97, ['y'] = 4921.81, ['z'] = 42.0637 },
  { ['x'] = 1730.06, ['y'] = 6419.63, ['z'] = 35.0372 },
}

function Coffee()
    TriggerServerEvent("Coffee_Server")
	Menu.hidden = false
end

RegisterNetEvent("Coffee")
AddEventHandler("Coffee",  function()
	Menu.hidden = false  
end)

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
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 2.0)then
					DisplayHelpText("Appuyer sur ~INPUT_VEH_EXIT~ pour ~g~acheter un café.")
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
