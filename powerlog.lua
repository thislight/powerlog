
local format = string.format

local powerlog = {
    name = '',
    receivers = {},
    accept_level = 20,
    loghooks = {},
    timeprovider = function(self)
        return os.time()
    end
}

function powerlog:create(name)
    local object = {}
    for k, v in pairs(self) do
        object[k] = v
    end
    object.recvicers = table.pack(table.unpack(self.receivers))
    if object.name == '' then
        object.name = name
    else
        object.name = string.format("%s.%s", object.name, name)
    end
    object.pointer = 0
    return object
end

function powerlog:logrecord(record)
    record.time = self:timeprovider()
    table.insert(self, record)
    self.pointer = self.pointer + 1
    for _, h in ipairs(self.loghooks) do
        h(self, record)
    end
    if record.level <= self.accept_level then
        for _, r in ipairs(self.receivers) do
            r(self, record)
        end
    end
end

function powerlog:cleanlogs()
    while #self > 0 do
        table.remove(self, 1)
    end
end

function powerlog:log(level, message, object, err)
    self:logrecord {
        name = self.name,
        level = level,
        message = message,
        object = object,
        err = err,
    }
end

function powerlog:debug(message, object, err)
    self:log(50, message, object, err)
end

function powerlog:debugf(message, ...)
    if self.accept_level >= 50 then
        self:debug(format(message, ...))
    end
end

function powerlog:info(message, object, err)
    self:log(40, message, object, err)
end

function powerlog:infof(message, ...)
    if self.accept_level >= 40 then
        self:info(format(message, ...))
    end
end

function powerlog:warn(message, object, err)
    self:log(30, message, object, err)
end

function powerlog:warnf(message, ...)
    if self.accept_level >= 30 then
        self:warn(format(message, ...))
    end
end

function powerlog:error(message, object, err)
    self:log(20, message, object, err)
end

function powerlog:errorf(message, ...)
    if self.accept_level >= 20 then
        self:warn(format(message, ...))
    end
end

function powerlog:crash(message, object, err)
    self:log(0, message, object, err)
end

function powerlog:crashf(message, ...)
    if self.accept_level >= 0 then
        self:crash(format(message, ...))
    end
end

return powerlog
