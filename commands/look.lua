local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !look")
  local wj = dpf.loadjson("savedata/worldsave.json", defaultworldsave)
  if not wj.ws then
    wj.ws = 508
    dpf.savejson("savedata/worldsave.json", wj)
  end
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json",defaultjson)
  
  if uj.room == nil then
    uj.room = 0
  end
  
  if uj.timeslooked == nil then
    uj.timeslooked = 1
  else
    uj.timeslooked = uj.timeslooked + 1
  end
  
  if not mt[1] then
    mt[1] = ""
  end
  if texttofn(mt[1]) or itemtexttofn(mt[1]) or constexttofn(mt[1]) or medaltexttofn(mt[1]) then
    if (nopeeking and (uj.inventory[texttofn(mt[1])] or uj.storage[texttofn(mt[1])] or uj.items[itemtexttofn(mt[1])] or uj.medals[medaltexttofn(mt[1])])) or not nopeeking then
      if texttofn(mt[1]) then
        cmd.show.run(message, mt)
      elseif itemtexttofn(mt[1]) or constexttofn(mt[1]) then
        cmd.showitem.run(message, mt)
      elseif medaltexttofn(mt[1]) then
        cmd.showmedal.run(message, mt)
      end
      return
    end
  end

  local found = true
  if uj.room == 0 then
    
    
    if string.lower(mt[1]) == "pyrowmid" or mt[1] == "" then -----------------PYROWMID--------------------------
	  local lang = dpf.loadjson("langs/" .. uj.lang .. "/look/pyrowmid.json", "")
      if wj.ws < 501 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_pyrowmid,
          description = lang.looking_pre_501,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/829255814169493535/pyr7.png'
          }
        }}
      elseif wj.ws == 501 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_pyrowmid,
          description = lang.looking_501,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831189023426478170/pyrhole.png'
          }
        }}
      elseif wj.ws == 502 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_pyrowmid,
          description = lang.looking_502,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831191711917146183/pyrhole2.png'
          }
        }}
      elseif wj.ws == 503 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_pyrowmid,
          description = lang.looking_503,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831192398524710982/pyrhole3.png'
          }
        }}
      elseif wj.ws == 504 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_pyrowmid,
          description = lang.looking_504,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831263091470630922/pyrhole4.png'
          }
        }}
      elseif wj.ws == 505 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_pyrowmid,
          description = lang.looking_505,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831223296112066560/pyrhole5.png'
          }
        }}
      elseif wj.ws == 506 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_pyrowmid,
          description = lang.looking_506,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831225534834802769/pyrhole6.png'
          }
        }}
      else
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_pyrowmid,
          description = lang.looking_507,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831291533915324436/pyrholefinal.png'
          }
        }}
      
      end

    elseif string.lower(mt[1]) == "panda" or string.lower(mt[1]) == "het" then 
      
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_panda,
          description = lang.looking_panda,
        }}
    elseif string.lower(mt[1]) == "throne" then 
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_throne,
          description = lang.looking_throne,
        }}
    elseif string.lower(mt[1]) == "strange machine" or string.lower(mt[1]) == "machine" then 
      if wj.ws == 506 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang_looking_at_machine,
          description = lang.looking_machine_506,
        }}       
      else
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang_looking_at_machine,
          description = lang.looking_machine,
        }}
      end
    
    elseif string.lower(mt[1]) == "hole" then
      if wj.ws < 501 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_hole,
          description = lang.looking_hole_pre_501,
        }}
      elseif wj.ws == 501 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_hole,
          description = lang.looking_hole_501,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831507279975153754/holeclose.png'
          }
        }}
      elseif wj.ws == 502 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_hole,
          description = lang.looking_hole_502,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831507280905633812/holeclose2.png'
          }
        }}
      elseif wj.ws == 503 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_hole,
          description = lang.looking_hole_503,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831507281941495948/holeclose3.png'
          }
        }}
      elseif wj.ws == 504 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_hole,
          description = lang.looking_hole_504,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831507283624198174/holeclose4.png'
          }
        }}
      elseif wj.ws == 505 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_hole,
          description = lang.looking_hole_505,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831507285242150922/holeclose5.png'
          }
        }}
      elseif wj.ws == 506 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_hole,
          description = lang.looking_hole_506,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831507288165449728/holeclose6.png'
          }
        }}
      else
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_hole,
          description = lang.looking_hole_507,
          image = {
            url = 'https://cdn.discordapp.com/attachments/829197797789532181/831507279164997642/holeclosefinal.png'
          }
        }}
      end
    elseif (string.lower(mt[1]) == "ladder") and wj.labdiscovered  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_ladder,
        description = lang.looking_ladder,
        image = {
          url = 'https://cdn.discordapp.com/attachments/829197797789532181/831507279164997642/holeclosefinal.png'
        }
      }}
    else
      found = false
    end
  end -------------------------------------END PYROWMID------------------------------------------------
  
  if uj.room == 1 then     --------------------------------------------------LAB--------------------------------------------------------------------------   
    local lang = dpf.loadjson("langs/" .. uj.lang .. "/look/lab.json", "")
	  
      
    
    if (string.lower(mt[1]) == "lab" or string.lower(mt[1]) == "abandoned lab" or mt[1] == "") and wj.labdiscovered  then 
      local laburl = "https://cdn.discordapp.com/attachments/829197797789532181/862885457854726154/lab_scanner.png"
      local labdesc = lang.looking_lab_post_801
      
      if wj.ws <= 801 then
        laburl = labimages[getletterindex(string.sub(wj.lablooktext, wj.lablookindex + 1, wj.lablookindex + 1))]
        labdesc = lang.looking_lab
      end
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_lab,
        description = labdesc,
        image = {
          url = laburl
        }
      }}
      wj.lablookindex = wj.lablookindex + 1
      
      wj.lablookindex = wj.lablookindex % string.len(wj.lablooktext)
      dpf.savejson("savedata/worldsave.json", wj)
    elseif (string.lower(mt[1]) == "spider" or string.lower(mt[1]) == "spiderweb" or string.lower(mt[1]) == "web" or string.lower(mt[1]) == "spider web") and wj.labdiscovered then       
      local newmessage = ynbuttons(message,lang.spider_alert,"spiderlook",{},uj.id,uj.lang)
    elseif (string.lower(mt[1]) == "terminal") and wj.labdiscovered  then  --FONT IS MS GOTHIC AT 24PX, 8PX FOR SMALL FONT
      if wj.ws < 508 then
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_terminal,
          description = lang.looking_terminal_pre_508,
          image = {
            url = "https://cdn.discordapp.com/attachments/829197797789532181/838832581147361310/terminal1.png"
          }
        }}
      else
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_terminal,
          description = lang.looking_terminal,
          image = {
            url = "https://cdn.discordapp.com/attachments/829197797789532181/838836625391484979/terminal2.gif"
          }
        }}
      end
    
    elseif (string.lower(mt[1]) == "database") and wj.labdiscovered  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_database,
        description = lang.looking_database,
        image = {
          url = labimages[getletterindex(string.sub(wj.lablooktext, wj.lablookindex + 1, wj.lablookindex + 1))]
        }
      }}
      wj.lablookindex = wj.lablookindex + 1
      
      wj.lablookindex = wj.lablookindex % string.len(wj.lablooktext)
      dpf.savejson("savedata/worldsave.json", wj)
    
    elseif (string.lower(mt[1]) == "table") and wj.labdiscovered  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_table,
        description = lang.looking_table,
      }}
    
    
    elseif (string.lower(mt[1]) == "poster" or string.lower(mt[1]) == "catposter" or string.lower(mt[1]) == "cat poster") and wj.labdiscovered  then 
      if tonumber(wj.ws) ~= 801 then --normal cat poster
        local postermessage = {lang.looking_poster_1, lang.looking_poster_2, lang.looking_poster_3, lang.looking_poster_4, lang.looking_poster_5, lang.looking_poster_6, lang.looking_poster_7, lang.looking_poster_8, lang.looking_poster_9, lang.looking_poster_10, lang.looking_poster_11 }
        local posterimage = {"https://cdn.discordapp.com/attachments/829197797789532181/838962876751675412/poster1.png","https://cdn.discordapp.com/attachments/829197797789532181/839214962786172928/poster3.png","https://cdn.discordapp.com/attachments/829197797789532181/838791958905618462/poster4.png","https://cdn.discordapp.com/attachments/829197797789532181/838799811813441607/poster6.png","https://cdn.discordapp.com/attachments/829197797789532181/838937070616444949/poster7.png","https://cdn.discordapp.com/attachments/829197797789532181/838819064884232233/poster8.png","https://cdn.discordapp.com/attachments/829197797789532181/838799792267067462/poster9.png","https://cdn.discordapp.com/attachments/829197797789532181/838864622878588989/poster10.png","https://cdn.discordapp.com/attachments/829197797789532181/838870206687346768/poster11.png","https://cdn.discordapp.com/attachments/829197797789532181/839214999884398612/poster12.png","https://cdn.discordapp.com/attachments/829197797789532181/839215023662039060/poster13.png"}
        local cposter = math.random(1, #postermessage)
        
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_poster,
          description = postermessage[cposter],
          image = {
            url = posterimage[cposter]
          }
        }}
      else -- pull away cat poster
        message.channel:send{embed = {
          color = 0x85c5ff,
          title = lang.looking_at_poster,
          description = lang.looking_poster_801,
          image = {
            url = "https://cdn.discordapp.com/attachments/829197797789532181/860703201224949780/posterpeeling.png"
          }
        }}
      end
    
    elseif (string.lower(mt[1]) == "mouse hole" or string.lower(mt[1]) == "mouse" or string.lower(mt[1]) == "mousehole") and wj.labdiscovered  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_mousehole,
        description = lang.looking_mousehole,
      }}
    elseif (string.lower(mt[1]) == "peculiar box" or string.lower(mt[1]) == "box" or string.lower(mt[1]) == "peculiarbox") and wj.labdiscovered  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_box,
        description = lang.looking_box,
      }}
    elseif (string.lower(mt[1]) == "scanner") and wj.ws >= 802 then
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = "Looking at scanner...",
        description = 'TODO: scanner look text',
      }}
      
    
    
    
    
    
    else
      found = false
    end
  end
  
  if uj.room == 2 then     --------------------------------------------------MOUNTAINS--------------------------------------------------------------------------   
    
      
    local request = string.lower(mt[1]) --why tf didint i do this for all the other ones?????????????????
    if (request == "mountains" or request == "mountain" or request == "windymountains" or request == "the windy mountains" or request == "windy mountains" or mt[1] == "") then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = "Looking at Mountains...",
        description = "The **Windy Mountains** can be found near the **Pyrowmid.** Across a **Bridge** is a **Quaint Shop**, which seems to have some **Barrels** next to it. The sky is filled with **Clouds.**",
        image = {
          url = "https://cdn.discordapp.com/attachments/829197797789532181/871433038280675348/windymountains.png"
        }
      }}
    

    

    elseif (string.lower(mt[1]) == "pyrowmid")  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_pyrowmid,
        description = 'From up here, the **Pyrowmid** looks absolutely tiny! Next to it is an absolutely bog-standard pyramid.',
      }}
    elseif (string.lower(mt[1]) == "bridge")  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = "Looking at Bridge...",
        description = 'The **Bridge** looks safe to walk over, but you might not want to do any fancy jumps on it or anything.',
      }}
    elseif (request == "shop" or request == "quaintshop" or request == "quaint shop")  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = "Looking at Quaint Shop...",
        description = 'The **Quaint Shop** has a sign outside of it, marking that it sells "Cards And Things". If you need cards and/or things, it might be worth checking out.',
      }}
    elseif (request == "barrels")  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = "Looking at Barrels...",
        description = 'The **Barrels** are propped up next to the **Quaint Shop.** Probably best not to touch them...',
      }}
    elseif (request == "clouds")  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = "Looking at Clouds...",
        description = 'Ooh! Pretty!',
      }}
    
    
    else
      found = false
    end
  end
  
  if uj.room == 3 then  --------------------------------------------------SHOP--------------------------------------------------------------------------   
    local lang = dpf.loadjson("langs/" .. uj.lang .. "/look/shop.json")
    args = {}
    for substring in mt[1]:gmatch("%S+") do
      table.insert(args, substring)
    end
      
    if args[1] == nil or args[1] == "-s" or args[1] == "-season" then
	  _G["request"] = ""
	else
	  _G["request"] = string.lower(args[1]) --why tf didint i do this for all the other ones?????????????????
    end
	if (request == "shop" or request == "quaintshop" or request == "quaint shop" or request == "")  then
      local time = sw:getTime()
      checkforreload(time:toDays())

      local showShortHandForm = false
      local showSeasons = false

      if args[#args] == "-s" then
        showShortHandForm = true
        table.remove(args, #args)
      elseif args[#args] == "-season" then
        showSeasons = true
        table.remove(args, #args)
      end

      local sj = dpf.loadjson("savedata/shop.json", defaultshopsave)
      local shopstr = ""
      for i,v in ipairs(sj.cards) do
	    if uj.lang == "ko" then
		  _G['tokentext'] = lang.shop_token_1 .. v.price .. lang.shop_token_2
		else
		  _G['tokentext'] = v.price .. lang.shop_token_1 .. (v.price == 1 and "" or lang.needs_plural_s == true and lang.plural_s)
		end
        if showShortHandForm == true then
          shopstr = shopstr .. "\n**"..cdb[v.name].name.."** (".. tokentext .. ") x"..v.stock .. " | ("..v.name..")"
        elseif showSeasons == true then
          shopstr = shopstr .. "\n**"..cdb[v.name].name.."** (".. tokentext .. ") x"..v.stock .. " | (Season "..cdb[v.name].season..")"
        else
          shopstr = shopstr .. "\n**"..cdb[v.name].name.."** (".. tokentext .. ") x"..v.stock
        end
      end
      for i,v in ipairs(sj.consumables) do
	    if uj.lang == "ko" then
		  _G['tokentext'] = lang.shop_token_1 .. v.price .. lang.shop_token_2
		else
		  _G['tokentext'] = v.price .. lang.shop_token_1 .. (v.price == 1 and "" or lang.needs_plural_s == true and lang.plural_s)
		end
        if showShortHandForm == true then
          shopstr = shopstr .. "\n**"..consdb[v.name].name.."** (".. tokentext .. ") x"..v.stock .. " | ("..v.name..")"
        else
          shopstr = shopstr .. "\n**"..consdb[v.name].name.."** (".. tokentext .. ") x"..v.stock
        end
      end


      if showShortHandForm == true then
	    if uj.lang == "ko" then
		  _G['tokentext'] = lang.shop_token_1 .. sj.price .. lang.shop_token_2
		else
		  _G['tokentext'] = sj.itemprice .. lang.shop_token .. (sj.itemprice == 1 and "" or lang.needs_plural_s == true and lang.plural_s)
		end
        shopstr = shopstr .. "\n**"..itemdb[sj.item].name.."** (" .. tokentext ..") x"..sj.itemstock.." | ("..sj.item..")"
      else
        shopstr = shopstr .. "\n**"..itemdb[sj.item].name.."** (" .. tokentext ..") x"..sj.itemstock
      end

      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_shop,
        description = lang.looking_shop,
        fields = {{
          name = lang.shop_selling,
          value = shopstr,
          inline = true
        }},
        image = {url = "attachment://shop.png"}},
        files = {getshopimage()}}
      if not uj.togglechecktoken then
        message.channel:send(lang.checktoken_1 .. uj.tokens .. lang.checktoken_2 .. (uj.tokens ~= 1 and lang.needs_plural_s == true and lang.plural_s or "") .. lang.checktoken_3)
      end
    elseif (request == "wolf")  then
      local sj = dpf.loadjson("savedata/shop.json", defaultshopsave)
      local time = sw:getTime()
      checkforreload(time:toDays())
      --extremely jank implementation, please make this cleaner if possible
      local minutesleft = math.ceil((26/24 - time:toDays() + sj.lastrefresh) * 24 * 60)
      print(minutesleft)
      local durationtext = ""
      if math.floor(minutesleft / 60) > 0 then
        durationtext = math.floor(minutesleft / 60) .. lang.time_hour
        if lang.needs_plural_s == true then
			if math.floor(minutesleft / 60) ~= 1 then durationtext = durationtext .. lang.plural_s end
		end
      end
      if minutesleft % 60 > 0 then
        if durationtext ~= "" then durationtext = durationtext .. lang.time_and end
        durationtext = durationtext .. minutesleft % 60 .. lang.time_minute
		if lang.needs_plural_s == true then
			if minutesleft % 60 ~= 1 then durationtext = durationtext .. lang.plural_s end
		end
      end
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_wolf,
        description = lang.looking_wolf_1 .. durationtext .. lang.looking_wolf_2,
      }}
    elseif (request == "ghost")  then 
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_ghost,
        description = lang.looking_ghost,
      }}
    elseif (request == "photo" or request == "framed photo") then
      local randomimages = {
        "https://cdn.discordapp.com/attachments/829197797789532181/880110700989673472/okamii_triangle_frame.png",
        "https://cdn.discordapp.com/attachments/829197797789532181/880302232338333747/okamii_triangle_frame_2.png",
        "https://cdn.discordapp.com/attachments/829197797789532181/880302252278034442/okamii_triangle_frame_3.png"
      }
      local imageindex = (uj.equipped == "okamiiscollar" and math.random(#randomimages) or 1)
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = lang.looking_at_photo,
        description = lang.looking_photo .. (imageindex ~= 1 and lang.looking_photo_ookami or ""),
        image = {url = randomimages[imageindex]}
      }}
    else
      found = false
    end
  end
  

  if not found then ----------------------------------NON-ROOM ITEMS GO HERE!--------------------------------------------------
    if string.lower(mt[1]) == "card factory" or string.lower(mt[1]) == "factory" or string.lower(mt[1]) == "cardfactory" or string.lower(mt[1]) == "the card factory" then --TODO: move these to not found
      message.channel:send {
        content = ':eye:`the card factory looks back`:eye:'
      }
    elseif string.lower(mt[1]) == "token"  then
      message.channel:send{embed = {
        color = 0x85c5ff,
        title = "Looking at Token...",
        description = 'You do not know how, but lots of these **Tokens** have been showing up recently. If only there were somewhere to **Use** them...',
        image = {
          url = 'https://cdn.discordapp.com/attachments/829197797789532181/829255830485598258/token.png'
        }
      }}
    
    
    else
      message.channel:send("Sorry, but I cannot find " .. mt[1] .. ".")
      uj.timeslooked = uj.timeslooked - 1
    end
  end

  dpf.savejson("savedata/" .. message.author.id .. ".json",uj)
end
return command
  
