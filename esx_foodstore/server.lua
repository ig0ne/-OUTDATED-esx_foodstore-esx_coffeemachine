--<-.(`-')               _                         <-. (`-')_  (`-')  _                          (`-')              _           (`-') (`-')  _ _(`-')    (`-')  _      (`-')
-- __( OO)      .->     (_)        .->                \( OO) ) ( OO).-/    <-.          .->   <-.(OO )     <-.     (_)         _(OO ) ( OO).-/( (OO ).-> ( OO).-/     _(OO )
--'-'---.\  ,--.'  ,-.  ,-(`-') ,---(`-')  .----.  ,--./ ,--/ (,------. (`-')-----.(`-')----. ,------,) (`-')-----.,-(`-'),--.(_/,-.\(,------. \    .'_ (,------.,--.(_/,-.\
--| .-. (/ (`-')'.'  /  | ( OO)'  .-(OO ) /  ..  \ |   \ |  |  |  .---' (OO|(_\---'( OO).-.  '|   /`. ' (OO|(_\---'| ( OO)\   \ / (_/ |  .---' '`'-..__) |  .---'\   \ / (_/
--| '-' `.)(OO \    /   |  |  )|  | .-, \|  /  \  .|  . '|  |)(|  '--.   / |  '--. ( _) | |  ||  |_.' |  / |  '--. |  |  ) \   /   / (|  '--.  |  |  ' |(|  '--.  \   /   / 
--| /`'.  | |  /   /)  (|  |_/ |  | '.(_/'  \  /  '|  |\    |  |  .--'   \_)  .--'  \|  |)|  ||  .   .'  \_)  .--'(|  |_/ _ \     /_) |  .--'  |  |  / : |  .--' _ \     /_)
--| '--'  / `-/   /`    |  |'->|  '-'  |  \  `'  / |  | \   |  |  `---.   `|  |_)    '  '-'  '|  |\  \    `|  |_)  |  |'->\-'\   /    |  `---. |  '-'  / |  `---.\-'\   /   
--`------'    `--'      `--'    `-----'    `---''  `--'  `--'  `------'    `--'       `-----' `--' '--'    `--'    `--'       `-'     `------' `------'  `------'    `-'    
require "resources/[essential]/es_extended/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "dev", "dev12")

RegisterServerEvent("cocasee")
AddEventHandler("cocasee", function()
	local _source = source
	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)
		if (tonumber(xPlayer.player.money) >= 85) then
		TriggerClientEvent("Cocat", source)
		xPlayer:removeMoney(85)
		xPlayer:addInventoryItem('cola', 1)
		TriggerClientEvent('esx:showNotification', _source, 'Canette de cola ~g~+1 !\n')
		else
		TriggerClientEvent('esx:showNotification', _source, '~r~Tu n\'as pas suffisamment d\'argent !\n')
		end
	end)
end)

RegisterServerEvent("eaus")
AddEventHandler("eaus", function()
	local _source = source
	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)
		if (tonumber(xPlayer.player.money) >= 100) then
		TriggerClientEvent("eau", source)
		xPlayer:removeMoney(100)
		xPlayer:addInventoryItem('water', 1)
		TriggerClientEvent('esx:showNotification', _source, 'Bouteille d\'eau ~g~+1 !\n')
		else
		TriggerClientEvent('esx:showNotification', _source, '~r~Tu n\'as pas suffisamment d\'argent !\n')
		end
	end)
end)

RegisterServerEvent("Sandwichs")
AddEventHandler("Sandwichs", function()
	local _source = source
	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)
		if (tonumber(xPlayer.player.money) >= 100) then
		TriggerClientEvent("Sandwich", source)
		xPlayer:removeMoney(100)
		xPlayer:addInventoryItem('sandwich', 1)
		TriggerClientEvent('esx:showNotification', _source, 'Sandwich ~g~+1 !\n')
		else
		TriggerClientEvent('esx:showNotification', _source, '~r~Tu n\'as pas suffisamment d\'argent !\n')
		end
	end)
end)

RegisterServerEvent("Pains")
AddEventHandler("Pains", function()
	local _source = source
	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)
		if (tonumber(xPlayer.player.money) >= 85) then
		TriggerClientEvent("Pain", source)
		xPlayer:removeMoney(85)
		xPlayer:addInventoryItem('bread', 1)
		TriggerClientEvent('esx:showNotification', _source, 'Miche de pain ~g~+1 !\n')
		else
		TriggerClientEvent('esx:showNotification', _source, '~r~Tu n\'as pas suffisamment d\'argent !\n')
		end
	end)
end)

