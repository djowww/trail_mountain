    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

function distance(x1, y1, z1, x2, y2, z2)
  return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2 + (z2 - z1) ^ 2)
end

function DrawText3D(x, y, z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local px, py, pz = table.unpack(GetGameplayCamCoords())
  local dist = #(vector3(px, py, pz) - vector3(x, y, z))
  local scale = (1 / dist) * 2

  if onScreen then
    SetTextScale(0.0, 0.47)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    -- Adicionar retângulo
    local factor = string.len(text) / 370
    DrawRect(_x, _y + 0.0200, 0.03 + factor, 0.03, 0, 0, 0, 170) -- Retângulo preto
     DrawMarker(29, -441.01, 1595.32, 359.31, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.8, 0.8, 0.8, 255, 128, 0, 110, false, true, 2, nil, nil, false)
  end
  end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local dist = distance(coords.x, coords.y, coords.z, -441.10, 1595.08, 358.47)
    if dist < 2.0 then -- altere esse valor para ajustar a distância de detecção
      DrawText3D(-441.10, 1595.42, 358.80 + 0.2, "~y~Pressione 'E' para interagir") -- altere o texto como desejar
      if IsControlJustPressed(0, 38) then -- altere o valor para usar uma tecla diferente
      local vehicleHash = GetHashKey("sanchez")
      RequestModel(vehicleHash)
      while not HasModelLoaded(vehicleHash) do
        Citizen.Wait(0)
      end
      local vehicle = CreateVehicle(vehicleHash, playerCoords.x, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed), true, false)
      TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
      SetVehicleEngineOn(vehicle, true, true)
      SetVehicleUndriveable(vehicle, false)
      SetEntityAsMissionEntity(vehicle, true, true)
      SetModelAsNoLongerNeeded(vehicleHash)
      --break -- termina o loop para que a moto não seja dada repetidamente enquanto o jogador estiver perto da coordenada
      end
    end
  end
end)













