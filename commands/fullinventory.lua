local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !fullinventory")
  local filename = "savedata/" .. message.author.id .. ".json"
  local uj = dpf.loadjson(filename, defaultjson)
  local lang = dpf.loadjson("langs/" .. uj.lang .. "/fullinventory.json", "")

  local enableShortNames = false

  args = {}
  for substring in mt[1]:gmatch("%S+") do
    table.insert(args, substring)
  end

  if not (args[1] == nil or args[1] == "-s") then
    filename = usernametojson(args[1])
  end

  if not filename then
    message.channel:send(lang.no_user_1 .. mt[1] .. lang.no_user_2)
    return
  end

  for index, value in ipairs(args) do
    if value == "-s" then
      enableShortNames = true
    end
  end

  message:addReaction("✅")
  local uj = dpf.loadjson(filename, defaultjson)
  local numkey = 0
  for k in pairs(uj.inventory) do numkey = numkey + 1 end

  local invtable = {}
  local contentstring = (uj.id == message.author.id and lang.embed_your or "<@" .. uj.id .. ">" .. lang.embed_s) .. lang.embed_contains
  local titlestring = lang.embed_title
  local invstring = ''
  local previnvstring = ''
  if enableShortNames == true then
    for k,v in pairs(uj.inventory) do table.insert(invtable, "**" .. (cdb[k].name or k) .. "** x" .. v .. " (" .. k.. ")\n") end
  else
    for k,v in pairs(uj.inventory) do table.insert(invtable, "**" .. (cdb[k].name or k) .. "** x" .. v .. "\n") end
  end
  table.sort(invtable)
  for i = 1, numkey do
    invstring = invstring .. invtable[i]
    if #invstring > 4096 then
      message.author:send{
        content = contentstring,
        embed = {
          color = 0x85c5ff,
          title = titlestring,
          description = previnvstring
        },
      }
      invstring = invtable[i]
      contentstring = ''
      titlestring = lang.embed_cont_title
    end
    previnvstring = invstring
  end
  message.author:send{
    content = contentstring,
    embed = {
      color = 0x85c5ff,
      title = titlestring,
      description = previnvstring
    },
  }
end
return command
