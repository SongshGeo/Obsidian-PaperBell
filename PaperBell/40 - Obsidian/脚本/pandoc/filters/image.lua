--[[
  Process images
  Supports caption, Pandoc attributes, and Obsidian image alias.
  Also supports inline plots and pandoc-crossref subplots.

  Syntax: ![caption {attributes} | alias](/path/to/image)
  Example: ![caption {width=70% #fig:label} | 500x300](/path/to/image)
  All components are optional

  By github.com/zcysxy
--]]

local function get_raw_tex(para)
	para = para:walk {
		Math = function(el) return "$" .. el.text .. "$" end,
		Emph = function(el) return "\\textit{" .. pandoc.utils.stringify(el.content) .. "}" end,
		Strong = function(el) return "\\textbf{" .. pandoc.utils.stringify(el.content) .. "}" end,
		Code = function(el) return "\\textit{" .. el.text .. "}" end
	}
	return para
end

function Image(el)
	-- Remove Obsidian image alias
	local pipe = false
	el.caption = el.caption:walk {
		Str = function(s)
			if pipe == true then
				return nil
			else
				a, b = s.text:gsub('|.*', '')
				if b == 1 then pipe = true end
				return pandoc.Str(a)
			end
		end,
	}
	caption = pandoc.utils.stringify(get_raw_tex(el.caption)):gsub('T', 'hello')
	caption = caption:gsub('|.*', '')

	-- Assign attributes
	attr_str = caption:match('{[^}]*}%s*$')
	if attr_str then
		attr = pandoc.read('![]()' .. attr_str, 'markdown').blocks[1].content[1].attr
		el.attr = attr
	end

	-- Extract caption
	if not (caption == nil or caption == '') then
		caption = pandoc.read(caption:gsub('{[^}]*}%s*$', ''), 'markdown')
		if next(caption.blocks) == nil then
			caption = ""
		else
			caption = caption.blocks[1].content
		end
	end
	el.caption = caption
	return el
end

function Figure(el)
	if #el.caption.long >= 1 then
		caption = pandoc.utils.stringify(get_raw_tex(el.caption.long[1].content))
		caption = caption:gsub('|.*', '')
		attr_str = caption:match('{[^}]*}%s*$')
		if attr_str then
			attr = pandoc.read('![]()' .. attr_str, 'markdown').blocks[1].content[1].attr
			el.attr = attr
			el.content[1].content[1].attr = attr
		end

		caption = pandoc.read(caption:gsub('{[^}]*}%s*$', ''), 'latex')
		if next(caption.blocks) == nil then
			caption = ""
		else
			caption = caption.blocks[1].content
		end
		el.caption.long[1].content = caption
		el.content[1].content[1].caption = caption
	end
	return el
end
