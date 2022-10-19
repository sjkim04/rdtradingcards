local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !catch")
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json", defaultjson)
  local lang = dpf.loadjson("langs/" .. uj.lang .. "/catch.json", "")

  if not message.guild then
    message.channel:send(lang.dm_message)
    return
  end

  if not (#mt == 1) then
    message.channel:send(lang.no_arguments)
    return
  end

  local tj = dpf.loadjson("savedata/thrown.json", {})

  local cardfilename, consfilename = texttofn(mt[1]), constexttofn(mt[1])
  local curfilename = cardfilename or consfilename
  print(curfilename)

  if not curfilename then
    if nopeeking then
      message.channel:send(formatstring(lang.nopeeking), {mt[1]})
    else
      message.channel:send(formatstring(lang.nodatabase, {mt[1]}))
    end
    return
  end

  local caughtname = cardfilename and cdb[cardfilename].name or consdb[consfilename].name

  if not (tj[curfilename]) then
    print("user doesnt have item")
    if nopeeking then
      message.channel:send(formatstring(lang.nopeeking, {mt[1]}))
    else
      message.channel:send(formatstring(lang.notthrown, {caughtname}))
    end
    return
  end

  if cardfilename then
    uj.inventory[cardfilename] = uj.inventory[cardfilename] and uj.inventory[cardfilename] + 1 or 1
  else
    uj.consumables[consfilename] = uj.consumables[consfilename] and uj.consumables[consfilename] + 1 or 1
  end
  uj.timescaught = uj.timescaught and uj.timescaught + 1 or 1
  client:emit(tj[curfilename][1])
  table.remove(tj[curfilename], 1)
  if not next(tj[curfilename]) then tj[curfilename] = nil end

  dpf.savejson("savedata/" .. message.author.id .. ".json",uj)
  dpf.savejson("savedata/thrown.json", tj)

  local item = cardfilename and "card" or "item"
  if item == "card" then
    message.channel:send(formatstring(lang.caught_card, {message.author.mentionString, caughtname, uj.pronouns["their"]}))
  else
    message.channel:send(formatstring(lang.caught_item, {message.author.mentionString, caughtname, uj.pronouns["their"]}))
  end
  if not uj.togglecheckcard then
    if not uj.storage[cardfilename] then
      message.channel:send(formatstring(lang.not_in_storage, {caughtname}))
    end
  end
end
return command
