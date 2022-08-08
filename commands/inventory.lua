local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !inventory")
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json",defaultjson)
  local lang = dpf.loadjson("langs/" .. uj.lang .. "/inventory.json", "")

  local enableShortNames = false
  local enableSeason = false

  local pagenumber = 1

  args = {}
  for substring in mt[1]:gmatch("%S+") do
    table.insert(args, substring)
  end

  for index, value in ipairs(args) do
    if tonumber(value) then
      pagenumber = math.floor(tonumber(value))
    end
    if value == "-s" then
      enableShortNames = true
    elseif value == "-season" then
      enableSeason = true
    end
  end

  pagenumber = math.max(1, pagenumber)

  local numcards = 0
  for k in pairs(uj.inventory) do numcards = numcards + 1 end
  local maxpn = math.ceil(numcards / 10)
  pagenumber = math.min(pagenumber, maxpn)
  print("Page number is " .. pagenumber)

  local invtable = {}
  local invstring = ''
  if enableShortNames == true then
    for k,v in pairs(uj.inventory) do table.insert(invtable, "**" .. (cdb[k].name or k) .. "** x" .. v .. " (" .. k.. ")\n") end
  elseif enableSeason == true then
    for k,v in pairs(uj.inventory) do table.insert(invtable, "**" .. (cdb[k].name or k) .. "** x" .. v .. " (Season " .. cdb[k].season.. ")\n") end
  else
    for k,v in pairs(uj.inventory) do table.insert(invtable, "**" .. (cdb[k].name or k) .. "** x" .. v .. "\n") end
  end
  table.sort(invtable)

  for i = (pagenumber - 1) * 10 + 1, (pagenumber) * 10 do
    print(i)
    if invtable[i] then invstring = invstring .. invtable[i] end
  end

  if uj.lang == "ko" then
    message.channel:send{
      content = message.author.mentionString .. lang.embed_inventory,
      embed = {
        color = 0x85c5ff,
        title = message.author.name .. lang.embed_title,
        description = invstring,
        footer = {
          text =  lang.embed_page_1 .. maxpn .. lang.embed_page_2 .. pagenumber .. lang.embed_page_3,
          icon_url = message.author.avatarURL
        }
      }
    }
  else
    message.channel:send{
      content = message.author.mentionString .. lang.embed_inventory,
      embed = {
        color = 0x85c5ff,
        title = message.author.name .. lang.embed_title,
        description = invstring,
        footer = {
          text =  lang.embed_page_1 .. pagenumber .. lang.embed_page_2 .. maxpn .. lang.embed_page_3,
          icon_url = message.author.avatarURL
        }
      }
    }
  end
end
return command
