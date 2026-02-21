local M = {}

function M.get_theme_name()
    local path_start = os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") 
    local config_link = path_start .. "/.config/ghostty/config"

    local config = io.open(config_link, "r")
    if not config then
        print("Error: Cannot open file")
        return nil
    end

    local theme_line = nil

    for line in config:lines() do
        if line:match("^%s*theme") then
            theme_line = line
        end
    end

    config:close()

    if theme_line == nil then
        return nil
    else
        return theme_line:match("^%s*theme%s*=%s*(.-)%s*$")
    end
end


function M.get_colors()
    local theme_name = M.get_theme_name()
    if not theme_name then 
        return nil
    end

    local theme_path = "/usr/share/ghostty/themes/" .. theme_name
    local theme = io.open(theme_path, "r")
    if not theme then
        print("Error: Cannot open file")
        return nil
    end

    local c = {
        palette = {},
    }
    for line in theme:lines() do
        local idx, color = line:match("^%s*palette%s*=%s*(%d+)%s*=%s*(%S+)%s*$")
        if idx then
            c.palette[tonumber(idx)] = color
        else
            local key, value = line:match("^%s*([%w%-]+)%s*=%s*(%S+)%s*$")
            if key then
                c[key] = value
            end
        end
    end

    theme:close()
    return c 

end

return M

