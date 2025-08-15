// Unless you know what you are doing DON'T TOUCH


function OpenMountWindow(tf2,css,hl2,l4d2)
    local GameTable = {tf2,css,hl2,l4d2}
    --PrintTable(GameTable)
    frame = vgui.Create('Sharky.Window')
    frame:SetMenuSize(Sharky.ScrW*0.7, Sharky.ScrH*0.7)
    frame:SetRounded(true)
    frame:SetPattern('9BIyh0c')
    frame:SetAnimationSpeed(20)

    local category = vgui.Create('Sharky.CollapsibleCategory', frame)
    category:SetPos(Sharky.resFormat(20), Sharky.resFormat(20))
    category:SetSize(Sharky.resFormat(500), Sharky.resFormat(500))
    category:Dock(TOP)
    --category:SetColor(Sharky.TertiaryTone2)
    --category:SetBackgroundColor(Sharky.TertiaryTone0)
    category:DockMargin(Sharky.resFormat(20), Sharky.resFormat(20), Sharky.resFormat(20), Sharky.resFormat(20))
    category:SetText("Jumbo's mount checker")
    category:SetFont('Sharky.30')

    if BRANCH != "x86-64" then
        local test = vgui.Create('Sharky.Label', category)
        test:SetText("We recommend that you use the x64 beta branch. Steam>Settings>Properties>Beta>Chromium")
        test:Dock(TOP)
        test:DockMargin(Sharky.resFormat(20), 0, Sharky.resFormat(20), 0)
        --test:SetAutoWidth(false)
        test:SetWrap(true)
        test:SetAutoStretchVertical(true)
        --test:SetTextAnimationEnabled(false)
        test:SetFont('Sharky.25')
        local test2 = vgui.Create('Sharky.Label', category)
        test2:SetText("--------------------------------------------------------------------------------------------------------------------------------------")
        --test:SetAutoHeight(true)
        test2:Dock(TOP)
        test2:DockMargin(Sharky.resFormat(20), 0, Sharky.resFormat(20), 0)
        --test:SetAutoWidth(false)
        test2:SetWrap(true)
        test2:SetAutoStretchVertical(true)
        --test:SetTextAnimationEnabled(false)
        test2:SetFont('Sharky.25')

        OpenWarningMountWindow = true
    end
    for k, v in ipairs(GameTable) do
        if v == false then
            local test = vgui.Create('Sharky.Label', category)
            if k == 1 then
                test:SetText("Team Fortress 2 is not mounted! Download it at 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/tf2-content-gmodcontent.zip'")
            elseif k == 2 then
                test:SetText("Counter-Strike: Source is not mounted! Download it at 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/css-content-gmodcontent.zip'")
            elseif k == 3 then
                test:SetText("Half-Life 2 & Episodes is not mounted! Download it at 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/hl2ep1-content-gmodcontent.zip' & 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/hl2ep2-content-gmodcontent.zip'")
            elseif k == 4 then
                test:SetText("Left 4 Dead 2 is not mounted! Download it at 'https://downloads-usa.gmodcontent.com/file/gmodcontent-usa/l4d2-content-gmodcontent.zip'")
            elseif k > 5 then
                test:SetText('Something has gone wrong! Contact Jumbo.')

            end
            --test:SetAutoHeight(true)
            test:Dock(TOP)
            test:DockMargin(Sharky.resFormat(20), 0, Sharky.resFormat(20), 0)
            --test:SetAutoWidth(false)
            test:SetWrap(true)
            test:SetAutoStretchVertical(true)
            --test:SetTextAnimationEnabled(false)
            test:SetFont('Sharky.25')
            local test2 = vgui.Create('Sharky.Label', category)
            test2:SetText("--------------------------------------------------------------------------------------------------------------------------------------")
            --test:SetAutoHeight(true)
            test2:Dock(TOP)
            test2:DockMargin(Sharky.resFormat(20), 0, Sharky.resFormat(20), 0)
            --test:SetAutoWidth(false)
            test2:SetWrap(true)
            test2:SetAutoStretchVertical(true)
            --test:SetTextAnimationEnabled(false)
            test2:SetFont('Sharky.25')
        end
    end
end


concommand.Add("OpenMountCheck", function()
    if OpenWarningMountWindow then
        OpenMountWindow(tf2,css,hl2,l4d2)
    else
        print("[Jumbo's Mount Checker] No games to display, all mounted!")
    end
    --OpenMountWindow(false,false,false,false)
end)

concommand.Add("disablemountcheck", function()
    enabled={enablemountwindow = false}
    file.Write( "mountchecksettings.txt", util.TableToJSON(enabled) )
end)

concommand.Add("enablemountcheck", function()
    enabled={enablemountwindow = true}
    file.Write( "mountchecksettings.txt", util.TableToJSON(enabled) )
end)

hook.Add( "InitPostEntity", "JumboMountWindow", function( ply )
    if OpenWarningMountWindow then
        OpenMountWindow(tf2,css,hl2,l4d2)
    end
end)