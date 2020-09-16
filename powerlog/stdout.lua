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
