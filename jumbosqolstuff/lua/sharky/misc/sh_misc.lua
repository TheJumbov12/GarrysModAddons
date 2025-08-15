hook.Add( "OnLuaError", "JMountCheckError", function( error, realm, stack, name, addon_id )
    if name == "jumbosqolstuff" then
        print("[Jumbo's Mount Checker] An Error has occured on the", realm, "! Now printing error...")
        print("-")
        print(error)
        print("-")
    end
end)