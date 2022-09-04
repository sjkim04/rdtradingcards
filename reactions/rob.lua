local reaction = {}
function reaction.run(message, interaction, data, response)
  local ujf = "savedata/" .. message.author.id .. ".json"
  local uj = dpf.loadjson(ujf, defaultjson)
  --local lang = dpf.loadjson("langs/" .. uj.lang .. "/rob.json", "")
  local sj = dpf.loadjson("savedata/shop.json", defaultshopsave)
  print("Loaded uj")

  if response == "yes" then
    print('user1 has accepted')
    if uj.lastrob + 3 > sj.stocknum and uj.lastrob ~= 0 then
      interaction:reply("An error has occured. Make sure you recently haven't robbed the shop!")
      return
    end

    if data.random == true then
      message.channel:send("random incoming")
    else
      if data.itemtype == "consumable" then
        local robchance = math.random(1,2)
        print("robchance: " .. robchance)
        if robchance == 1 then
          print("rob succeded")
          sj.consumables[data.sindex].stock = sj.consumables[data.sindex].stock - data.numrequest
          if not uj.consumables then uj.consumables = {} end
          local adding = (consdb[data.srequest].quantity or 1) * data.numrequest
          if not uj.consumables[data.srequest] then
            uj.consumables[data.srequest] = adding
          else
            uj.consumables[data.srequest] = uj.consumables[data.srequest] + adding
          end
          message.channel:send("You entered the **Quaint Shop** with your mask. You asked for " .. data.numrequest .. " **" .. data.sname .. "**. The **Wolf** complies.")
        else
          print("rob failed")
          message.channel:send("You entered the **Quaint Shop** with your mask. You asked for " .. data.numrequest .. " **" .. data.sname .. "**. The **Wolf** calls the police instead. You are blacklisted from the shop for the next 3 restocks.")
          uj.lastrob = sj.stocknum
        end
      end
      if data.itemtype == "card" then
        local robsucceed = false
        if cdb[data.srequest].type == "Rare" then
          local robchance = math.random(1,10)
          if robchance ~= 1 then
            robsucceed = true
          end
        elseif cdb[data.srequest].type == "Super Rare" then
          local robchance = math.random(1,10)
          if robchance ~= 1 or robchance ~= 2 or robchance ~= 3 then
            robsucceed = true
          end
        elseif cdb[data.srequest].type == "Ultra Rare" then
          local robchance = math.random(1,2)
          if robchance == 1 then
            robsucceed = true
          end
        elseif cdb[data.srequest].type == "Alternate" or cdb[data.srequest].type == "Discontinued" then
          local robchance = math.random(1,10)
          if robchance == 1 or robchance == 2 or robchance == 3 then
            robsucceed = true
          end
        elseif cdb[data.srequest].type == "Discontinued Rare" then
          local robchance = math.random(1,5)
          if robchance == 1 then
            robsucceed = true
          end
        elseif cdb[data.srequest].type == "Discontinued Super Rare" then
          local robchance = math.random(1,20)
          if robchance == 1 or robchance == 2 or robchance == 3 then
            robsucceed = true
          end
        elseif cdb[data.srequest].type == "Discontinued Ultra Rare" or cdb[data.srequest].type == "Discontinued Alternate" or cdb[data.srequest].type == "Alternate Alternate" then
          local robchance = math.random(1,10)
          if robchance == 1 then
            robsucceed = true
          end
        end
        if robsucceed == true then
          print("rob succeded")
          sj.cards[data.sindex].stock = sj.cards[data.sindex].stock - data.numrequest
          if not uj.inventory then uj.inventory = {} end
          if not uj.inventory[data.srequest] then
            uj.inventory[data.srequest] = data.numrequest
          else
            uj.inventory[data.srequest] = uj.inventory[data.srequest] + data.numrequest
          end
          message.channel:send("You entered the **Quaint Shop** with your mask. You asked for " .. data.numrequest .. " **" .. data.sname .. "**. The **Wolf** complies.")
        else
          print("rob failed")
          message.channel:send("You entered the **Quaint Shop** with your mask. You asked for " .. data.numrequest .. " **" .. data.sname .. "**. The **Wolf** calls the police instead. You are blacklisted from the shop for the next 3 restocks.")
          uj.lastrob = sj.stocknum
        end
      end
      if data.itemtype == "item" then
        local robchance = math.random(1,2)
        if robchance == 1 then
          print("rob succeded")
          sj.itemstock = sj.itemstock - 1
          uj.items[data.srequest] = true
          message.channel:send("You entered the **Quaint Shop** with your mask. You asked for a **" .. data.sname .. "**. The **Wolf** complies.")
        else
          print("rob failed")
          message.channel:send("You entered the **Quaint Shop** with your mask. You asked for a **" .. data.sname .. "**. The **Wolf** calls the police instead. You are blacklisted from the shop for the next 3 restocks.")
          uj.lastrob = sj.stocknum
        end
      end
    end
    
    dpf.savejson(ujf, uj)
    dpf.savejson("savedata/shop.json", sj)
  end

  if response == "no" then
    print('user1 has denied')
    interaction:reply("<@" .. uj.id .. "> has stopped robbing the **Quaint Shop**. For now...")
  end
end
return reaction
