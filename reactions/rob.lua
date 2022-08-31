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

    if data.random == false then
      if data.itemtype == "consumable" then
        local robchance = math.random(1,5)
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
          message.channel:send("You entered the **Quaint Shop** with your mask. You asked for " .. data.numrequest .. " **" .. data.sname .. "**. The **Wolf** complies.\nAfter you leave, the Wolf calls the police. You are blacklisted from the shop for the next 3 restocks.")
        else
          print("rob failed")
          message.channel:send("You entered the **Quaint Shop** with your mask. You asked for " .. data.numrequest .. " **" .. data.sname .. "**. The **Wolf** calls the police instead. You are blacklisted from the shop for the next 3 restocks.")
        end
      else
        message.channel:send("You robbed something from the **Quaint Shop**. You are blacklisted from the shop for the next 3 restocks.")
      end
    else
      message.channel:send("random incoming")
    end
    
    print("saving rob num")
    uj.lastrob = sj.stocknum
    print(uj.lastrob)
    dpf.savejson(ujf, uj)
  end

  if response == "no" then
    print('user1 has denied')
    interaction:reply("<@" .. uj.id .. "> has stopped robbing the **Quaint Shop**. For now...")
  end
end
return reaction
