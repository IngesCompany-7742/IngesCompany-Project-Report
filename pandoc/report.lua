--[[
Adapts the report to the PDF without changing the Markdown sources.

- Wraps the HTML cover of README.md (<div align="center"> ... </div>) in a
  "cover" section, so report.css can lay it out as a single page.
- Inside the cover, turns the member list (aligned with &nbsp; on GitHub)
  into a two-column table and removes the trailing colons of the labels.
- Inserts the table of contents ("Contenido") before the first chapter,
  leaving the cover headings out of it. Page numbers come from report.css.
]]

local NBSP = "\194\160"

local function count(text, pattern)
  local _, n = text:gsub(pattern, "")
  return n
end

-- Finds the cover block range, taking nested <div> elements into account.
local function find_cover(blocks)
  local first, depth = nil, 0
  for i, block in ipairs(blocks) do
    local is_html = block.t == "RawBlock" and block.format == "html"
    if not first and is_html and block.text:match('^<div align="center">') then
      first = i
    end
    if first and is_html then
      depth = depth + count(block.text, "<div") - count(block.text, "</div>")
      if depth == 0 then
        return first, i
      end
    end
  end
end

-- Line breaks can be Markdown breaks or raw <br> tags.
local function is_break(inline)
  return inline.t == "LineBreak"
    or (inline.t == "RawInline" and inline.format == "html" and inline.text:match("^<br%s*/?>$"))
end

-- Splits a paragraph into lines at its line breaks.
local function split_lines(inlines)
  local lines, current = {}, pandoc.Inlines({})
  for _, inline in ipairs(inlines) do
    if is_break(inline) then
      table.insert(lines, current)
      current = pandoc.Inlines({})
    else
      current:insert(inline)
    end
  end
  table.insert(lines, current)
  return lines
end

-- "U202321425 &nbsp; &nbsp; Angulo Ramírez, Marcelo" -> code, name
local function member_row(line)
  local text = pandoc.utils.stringify(line):gsub(NBSP, " ")
  return text:match("^%s*(%S+)%s+(.-)%s*$")
end

local function members_table(para)
  local rows = {}
  for index, line in ipairs(split_lines(para.content)) do
    local code, name = member_row(line)
    if code then
      local cell = index == 1 and "th" or "td"
      table.insert(rows, string.format("<tr><%s>%s</%s><%s>%s</%s></tr>",
        cell, code, cell, cell, name, cell))
    end
  end
  return pandoc.RawBlock("html",
    '<table class="members">' .. table.concat(rows) .. "</table>")
end

local function is_members_list(block)
  if block.t ~= "Para" then
    return false
  end
  local has_break = false
  for _, inline in ipairs(block.content) do
    if is_break(inline) then
      has_break = true
    end
  end
  return has_break and pandoc.utils.stringify(block.content):match("^Código") ~= nil
end

-- "NRC:" -> "NRC", "Integrantes:" -> "Integrantes"
local function without_colon(block)
  return block:walk({
    Str = function(str)
      if str.text:match(":$") then
        return pandoc.Str(str.text:sub(1, -2))
      end
    end,
  })
end

local function build_cover(blocks)
  local cover = pandoc.List()
  for _, block in ipairs(blocks) do
    if is_members_list(block) then
      cover:insert(members_table(block))
    elseif block.t == "Para" then
      cover:insert(without_colon(block))
    else
      cover:insert(block)
    end
  end
  return pandoc.Div(cover, pandoc.Attr("", { "cover" }))
end

local function find_first_chapter(blocks)
  for i, block in ipairs(blocks) do
    if block.t == "Header" and block.level == 1 then
      return i
    end
  end
end

function Pandoc(doc)
  local blocks = doc.blocks
  local cover_first, cover_last = find_cover(blocks)
  if cover_first then
    local cover_blocks = pandoc.List()
    for _ = cover_first, cover_last do
      cover_blocks:insert(blocks:remove(cover_first))
    end
    blocks:insert(cover_first, build_cover(cover_blocks))
  end

  local first_chapter = find_first_chapter(blocks)
  if first_chapter then
    local content = pandoc.Blocks({})
    for i = (cover_first or 0) + 1, #blocks do
      content:insert(blocks[i])
    end
    local toc = pandoc.structure.table_of_contents(content, { toc_depth = 3 })
    blocks:insert(first_chapter, pandoc.Div(
      { pandoc.Para({ pandoc.Strong("Contenido") }), toc },
      pandoc.Attr("", { "toc" })
    ))
  end

  doc.blocks = blocks
  return doc
end
