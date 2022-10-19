local reaction = {}
function reaction.run(message, interaction, data, response)
  local item1 = data.item1
  local numcards = data.numcards
  local ujf = "savedata/" .. message.author.id .. ".json"
  local uj = dpf.loadjson(ujf, defaultjson)
  local lang = dpf.loadjson("langs/" .. uj.lang .. "/store.json", "")
  print("Loaded uj")

  if response == "yes" then
    print('user1 has accepted')
    if not uj.inventory[item1] then
      interaction:reply(lang.reaction_dont_have)
      return
    end

    if uj.inventory[item1] < numcards then
      interaction:reply(formatstring(lang.reaction_not_enough, {cdb[item1].name}))
      return
    end

    print("Removing item1 from user1")
    uj.inventory[item1] = uj.inventory[item1] - numcards
    if uj.inventory[item1] == 0 then uj.inventory[item1] = nil end

    print("Giving item1 to user1 storage")
    uj.storage[item1] = uj.storage[item1] and uj.storage[item1] + numcards or numcards

    uj.timesstored = uj.timesstored and uj.timesstored + numcards or numcards

		interaction:reply(formatstring(lang.stored_message, {uj.id, uj.pronouns["their"], numcards, cdb[item1].name}))
    dpf.savejson(ujf,uj)
    cmd.checkcollectors.run(message, {}, message.channel)
    cmd.checkmedals.run(message, {}, message.channel)
  end

  if response == "no" then
    print('user1 has denied')
		interaction:reply(formatstring(lang.reaction_stopped, {uj.id, uj.pronouns["their"], cdb[item1].name, numcards}, lang.plural_s))
  end
end
return reaction
