latestChaos = ""
timepassed = 0

timeToChaos = 300

script.on_event(defines.events.on_tick, function(event)
    local player = game.get_player(1)

    timepassed = timepassed + 1

    --Select random effects
    if timepassed >= timeToChaos  then
        timepassed = 0
		runRandomFunction()

        player.print(latestChaos)
    end
end)



function openMap()
    local player = game.get_player(1)

    player.open_map({0,0})
end

function closeMap()
    local player = game.get_player(1)

    player.close_map()
end



--EFFECT LIST
--Function name, effect text, time (0 for once)
effects =
{
	{openMap, "Map Opened"},
    {closeMap, "Map Closed"},
}

function runRandomFunction ()
	--Get random effect
	local randomNumber = math.ceil(math.random(#effects))
	local effect = effects[randomNumber]

	--Prevent previous effect from running again
	if(effect[2] == latestChaos) then
		runRandomFunction()
		return
	end

	--Run effect
    local func = effect[1]
	if(func) then
		func()
		--Set text to effect text
		latestChaos = effect[2]
    else
        latestChaos = "error"
    end
end