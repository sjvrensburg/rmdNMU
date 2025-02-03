-- Table of supported box types and their LaTeX environments
local BOX_TYPES = {
  definition = {
    prefix = "def",
    begin = "\\begin{definition}[%s]\\label{def:%s}\n",
    ending = "\\end{definition}"
  },
  theorem = {
    prefix = "thm",
    begin = "\\begin{theorem}[%s]\\label{thm:%s}\n",
    ending = "\\end{theorem}"
  },
  lemma = {
    prefix = "lem",
    begin = "\\begin{lemma}[%s]\\label{lem:%s}\n",
    ending = "\\end{lemma}"
  },
  proposition = {
    prefix = "prop",
    begin = "\\begin{proposition}[%s]\\label{prop:%s}\n",
    ending = "\\end{proposition}"
  },
  corollary = {
    prefix = "cor",
    begin = "\\begin{corollary}[%s]\\label{cor:%s}\n",
    ending = "\\end{corollary}"
  },
  example = {
    prefix = "ex",
    begin = "\\begin{example}[%s]\\label{ex:%s}\n",
    ending = "\\end{example}"
  },
  remark = {
    prefix = "rem",
    begin = "\\begin{remark}[%s]\\label{rem:%s}\n",
    ending = "\\end{remark}"
  },
  proof = {
    begin = "\\begin{proof}\n",
    ending = "\\end{proof}"
  },
  -- Keep existing box types
  examplebox = {
    begin = "\\begin{examplebox}{%s}\n",
    ending = "\\end{examplebox}"
  },
  warningbox = {
    begin = "\\begin{warningbox}{%s}\n",
    ending = "\\end{warningbox}"
  },
  ideabox = {
    begin = "\\begin{ideabox}{%s}\n",
    ending = "\\end{ideabox}"
  },
  notebox = {
    begin = "\\begin{notebox}{%s}\n",
    ending = "\\end{notebox}"
  },
  tipbox = {
    begin = "\\begin{tipbox}{%s}\n",
    ending = "\\end{tipbox}"
  },
  importantbox = {
    begin = "\\begin{importantbox}{%s}\n",
    ending = "\\end{importantbox}"
  }
}

-- Main filter function for Div elements
function Div(el)
  -- Get the first class as the box type
  local env_type = el.classes[1]

  -- If no valid type, return unchanged
  if not BOX_TYPES[env_type] then
    return el
  end

  -- Get name and ID from attributes
  local name = el.attributes.name or ""
  local id = el.identifier or ""
  local blocks = pandoc.Blocks({})

  -- Special case for proof: no label or name needed
  if env_type == "proof" then
    blocks:extend(pandoc.Blocks({ pandoc.RawBlock("latex", BOX_TYPES[env_type].begin) }))
  else
    -- Ensure name is properly included for special boxes
    if BOX_TYPES[env_type].prefix then
      blocks:extend(pandoc.Blocks({
        pandoc.RawBlock("latex", string.format(BOX_TYPES[env_type].begin, name, id))
      }))
    else
      blocks:extend(pandoc.Blocks({
        pandoc.RawBlock("latex", string.format(BOX_TYPES[env_type].begin, name))
      }))
    end
  end

  -- Add content
  blocks:extend(pandoc.Blocks(el.content))

  -- Close environment
  blocks:extend(pandoc.Blocks({ pandoc.RawBlock("latex", BOX_TYPES[env_type].ending) }))

  return blocks
end

-- Convert references to proper LaTeX references
function Str(el)
  -- Handle @ref(type:label) syntax
  local ref_type, ref_id = el.text:match("^@ref%((%w+):([^%)]+)%)")
  if ref_type and ref_id then
    return pandoc.RawInline("latex", "\\autoref{" .. ref_type .. ":" .. ref_id .. "}")
  end
  return el
end

-- Handle other types of references (like \@ref)
function Code(el)
  -- Handle \@ref(type:label) syntax
  local ref_type, ref_id = el.text:match("^@ref%((%w+):([^%)]+)%)")
  if ref_type and ref_id then
    return pandoc.RawInline("latex", "\\autoref{" .. ref_type .. ":" .. ref_id .. "}")
  end
  return el
end
