--[[
Adapts the report to the PDF without changing the Markdown sources.

- Wraps the HTML cover of README.md (<div align="center"> ... </div>) in a
  "cover" section, so report.css can lay it out as a single page.
- Inserts the table of contents ("Contenido") before the first chapter,
  leaving the cover headings out of it. Page numbers come from report.css.
]]

local function is_raw_html(block, pattern)
  return block.t == "RawBlock" and block.format == "html" and block.text:match(pattern)
end

local function find_cover(blocks)
  local first, last
  for i, block in ipairs(blocks) do
    if not first and is_raw_html(block, '^<div align="center">') then
      first = i
    elseif first and is_raw_html(block, "^</div>") then
      last = i
      break
    end
  end
  return first, last
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
    local cover = pandoc.List()
    for i = cover_first, cover_last do
      cover:insert(blocks[i])
    end
    for _ = cover_first, cover_last do
      blocks:remove(cover_first)
    end
    blocks:insert(cover_first, pandoc.Div(cover, pandoc.Attr("", { "cover" })))
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
