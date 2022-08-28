local reaction = {}
function reaction.run(message, interaction, data, response)
  local ujf = "savedata/" .. message.author.id .. ".json"
  local uj = dpf.loadjson(ujf, defaultjson)
  --local lang = dpf.loadjson("langs/" .. uj.lang .. "/rob.json", "")
  local sj = dpf.loadjson("savedata/shop.json", defaultshopsave)
  local mt = data.robmt
  print("Loaded uj")

  if response == "yes" then
    print('user1 has accepted')
    if uj.lastrob + 3 > sj.stocknum and uj.lastrob ~= 0 then
      interaction:reply("An error has occured. Make sure you recently haven't robbed the shop!")
      return
    end

    if #mt > 1 then
        message.channel:send("You enter the **Quaint Shop** with your mask on to steal some things, but realize you can't rob that many. You ended up leaving the shop without robbing anything, and the **Wolf** blacklists you from the shop for the next 3 restocks anyway.")
        uj.lastrob = sj.stocknum
    else
      message.channel:send("You robbed something from the **Quaint Shop**. You are blacklisted from the shop for the next 3 restocks.")
      uj.lastrob = sj.stocknum
    end
    
    dpf.savejson(ujf, uj)
  end

  if response == "no" then
    print('user1 has denied')
    interaction:reply("<@" .. uj.id .. "> has stopped robbing the **Quaint Shop**. For now...")
  end
end
return reaction
