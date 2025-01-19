function BlockQuote (elem)
  local function titlecase(str)
    return str:sub(1,1):upper() .. str:sub(2,-1)
  end

  --local callout_title_filter = {
      --Str = function (sub_elem)
          --if sub_elem.text:match("^%[%![%a%d%-]+%]$") then
              --return {}
          --else
              --sub_elem.text = sub_elem.text .. '&'
              --return sub_elem
          --end
      --end
  --}

  --local content_string = pandoc.utils.stringify(elem)

  --callout_type = get_callout(content_string)
  callout_type = elem.content[1].content[1].text:match("^%[%!([a-z0-9%-]*)%]")

  if not callout_type then
    return nil
  else
    --local stripped_block = pandoc.walk_block(elem, callout_title_filter)
    -- remove callout type

    if callout_type == "rmk" then
        block_type = "myalertblock"
        callout_type = "remark"
    elseif callout_type == "ex" then
        block_type = "exampleblock"
        callout_type = "example"
    elseif callout_type == "meta" then
        return {}
    else
        block_type = "myblock"
    end
    callout_type = titlecase(callout_type)

    -- get callout title
    callout_title = pandoc.utils.stringify(elem.content[1])
    callout_title = callout_title:gsub("^%[%!([a-z0-9%-]*)%][%+%-]?","")

    latex_end_string = "\\end{".. block_type .. "}"

    if callout_title:match('[^%s]') then
        latex_begin_string = "\\begin{" ..
        block_type .. "}{".. callout_title .. "}"
    else
        latex_begin_string = "\\begin{" ..
        block_type .. "}{".. callout_type .. "}"
    end

    table.remove(elem.content, 1)
    return {pandoc.RawBlock("latex", latex_begin_string)} ..
       elem.content ..
       {pandoc.RawBlock("latex", latex_end_string)}
  end
end
