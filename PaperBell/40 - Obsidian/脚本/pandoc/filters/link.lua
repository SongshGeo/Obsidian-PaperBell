--[[
 Transform Obsidian wikilinks to Pandoc-recognizable links
 Support combinations of {internal, external} x {no alias, alias} x {file, heading, block} links

  By github.com/zcysxy
--]]

function Link(link)
  local content_type = nil
  local target_type = nil
  local link_type = nil

  if link.title == "wikilink" then
    -- Handling content (display)
    if link.target == pandoc.utils.stringify(link.content) then
      content_type = "noalias"
      if link.target:match("^#") then
        content = nil
      else
        if link.target:match("#%^") then
          content = link.target:gsub('#%^.*', '')
        else
          content = link.content[1].text:gsub('#', ' > ')
        end
      end
    else -- use alias
      content_type = "alias"
      content = link.content[1].text
    end

    -- Handling target
    if link.target:match("^#") then
      link_type = "internal"
      if link.target:match("^#%^") then
        target_type = "block"
        target = link.target:gsub('^#%^', '')
      else
        target_type = "heading"
      end
    else
      link_type = "external"
      if link.target:match("#") then
        if link.target:match("#%^") then
          target_type = "block"
          target = link.target:gsub('#%^.*', '')
        else
          target_type = "heading"
        end
      else
        target_type = "file"
        target = link.target
      end
    end
  end

  -- Heading links
  if (target_type == "heading") or (link.title ~= "wikilink" and link.target:match("^<?#[^%^]")) then
    link.target = link.target:lower()
    link.target = link.target:gsub(' ', '-')
    link.target = link.target:gsub('%%20', '-')
    link.target = link.target:gsub('[^a-zA-Z0-9#%-]', '')
    target = link.target:gsub('^#*', '')
  end

  -- Compose reference
  if link.title == "wikilink" then
    if link_type == "internal" then
      if content_type == "noalias" then
        return pandoc.RawInline("latex", "\\ref{" .. target .. "}")
      elseif content_type == "alias" then
        return pandoc.RawInline("latex", "\\hyperref[" .. target .. "]{" .. content .. "}")
      end
    elseif link_type == "external" then
      link.content = content
      link.target = target
      return link
    end
  end
  return link
end

-- Remove block ids
function Inlines(el)
  if next(el) and el[#el].tag == "Str" and el[#el].text:match('^%^') then
    el[#el] = nil
  end
  return el
end
