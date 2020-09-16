local function topstring(t)
    if type(t) == 'table' then
        local buffer =  {}
        for k,v in pairs(t) do
            table.insert(buffer, string.format("%s=%s", topstring(k), topstring(v)))
        end
        return '{'..table.concat(buffer, ',')..'}'
    elseif type(t) == 'string' then
        return '"'..t..'"'
    elseif type(t) == 'number' then
        return tostring(t)
    else
        return '<'..tostring(t)..'>'
    end
end

return topstring
