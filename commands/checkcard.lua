local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !checkcard")
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json",defaultjson)
  local lang = dpf.loadjson("langs/" .. uj.lang .. "/checkcard.json","")
  uj.checkcard = not uj.checkcard
  if uj.checkcard then
    message.channel:send(lang.disabled_message)
  else
    message.channel:send(lang.enabled_message)
  end
  dpf.savejson("savedata/" .. message.author.id .. ".json",uj)
end
return command
  