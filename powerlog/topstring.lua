-- Copyright (C) 2020 thisLight
-- 
-- This file is part of powerlog.
-- 
-- powerlog is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- powerlog is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with powerlog.  If not, see <http://www.gnu.org/licenses/>.

local function topstring(t)
    if type(t) == 'table' then
        local buffer =  {}
        if #t > 0 then
            for i, v in ipairs(t) do
                table.insert(buffer, topstring(v))
            end
        end
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
