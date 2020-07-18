minetest.register_privilege("willadmin", {
    description = "Privilege required to use admin tools.",
    give_to_singleplayer = false
})

minetest.register_craftitem("willadmin:kickstick", {
    description = "Kick Stick - click on the bad player.",
    inventory_image = "kickstick.png"
})

minetest.register_craftitem("willadmin:banhammer", {
    description = "Ban Hammer - click on the bad player. (take care!)",
    inventory_image = "banhammer.png"
})

minetest.register_craftitem("willadmin:jailtool", {
    description = "Jail Tool - click on the bad player.",
    inventory_image = "jailtool.png"
})

minetest.register_on_punchplayer(function(player, hitter)
	local hitter_name = hitter:get_player_name()
	local punched_name = player:get_player_name()
	local hitter_privs = minetest.get_player_privs(hitter_name)
	local hitter_item = hitter:get_wielded_item():get_name()
	print(hitter_item)
	if hitter_privs.kick == true and hitter_item == "willadmin:kickstick" then
		minetest.kick_player(punched_name)
		return true
	elseif hitter_privs.ban == true and hitter_item == "willadmin:banhammer" then
		xban.ban_player(punched_name)
		return true
	elseif hitter_privs.jail == true and hitter_item == "willadmin:jailtool" then
		jail.jail(punched_name)
		return true
	end
end)