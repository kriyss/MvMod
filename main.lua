local MvMod = RegisterMod("MvMod", 1);
local Tequito = Isaac.GetItemIdByName("Tequito");

local count = 0
local done = false

function MvMod:UseTequito()
    local player = Isaac.GetPlayer(0)
    if done then 
        player:RemoveCollectible(Tequito)
        player:AnimateSad()
        return 
    end 
    
    player.Damage = player.Damage + 1
    player.FireDelay = player.FireDelay + 1
    count = count + 1

    if count >= 5 then 
        player:AnimateHappy()
        done = true 
    end
end

MvMod:AddCallback(ModCallbacks.MC_USE_ITEM, MvMod.UseTequito, Tequito);	
