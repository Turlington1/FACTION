--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("Dog");

FACTION.whitelist = true;
FACTION.useFullName = true;
FACTION.material = "halfliferp/factions/dog";
FACTION.models = {
	female = {
		"models/fallout/dogvicious.mdl",
		"models/fallout/mongrel.mdl",
		"models/fallout/dogmeat.mdl",
		"models/fallout/coyote.mdl"
	},
	male = {
		"models/fallout/dogvicious.mdl",
		"models/fallout/mongrel.mdl",
		"models/fallout/dogmeat.mdl",
		"models/fallout/coyote.mdl"

	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (Schema:PlayerIsCombine(player)) then
		if (name) then
			local models = self.models[ string.lower( player:QueryCharacter("gender") ) ];

			if (models) then
				player:SetCharacterData("model", models[ math.random(#models) ], true);

				Clockwork.player:SetName(player, name, true);
			end;
		else
			return false, "You need to specify a name as the third argument!";
		end;
	end;
end;

FACTION_DOG = FACTION:Register();
