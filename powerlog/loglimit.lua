

local function create_loglimit(limit, rmstep)
    local real_rmstep = rmstep or 5
    return function(logger)
        if #logger > limit then
            for i = 0, real_rmstep do
                table.remove(logger, 1)
            end
        end
        logger.pointer = #logger
    end
end

return create_loglimit
