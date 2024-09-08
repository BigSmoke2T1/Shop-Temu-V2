local function temu_updater()
    local status = true
    local appdata_path = utils.get_appdata_path("PopstarDevs", "2Take1Menu")

    local filePaths = {
        main = appdata_path.."\\scripts\\temu.luac",
        lib1 = appdata_path.."\\scripts\\lib\\shoptemu\\a.luac",
        lib2 = appdata_path.."\\scripts\\lib\\shoptemu\\nig.luac",
        lib3 = appdata_path.."\\scripts\\lib\\shoptemu\\g.luac",
        lib4 = appdata_path.."\\scripts\\lib\\shoptemu\\tunables.luac",
        lib5 = appdata_path.."\\scripts\\lib\\shoptemu\\misc.luac",
        lib6 = appdata_path.."\\scripts\\lib\\shoptemu\\unlock.luac",
        lib7 = appdata_path.."\\scripts\\lib\\shoptemu\\heist.luac",
    }

    local base_url = "https://raw.githubusercontent.com/BigSmoke2T1/Shop-Temu-V2/main/updater/script/"
    local files = {
        main = base_url.."temu.luac",
        lib1 = base_url.."lib/shoptemu/a.luac",
        lib2 = base_url.."lib/shoptemu/nig.luac",
        lib3 = base_url.."lib/shoptemu/g.luac",
        lib4 = base_url.."lib/shoptemu/tunables.luac",
        lib5 = base_url.."lib/shoptemu/misc.luac",
        lib6 = base_url.."lib/shoptemu/unlock.luac",
        lib7 = base_url.."lib/shoptemu/heist.luac",
    }

    for k, v in pairs(files) do
        local response, file = web.get(v)
        if response == 200 then
            files[k] = file
        else
            status = "Failed to download " .. k .. " (HTTP " .. response .. ")"
            return status
        end
    end

    if status == true then
        for k, v in pairs(files) do
            local currentFile = io.open(filePaths[k], "w+b")
            if currentFile then
                currentFile:write(v)
                currentFile:flush()
                currentFile:close()
            else
                status = "ERROR REPLACING " .. k
                return status
            end
        end
    end

    return status
end

return temu_updater