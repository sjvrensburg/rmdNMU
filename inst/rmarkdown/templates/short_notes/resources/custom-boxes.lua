-- custom-boxes.lua

-- Table of supported box types
local BOX_TYPES = {
  examplebox = {
    begin = "\\begin{examplebox}{%s}",
    ending = "\\end{examplebox}"
  },
  warningbox = {
    begin = "\\begin{warningbox}{%s}",
    ending = "\\end{warningbox}"
  },
  ideabox = {
    begin = "\\begin{ideabox}{%s}",
    ending = "\\end{ideabox}"
  },
  notebox = {
    begin = "\\begin{notebox}{%s}",
    ending = "\\end{notebox}"
  },
  tipbox = {
    begin = "\\begin{tipbox}{%s}",
    ending = "\\end{tipbox}"
  },
  importantbox = {
    begin = "\\begin{importantbox}{%s}",
    ending = "\\end{importantbox}"
  }
}

-- Helper function to safely get box name from attributes
local function get_box_name(attributes)
  return attributes.name or ""
end

-- Helper function to create latex environment blocks
local function create_environment(box_type, name, content)
  if not BOX_TYPES[box_type] then
    return pandoc.Blocks(content)
  end

  -- Create the beginning and ending blocks
  local begin = pandoc.RawBlock(
    "latex",
    string.format(BOX_TYPES[box_type].begin, name)
  )
  local ending = pandoc.RawBlock(
    "latex",
    BOX_TYPES[box_type].ending
  )

  -- Create a new blocks object
  local blocks = pandoc.Blocks({begin})

  -- Add content blocks
  for _, item in ipairs(content) do
    blocks:extend(pandoc.Blocks({item}))
  end

  -- Add ending block
  blocks:extend(pandoc.Blocks({ending}))

  return blocks
end

-- Main filter function for Div elements
function Div(el)
  -- Get the first class as the box type
  local box_type = el.classes[1]

  -- If no valid box type, return unchanged
  if not box_type or not BOX_TYPES[box_type] then
    return el
  end

  -- Get the box name from attributes
  local name = get_box_name(el.attributes)

  -- Create the environment blocks and return new Div
  local blocks = create_environment(box_type, name, el.content)
  return pandoc.Div(blocks)
end
