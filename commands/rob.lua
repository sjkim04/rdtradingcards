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
  
  local srequest
  local sname
  local stock
  local sindex
  local numrequest = 1

  if tonumber(mt[2]) then
    if tonumber(mt[2]) > 1 then
      numrequest = math.floor(mt[2])
    end
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
    --message.channel:send(lang.wait_message_1 .. stockstring .. lang.wait_message_2)
    message.channel:send("You are blacklisted from the **Quaint Shop** for " .. stockstring .. ".")
    return
  end

  --error handling
  local sendshoperror = {
    outofstock = function()
      message.channel:send("The **Wolf** frowns. It is currently out of stock of **" .. sname .. "**.")
    end,

    toomanyrequested = function()
        message.channel:send("The **Wolf** frowns. You can only buy " .. stock .. lang.too_many_requested_2 .. sname .. lang.too_many_requested_3)
    end,

    donthave = function()
      if nopeeking then
        message.channel:send(lang.nopeeking_error_1 .. mt[2] .. lang.nopeeking_error_2)
      else
        message.channel:send(lang.donthave_1 .. sname .. lang.donthave_2)
      end
    end,

    alreadyhave = function()
      message.channel:send(lang.alreadyhave_1 .. sname .. lang.alreadyhave_2)
    end,
      
    hasfixedmouse = function()
      message.channel:send(lang.hasfixedmouse)
    end,

    oneitemonly = function()
      message.channel:send(lang.oneitemonly)
    end,

    unknownrequest = function()
      if nopeeking then
        message.channel:send(lang.nopeeking_error_1 .. mt[2] .. lang.nopeeking_error_2)
      else
        message.channel:send(lang.unknownrequest_1 .. mt[2] .. lang.unknownrequest_2)
      end
    end
  }

  if not mt[1] or mt[1] == "" then
    message.channel:send("random picker")
  else
    if constexttofn(mt[1]) then
      srequest = constexttofn(mt[1])
      sname = consdb[srequest].name

      for i,v in ipairs(sj.consumables) do
        if v.name == srequest then
          sindex = i
          break
        end
      end

      if not sindex then
        sendshoperror["donthave"]()
        return
      end

      stock = sj.consumables[sindex].stock
      if stock <= 0 then
        sendshoperror["outofstock"]()
        return
      end

      if numrequest > stock then
        sendshoperror["toomanyrequested"]()
        return
      end
    
      -- can rob consumable
      ynbuttons(message,"Are you sure you want to rob " .. numrequest .. " **" .. sname .. "** from the **Quaint Shop**? This will **blacklist you from the shop** for a few days!","rob",{itemtype = "consumable",sname=sname,sindex=sindex,srequest=srequest,numrequest=numrequest, random=false}, uj.id, uj.lang)
    else
      message.channel:send("you asked for something other than consumables")
    end
  end

  dpf.savejson("savedata/" .. message.author.id .. ".json",uj)
end
return command
