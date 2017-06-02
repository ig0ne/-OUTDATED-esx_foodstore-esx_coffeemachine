# esx_foodstore-esx_coffeemachine
FiveM esx_foodstore &amp; esx_coffeemachine

# FR
**Requiert:**
 * Essentialmode 2.X
 * es_extended

**Installation:**
 * Copier les dossier "esx_foodstore" et "esx_coffeemachine" dans cfx-server/ressources ou cfx-server/ressources/[esx]
 * Ajouter "esx_foodstore" et "esx_coffeemachine" à votre .yml
 * Importer food.sql dans votre base de données
 
 **Modifications:**
 Fonctionne de la même manière pour "esx_foodstore" que pour "esx_coffeemachine"
  * Pour créer un nouvel objet, dans client.lua ou clientcoffee.lua:
```lua
function NomObjet()
    TriggerServerEvent("NomObjet_Server")
    Menu.hidden = false
end

RegisterNetEvent("NomObjet")
AddEventHandler("NomObjet",  function()
    Menu.hidden = false  
end)
```
 * Ajouter l'objet au menu, toujours dans client.lua ou clientcoffee.lua:
```lua
   Menu.addButton("NomObjet (PRIX$)", "NomObjet", nil)
```
 * Déclarer l'objet dans le serveur et l'ajouter au joueur, dans server.lua ou servercoffee.lua
```lua
RegisterServerEvent("NomObjet_Server")
AddEventHandler("NomObjet_Server", function()
	local _source = source
	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)
		if (tonumber(xPlayer.player.money) >= 100) then
		TriggerClientEvent("NomObjet", source)
		xPlayer:removeMoney(100)
		xPlayer:addInventoryItem('itemName', 1)
		TriggerClientEvent('esx:showNotification', _source, 'NomObjet ~g~+1 !\n')
		else
		TriggerClientEvent('esx:showNotification', _source, '~r~Tu n\'as pas suffisamment d\'argent !\n')
		end
	end)
end)
```
 * Pour changer le prix d'un objet:
 * Dans client.lua ou clientcoffee.lua modifier le chiffre entre parenthèse:
```lua
function Main()
    options.menu_subtitle = "Magasin             Page 1 sur 1"
    ClearMenu()
    Menu.addButton("Miche de pain (85$)", "bread", nil)
    Menu.addButton("Sandwich (100$)", "Sandwich", nil)
	  Menu.addButton("Bouteille d'eau (100$)", "eau", nil)
	  Menu.addButton("Canette de cola (85$)", "cocase", nil)
end
```
 * Dans server.lua ou servercoffee.lua modifier les lignes suivantes pour chaques objets:
```lua  
if (tonumber(xPlayer.player.money) >= 100) then
```
et
```lua  
xPlayer:removeMoney(100)
```

**Lien du script original:**
https://github.com/Bookishi/bk_store
