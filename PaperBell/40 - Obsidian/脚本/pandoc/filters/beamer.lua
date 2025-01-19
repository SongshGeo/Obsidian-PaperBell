function Div(el)
  if el.classes[1] == 'hidden' then
    return {}

  elseif el.classes[1] == 'thm' then
    return {pandoc.RawBlock("latex", "\\begin{block}{" .. el.attributes["title"] .. "}")} .. el.content .. {pandoc.RawBlock("latex", "\\end{block}")}

  elseif el.classes[1] == "alertblock" and el.attributes["title"] then
    return {pandoc.RawBlock("latex", "\\begin{alertblock}{" .. el.attributes["title"] .. "}")} .. el.content .. {pandoc.RawBlock("latex", "\\end{alertblock}")}

  else
    return el
  end
end

-- function Strong(elem)
--   return pandoc.SmallCaps(elem.c)
-- end

function CodeBlock(block)
  if block.classes[1] == 'ad-rmk' then
    --return {}
    return {pandoc.RawBlock("latex", "\\begin{alertblock}{Remark}")} .. pandoc.read(block.text, 'markdown').blocks .. {pandoc.RawBlock("latex", "\\end{alertblock}")}
  end
end
