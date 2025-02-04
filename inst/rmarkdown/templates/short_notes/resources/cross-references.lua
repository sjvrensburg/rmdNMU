function Cite (cite)
  -- Process only single citations
  if #cite.citations ~= 1 then
    return nil
  end

  local citation = cite.citations[1]
  -- Check if this is a reference
  if citation.mode == "NormalCitation" then
    -- Try to extract type and label
    local ref_type, label = citation.id:match("^(%a+):(.+)$")
    if ref_type and label then
      -- Return appropriate LaTeX reference command
      if ref_type == "def" then
        return pandoc.RawInline("latex", "\\hyperref[def:" .. label .. "]{Definition~\\ref*{def:" .. label .. "}}")
      elseif ref_type == "thm" then
        return pandoc.RawInline("latex", "\\hyperref[thm:" .. label .. "]{Theorem~\\ref*{thm:" .. label .. "}}")
      elseif ref_type == "lem" then
        return pandoc.RawInline("latex", "\\hyperref[lem:" .. label .. "]{Lemma~\\ref*{lem:" .. label .. "}}")
      elseif ref_type == "prop" then
        return pandoc.RawInline("latex", "\\hyperref[prop:" .. label .. "]{Proposition~\\ref*{prop:" .. label .. "}}")
      elseif ref_type == "cor" then
        return pandoc.RawInline("latex", "\\hyperref[cor:" .. label .. "]{Corollary~\\ref*{cor:" .. label .. "}}")
      elseif ref_type == "ex" then
        return pandoc.RawInline("latex", "\\hyperref[ex:" .. label .. "]{Example~\\ref*{ex:" .. label .. "}}")
      elseif ref_type == "rem" then
        return pandoc.RawInline("latex", "\\hyperref[rem:" .. label .. "]{Remark~\\ref*{rem:" .. label .. "}}")
      end
    end
    -- For any other reference, use a basic reference
    return pandoc.RawInline("latex", "\\ref{" .. citation.id .. "}")
  end
  return nil
end
