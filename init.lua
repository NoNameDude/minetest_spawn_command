minetest.register_chatcommand("spawn", {
	description = "Teleport to spawn",
	privs = {interact=true},
	func = function(name, param)
	local player = minetest.get_player_by_name(name)
	local spawn = minetest.setting_get_pos("static_spawnpoint")
	
	if not player then
		return	
	end
	
	player:setpos(spawn)
	end
})
	
	
minetest.register_chatcommand("set_spawn", {
	description = "Set Spawnpoint",
	privs = {server=true},
	func = function(name, param)
	local player = minetest.get_player_by_name(name)
	local pos = player:getpos()
	local x = pos.x
	local y = pos.y
	local z = pos.z
	local spawn_pos = x..","..y..","..z
	
		if not player then
			return
			
		elseif player then
			minetest.setting_set("static_spawnpoint", spawn_pos)
			minetest.chat_send_player(name, "Spawnpoint has been set to "..x..", "..y..", "..z.."")
        end
	end
})
	