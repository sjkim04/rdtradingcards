local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !pronoun")
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json", defaultjson)
  local lang = dpf.loadjson("langs/" .. uj.lang .. "/lang.json", "")
  
  if not uj.lang then
    uj.lang = "en"
  end
  
  if mt[1] == "English" or mt[1] == "en" then
  uj.lang = "en"
  local lang = dpf.loadjson("langs/" .. uj.lang .. "/lang.json", "")
  local lang_p = dpf.loadjson("langs/" .. uj.lang .. "/pronoun.json", "")
  if uj.pronouns["selection"] == "they" then
    uj.pronouns["they"] = lang_p.they_they
    uj.pronouns["them"] = lang_p.they_them
    uj.pronouns["their"] = lang_p.they_their
    uj.pronouns["theirs"] = lang_p.they_theirs
    uj.pronouns["theirself"] = lang_p.they_theirself
  elseif uj.pronouns["selection"] == "he" then
    uj.pronouns["they"] = lang_p.he_they
    uj.pronouns["them"] = lang_p.he_them
    uj.pronouns["their"] = lang_p.he_their
    uj.pronouns["theirs"] = lang_p.he_theirs
    uj.pronouns["theirself"] = lang_p.he_theirself
  elseif uj.pronouns["selection"] == "she" then
    uj.pronouns["they"] = lang_p.she_they
    uj.pronouns["them"] = lang_p.she_them
    uj.pronouns["their"] = lang_p.she_their
    uj.pronouns["theirs"] = lang_p.she_theirs
    uj.pronouns["theirself"] = lang_p.she_theirself
  elseif uj.pronouns["selection"] == "it" then
    uj.pronouns["they"] = lang_p.it_they
    uj.pronouns["them"] = lang_p.it_them
    uj.pronouns["their"] = lang_p.it_their
    uj.pronouns["theirs"] = lang_p.it_theirs
    uj.pronouns["theirself"] = lang_p.it_theirself
  elseif uj.pronouns["selection"] == "xe" then
    uj.pronouns["they"] = lang_p.xe_they
    uj.pronouns["them"] = lang_p.xe_them
    uj.pronouns["their"] = lang_p.xe_their
    uj.pronouns["theirs"] = lang_p.xe_theirs
    uj.pronouns["theirself"] = lang_p.xe_theirself
  elseif uj.pronouns["selection"] == "sta" then
    uj.pronouns["they"] = lang_p.sta_they
    uj.pronouns["them"] = lang_p.sta_them
    uj.pronouns["their"] = lang_p.sta_their
    uj.pronouns["theirs"] = lang_p.sta_theirs
    uj.pronouns["theirself"] = lang_p.sta_theirself
  elseif uj.pronouns["selection"] == "ze" then
    uj.pronouns["they"] = lang_p.ze_they
    uj.pronouns["them"] = lang_p.ze_them
    uj.pronouns["their"] = lang_p.ze_their
    uj.pronouns["theirs"] = lang_p.ze_theirs
    uj.pronouns["theirself"] = lang_p.ze_theirself
  elseif uj.pronouns["selection"] == "vee" then
    uj.pronouns["they"] = lang_p.vee_they
    uj.pronouns["them"] = lang_p.vee_them
    uj.pronouns["their"] = lang_p.vee_their
    uj.pronouns["theirs"] = lang_p.vee_theirs
    uj.pronouns["theirself"] = lang_p.vee_theirself
  end
  message.channel:send(lang.lang_changed)
  elseif mt[1] == "한국어" or mt[1] == "Korean" or mt[1] == "ko" then
    uj.lang = "ko"
    local lang = dpf.loadjson("langs/" .. uj.lang .. "/lang.json", "")
	local lang_p = dpf.loadjson("langs/" .. uj.lang .. "/pronoun.json", "")
  if uj.pronouns["selection"] == "they" then
    uj.pronouns["they"] = lang_p.they_they
    uj.pronouns["them"] = lang_p.they_them
    uj.pronouns["their"] = lang_p.they_their
    uj.pronouns["theirs"] = lang_p.they_theirs
    uj.pronouns["theirself"] = lang_p.they_theirself
  elseif uj.pronouns["selection"] == "he" then
    uj.pronouns["they"] = lang_p.he_they
    uj.pronouns["them"] = lang_p.he_them
    uj.pronouns["their"] = lang_p.he_their
    uj.pronouns["theirs"] = lang_p.he_theirs
    uj.pronouns["theirself"] = lang_p.he_theirself
  elseif uj.pronouns["selection"] == "she" then
    uj.pronouns["they"] = lang_p.she_they
    uj.pronouns["them"] = lang_p.she_them
    uj.pronouns["their"] = lang_p.she_their
    uj.pronouns["theirs"] = lang_p.she_theirs
    uj.pronouns["theirself"] = lang_p.she_theirself
  elseif uj.pronouns["selection"] == "it" then
    uj.pronouns["they"] = lang_p.it_they
    uj.pronouns["them"] = lang_p.it_them
    uj.pronouns["their"] = lang_p.it_their
    uj.pronouns["theirs"] = lang_p.it_theirs
    uj.pronouns["theirself"] = lang_p.it_theirself
  elseif uj.pronouns["selection"] == "xe" then
    uj.pronouns["they"] = lang_p.xe_they
    uj.pronouns["them"] = lang_p.xe_them
    uj.pronouns["their"] = lang_p.xe_their
    uj.pronouns["theirs"] = lang_p.xe_theirs
    uj.pronouns["theirself"] = lang_p.xe_theirself
  elseif uj.pronouns["selection"] == "sta" then
    uj.pronouns["they"] = lang_p.sta_they
    uj.pronouns["them"] = lang_p.sta_them
    uj.pronouns["their"] = lang_p.sta_their
    uj.pronouns["theirs"] = lang_p.sta_theirs
    uj.pronouns["theirself"] = lang_p.sta_theirself
  elseif uj.pronouns["selection"] == "ze" then
    uj.pronouns["they"] = lang_p.ze_they
    uj.pronouns["them"] = lang_p.ze_them
    uj.pronouns["their"] = lang_p.ze_their
    uj.pronouns["theirs"] = lang_p.ze_theirs
    uj.pronouns["theirself"] = lang_p.ze_theirself
  elseif uj.pronouns["selection"] == "vee" then
    uj.pronouns["they"] = lang_p.vee_they
    uj.pronouns["them"] = lang_p.vee_them
    uj.pronouns["their"] = lang_p.vee_their
    uj.pronouns["theirs"] = lang_p.vee_theirs
    uj.pronouns["theirself"] = lang_p.vee_theirself
  end
    message.channel:send(lang.lang_changed)
  elseif mt[1] == "" then
    message.channel:send(lang.no_value)
  else
    message.channel:send(lang.no_database_1 ..mt[1].. lang.no_database_2)
  end

  dpf.savejson("savedata/" .. message.author.id .. ".json", uj)
end
return command
