local command = {}
function command.run(message, mt)
local time = sw:getTime()
  print(message.author.name .. " did !rob")
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json", defaultjson)
  local sj = dpf.loadjson("savedata/shop.json", defaultshopsave)  
  --local lang = dpf.loadjson("langs/" .. uj.lang .. "/rob.json", "")
  
  if not message.guild then
    --message.channel:send(lang.dm_message)
    message.channel:send("Sorry, but you can't rob in DMs!")
    return
  end
  
  if #mt == 0 then
    message.channel:send(lang.no_arguments)
    return
  end
  
  if #mt == 2 and mt[2] == 0 then
    message.channel:send("What did you try to steal?")
  
  if not uj.lastrob then
    uj.lastrob = 0
  end

  if uj.lastrob + 3 > sj.stocknum and uj.lastrob ~= 0 then
    local stocksleft = uj.lastrob + 3 - sj.stocknum
    local stockstring = stocksleft .. " more restock"
    if stocksleft > 1 then
      stockstring = stockstring .. "s"
    end
    --message.channel:send(lang.wait_message_1 .. stockstring .. lang.wait_message_2)
    message.channel:send("You are blacklisted from the **Quaint Shop** for " .. stockstring .. ".")
    return
  end
  
  if not uj.skipprompts then
    ynbuttons("Are you sure you want to rob the **Quaint Shop**?","rob",{robmt = mt}, uj.id, uj.lang)
  else
      if #mt > 1 and mt[2] ~= 1then
        message.channel:send("You enter the **Quaint Shop** with your mask on to steal some things, but you realize you can't hold that many. You ended up leaving the shop with your hands empty, and the **Wolf** blacklists you from the shop for the next 3 restocks anyway.")
        uj.lastrob = sj.stocknum
      else
        message.channel:send("You robbed something from the **Quaint Shop**. You are blacklisted from the shop for the next 3 restocks.")
        uj.lastrob = sj.stocknum
      end
    --if not uj.togglechecktoken then
    --  message.channel:send(lang.checktoken_1 .. uj.tokens .. lang.checktoken_2 .. (uj.tokens ~= 1 and lang.needs_plural_s == true and lang.plural_s or "") .. lang.checktoken_3)
    --end
  end
  
  dpf.savejson("savedata/" .. message.author.id .. ".json",uj)
end
return command
