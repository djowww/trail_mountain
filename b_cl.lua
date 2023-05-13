Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local x, y, z = string.format("%.2f", playerCoords.x), string.format("%.2f", playerCoords.y), string.format("%.2f", playerCoords.z)
        DrawCoords(x, y, z)
    end
end)

function DrawCoords(x, y, z)
    local coordsColor = { r = 0, g = 128, b = 255, a = 255 }
    local rectColor = { r = 0, g = 0, b = 0, a = 100 }
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(0.4, 0.4)
    SetTextColour(coordsColor.r, coordsColor.g, coordsColor.b, coordsColor.a)
    SetTextDropshadow(0, 0, 0, 0, coordsColor.a)
    SetTextEdge(2, 0, 0, 0, coordsColor.a)
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString("X: ~r~" .. x .. " ~w~Y: ~g~" .. y .. " ~w~Z: ~b~" .. z)
    DrawRect(0.5, 0.88, 0.1, 0.01, rectColor.r, rectColor.g, rectColor.b, rectColor.a)
    DrawText(0.5, 0.88)
end










