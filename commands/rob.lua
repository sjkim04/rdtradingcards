local command = {}
function command.run(message, mt)
  local time = sw:getTime()
  checkforreload(time:toDays())
  print(message.author.name .. " did !rob")
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json", defaultjson)
  local sj = dpf.loadjson("savedata/shop.json", defaultshopsave)  
  --local lang = dpf.loadjson("langs/" .. uj.lang .. "/rob.json", "")
  local lang = dpf.loadjson("langs/en/rob.json", "")
  
  if not message.guild then
    message.channel:send(lang.dm_message)
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
    dpf.savejson("savedata/" .. message.author.id .. ".json",uj)
  end

  if uj.lastrob + 4 > sj.stocknum and uj.lastrob ~= 0 then
    local stocksleft = uj.lastrob + 3 - sj.stocknum
    local stockstring = stocksleft .. lang.more_restock
    if lang.needs_plural_s == true then
      if stocksleft > 1 then
        stockstring = stockstring .. lang.plural_s
      end
    end
    if uj.lastrob + 3 == sj.stocknum then
      local minutesleft = math.ceil((26/24 - time:toDays() + sj.lastrefresh) * 24 * 60)
      print(minutesleft)
      local durationtext = ""
      if math.floor(minutesleft / 60) > 0 then
        durationtext = math.floor(minutesleft / 60) .. lang.time_hour
        if lang.needs_plural_s == true then
          if math.floor(minutesleft / 60) ~= 1 then 
            durationtext = durationtext .. lang.plural_s 
          end
        end
      end
      if minutesleft % 60 > 0 then
        if durationtext ~= "" then
          durationtext = durationtext .. lang.time_and
        end
        durationtext = durationtext .. minutesleft % 60 .. lang.time_minute
        if lang.needs_plural_s == true then
          if minutesleft % 60 ~= 1 then
            durationtext = durationtext .. lang.plural_s 
          end
        end
      end
      message.channel:send("You will be able to access the **Quaint Shop** after the next restock. The shop will be restocked in " .. durationtext .. ".")
    else
      message.channel:send("You are blacklisted from the **Quaint Shop** for " .. stockstring .. ".")
    end
    return
  end

  --error handling
  local sendshoperror = {
    outofstock = function()
      message.channel:send(lang.out_of_stock_1 .. sname .. lang.out_of_stock_2)
    end,

    toomanyrequested = function()
        message.channel:send(lang.too_many_requested_1 .. stock .. lang.too_many_requested_2 .. sname .. lang.too_many_requested_3)
    end,

    donthave = function()
      if nopeeking then
        message.channel:send(lang.nopeeking_error_1 .. mt[1] .. lang.nopeeking_error_2)
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
        message.channel:send(lang.nopeeking_error_1 .. mt[1] .. lang.nopeeking_error_2)
      else
        message.channel:send(lang.unknownrequest_1 .. mt[1] .. lang.unknownrequest_2)
      end
    end
  }

  if not mt[1] or mt[1] == "" then
    ynbuttons(message,{
      color = 0x85c5ff,
      title = "Robbing Quaint Shop...",
      description = "Are you sure you want to rob the **Quaint Shop**? This may **blacklist you from the shop** for a few days!"
    },"rob",{random=true}, uj.id, uj.lang)
    return
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
      ynbuttons(message,{
        color = 0x85c5ff,
        title = "Robbing " .. sname .. "...",
        description = "_The description on the back reads:_\n`" .. consdb[srequest].description .. "`\nAre you sure you want to rob " .. numrequest .. " **" .. sname .. "** from the **Quaint Shop**? This may **blacklist you from the shop** for a few days!"
      },"rob",{itemtype = "consumable",sname=sname,sindex=sindex,srequest=srequest,numrequest=numrequest, random=false}, uj.id, uj.lang)
      return
    end

    if itemtexttofn(mt[1]) then
      srequest = itemtexttofn(mt[1])
      sname = itemdb[srequest].name

      if srequest ~= sj.item then
        sendshoperror["donthave"]()
        return
      end

      if uj.items[srequest] then
        sendshoperror["alreadyhave"]()
        return
      end

      if sj.item == "brokenmouse" and uj.items["fixedmouse"] then
        sendshoperror["hasfixedmouse"]()
        return
      end

      if sj.itemstock <= 0 then
        sendshoperror["outofstock"]()
        return
      end

      if numrequest > 1 then
        sendshoperror["oneitemonly"]()
        return
      end

      --can buy item
      ynbuttons(message,{
        color = 0x85c5ff,
        title = "Robbing " .. sname .. "...",
        description = "_The description on the back reads:_\n`" .. itemdb[srequest].description .. "`\nAre you sure you want to rob the **" .. sname .. "** from the **Quaint Shop**? This may **blacklist you from the shop** for a few days!"
      },"rob",{itemtype = "item",sname=sname,sindex=sindex,srequest=srequest,numrequest=numrequest, random=false}, uj.id, uj.lang)
      return
    end

    if texttofn(mt[1]) then
      print("card!")
      srequest = texttofn(mt[1])
      sname = cdb[srequest].name

      for i,v in ipairs(sj.cards) do
        if v.name == srequest then
          sindex = i
          break
        end
      end

      if not sindex then
        sendshoperror["donthave"]()
        return
      end

      stock = sj.cards[sindex].stock
      if stock <= 0 then
        sendshoperror["outofstock"]()
        return
      end

      if numrequest > stock then
        sendshoperror["toomanyrequested"]()
        return
      end

      --can buy card
      ynbuttons(message,{
        color = 0x85c5ff,
        title = "Robbing " .. sname .. "...",
        description = "_The description on the back reads:_\n`" .. cdb[srequest].description .. "`\nAre you sure you want to rob " .. numrequest .. " **" .. sname .. "** from the **Quaint Shop**? This may **blacklist you from the shop** for a few days!"
      },"rob",{itemtype = "card",sname=sname,sindex=sindex,srequest=srequest,numrequest=numrequest, random=false}, uj.id, uj.lang)
      return
    end
    sendshoperror["unknownrequest"]()
  end
end
return command
