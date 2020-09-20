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

local topstring = require 'powerlog.topstring'

local function level_translate(level)
    if level >= 50 then
        return "D"
    elseif level >= 40 then
        return "I"
    elseif level >= 30 then
        return "W"
    elseif level >= 20 then
        return "E"
    elseif level == 0 then
        return "Crash!"
    else
        return "Unknown"
    end
end

local function default_gen(logger, record)
    local buffer = {}
    buffer.insert = table.insert
    buffer:insert(string.format("[%s][%s] %s", record.time, record.name, level_translate(record.level)))
    if record.message then
        buffer:insert(" "..record.message)
    end
    if record.err then
        buffer:insert(string.format("\nwith error: %s", record.err))
    end
    if record.object then
        buffer:insert(string.format("\nwith object: %s", topstring(record.object)))
    end
    return table.concat(buffer)
end

local function create_stdout_recvicer(t)
    t = t or {}
    local message_gen = t.gen or default_gen
    return function(logger, record)
        print(message_gen(logger, record))
    end
end

return create_stdout_recvicer
