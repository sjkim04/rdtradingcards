local command = {}
function command.run(message, mt)
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json",defaultjson)
  if uj.lang == "ko" then
      local pingmessage = {"핑!", "퐁!", "팽!", "핀!"}
	  local cping = math.random(1, #pingmessage)
	  message.channel:send(pingmessage[cping])
  else
      message.channel:send(trf('ping'))
  end
  print(message.author.name .. " did !ping")
end
return command
  