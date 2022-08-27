local command = {}
function command.run(message, mt)
local time = sw:getTime()
  print(message.author.name .. " did !rob")
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json", defaultjson)
  local sj = dpf.loadjson("savedata/shop.json", defaultshopsave)
  -- local lang = dpf.loadjson("langs/" .. uj.lang .. "/rob.json", "")
  
  if not message.guild then
    -- message.channel:send(lang.dm_message)
    message.channel:send("Sorry, but you can't rob in DMs!")
    return
  end

  if not uj.lastrob then
    uj.lastrob = 0
  end

  if uj.lastrob + 3 > sj.stocknum and uj.lastrob ~= 0 then
    local stocksleft = uj.lastrob + 3 - sj.stocknum
    local stockstring = stocksleft .. " more restock"
    if stocksleft > 1 then
      stockstring = stockstring .. "s"
    end
    -- message.channel:send(lang.wait_message_1 .. stockstring .. lang.wait_message_2)
    message.channel:send("You are blacklisted from the **Quaint Shop** for " .. stockstring .. ".")
    return
  end
  
  uj.lastrob = sj.stocknum
  
  dpf.savejson("savedata/" .. message.author.id .. ".json",uj)
  
  --if not uj.skipprompts then
  --  ynbuttons("Are you sure you want to rob the **Quaint Shop**?","rob",{}, uj.id, uj.lang)
  --else
    message.channel:send("You robbed something from the **Quaint Shop**. You are blacklisted from the shop for the next 3 restocks.")
    --if not uj.togglechecktoken then
    --  message.channel:send(lang.checktoken_1 .. uj.tokens .. lang.checktoken_2 .. (uj.tokens ~= 1 and lang.needs_plural_s == true and lang.plural_s or "") .. lang.checktoken_3)
    --end
  --end
end
return command
