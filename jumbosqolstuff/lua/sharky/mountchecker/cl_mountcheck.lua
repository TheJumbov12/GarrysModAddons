// Unless you know what you are doing DON'T TOUCH

if JQOL.config.mountcheck then
    print("[Jumbo's Mount Checker] Starting...")
    if file.Exists( "mountchecksettings.txt", "DATA" ) then
        RunMountCheck1 = file.Read( "mountchecksettings.txt", "DATA" )
        RunMountCheck2 = util.JSONToTable(RunMountCheck1)
    else
        enabled={enablemountwindow = true}
        file.Write( "mountchecksettings.txt", util.TableToJSON(enabled) )
        RunMountCheck1 = file.Read( "mountchecksettings.txt", "DATA" )
        RunMountCheck2 = util.JSONToTable(RunMountCheck1)
    end
    tf2 = true
    hl2 = true
    l4d2 = true
    css = true
    OpenWarningMountWindow = false
        for _, v in ipairs(engine.GetGames()) do
            if v["mounted"] == false then
                if v["title"] == "Counter-Strike: Source" then
                    print("[Jumbo's Mount Checker] Game not mounted: " .. v["title"])
                    print("[Jumbo's Mount Checker] Download it at 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/css-content-gmodcontent.zip'")
                    css = false
                    OpenWarningMountWindow = true
                end
                if v["title"] == "Half-Life 2 & Episodes" then
                    print("[Jumbo's Mount Checker] Game not mounted: " .. v["title"])
                    print("[Jumbo's Mount Checker] Download it at 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/hl2ep1-content-gmodcontent.zip'")
                    print("[Jumbo's Mount Checker] Download it at 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/hl2ep2-content-gmodcontent.zip'")
                    hl2 = false
                    OpenWarningMountWindow = true
                end
                if v["title"] == "Team Fortress 2" then
                    print("[Jumbo's Mount Checker] Game not mounted: " .. v["title"])
                    print("[Jumbo's Mount Checker] Download it at 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/tf2-content-gmodcontent.zip'")
                    tf2 = false
                    OpenWarningMountWindow = true
                end
                if v["title"] == "Left 4 Dead 2" then
                    print("[Jumbo's Mount Checker] Game not mounted: " .. v["title"])
                    print("[Jumbo's Mount Checker] Download it at 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/l4d2-content-gmodcontent.zip'")
                    l4d2 = false
                    OpenWarningMountWindow = true
                end
            end
        end


    if RunMountCheck2["enablemountwindow"] == false then
        print("[Jumbo's Mount Checker] Skipping Mount Window")
        OpenWarningMountWindow = false
    else
        print("[Jumbo's Mount Checker] Running checks")
    end
    
    print("[Jumbo's Mount Checker] Started!")
end