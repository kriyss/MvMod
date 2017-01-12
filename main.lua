local MvMod = RegisterMod("MvMod", 1);
local Tequito = Isaac.GetItemIdByName("Tequito");

local count = 0
local damageUp = 0.4
local upMax = 5
local done = false

function MvMod:UseTequito()
    local player = Isaac.GetPlayer(0)
    if done then 
        player.Damage = player.Damage - (damageUp * upMax)
        Isaac.Spawn( EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_LEMON_PARTY, 0, player.Position, Vector( 0.0, 0.0 ), player );
        player:RemoveCollectible(Tequito)
        player:AnimateSad()
        count = 0
        done = false
        return 
    end 
    
    player.Damage = player.Damage + damageUp
    count = count + 1
    

    if count >= upMax then 
        player:AnimateHappy()
        done = true 

    end
end

MvMod:AddCallback(ModCallbacks.MC_USE_ITEM, MvMod.UseTequito, Tequito);	
