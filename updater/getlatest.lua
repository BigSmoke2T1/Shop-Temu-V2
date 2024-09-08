local function temu_updater()
    local status = true
    local appdata_path = utils.get_appdata_path("PopstarDevs", "2Take1Menu")

    local filePaths = {
        main = appdata_path.."\\scripts\\temu.luac",
        lib1 = appdata_path.."\\scripts\\lib\\shoptemu\\a.luac",
        lib2 = appdata_path.."\\scripts\\lib\\shoptemu\\nig.luac",
        lib3 = appdata_path.."\\scripts\\lib\\shoptemu\\g.luac",
        lib4 = appdata_path.."\\scripts\\lib\\shoptemu\\tunables.luca",
        lib5 = appdata_path.."\\scripts\\lib\\shoptemu\\misc.luac",
        lib6 = appdata_path.."\\scripts\\lib\\shoptemu\\unlock.luac",
        lib7 = appdata_path.."\\scripts\\lib\\shoptemu\\heist.luac",
    }

    local files = {
        main = "https://raw.githubusercontent.com/yourusername/yourrepo/main/temu.lua",
        lib1 = "https://raw.githubusercontent.com/yourusername/yourrepo/main/lib/shoptemu/file1.lua",
        lib2 = "https://raw.githubusercontent.com/yourusername/yourrepo/main/lib/shoptemu/file2.lua",
        lib3 = "https://raw.githubusercontent.com/yourusername/yourrepo/main/lib/shoptemu/file3.lua",
        lib4 = "https://raw.githubusercontent.com/yourusername/yourrepo/main/lib/shoptemu/file4.lua",
        lib5 = "https://raw.githubusercontent.com/yourusername/yourrepo/main/lib/shoptemu/file5.lua",
        lib6 = "https://raw.githubusercontent.com/yourusername/yourrepo/main/lib/shoptemu/file6.lua",
        lib7 = "https://raw.githubusercontent.com/yourusername/yourrepo/main/lib/shoptemu/file7.lua",
        lib8 = "https://raw.githubusercontent.com/yourusername/yourrepo/main/lib/shoptemu/file8.lua"
    }

    for k, v in pairs(files) do
        local responseCode, file = web.get(v)
        if responseCode == 200 then
            files[k] = file
        else
            status = false
            break
        end
    end

    if status then
        for k, v in pairs(files) do
            local currentFile = io.open(filePaths[k], "w+b")
            if currentFile then
                currentFile:write(v)
                currentFile:flush()
                currentFile:close()
            else
                status = "ERROR REPLACING " .. k
                break
            end
        end
    end

    return status
end

return temu_updater