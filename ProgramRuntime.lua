--[[

    add-on: Moneytor
    author: git.ruderalis.fr
    source: addon.ruderalis.fr/moneytor

  ]]

local _, Moneytor = ...

local currentMoney, init = 0, false

Moneytor.Frame.Main:RegisterEvent('PLAYER_MONEY')

Moneytor.Frame.Main:RegisterEvent('PLAYER_ENTERING_WORLD')

Moneytor.Frame.Main:SetScript('OnEvent', function(self, event)

    if event == 'PLAYER_ENTERING_WORLD'
      then

        currentMoney = GetMoney()

        init = true

        return

    end

    if not init
      then

        return

    end

    local nextMoney, report = GetMoney(), nil

    if nextMoney < currentMoney
      then

        report = Ruderalib.Color:ColorString('[ -', Ruderalib.Color.RED)
          .. " "
          .. Ruderalib.Color:ColorString(GetCoinTextureString(currentMoney - nextMoney))
          .. Ruderalib.Color:ColorString(']', Ruderalib.Color.RED)
          .. " = "
          .. Ruderalib.Color:ColorString(GetCoinTextureString(nextMoney))

    elseif nextMoney > currentMoney then

        report = Ruderalib.Color:ColorString('[ +', Ruderalib.Color.GREEN)
          .. " "
          .. Ruderalib.Color:ColorString(GetCoinTextureString(nextMoney - currentMoney))
          .. Ruderalib.Color:ColorString(']', Ruderalib.Color.GREEN)
          .. " = "
          .. Ruderalib.Color:ColorString(GetCoinTextureString(nextMoney))

    end

    if not report
      then

        return

    end

    SendSystemMessage(report)

    currentMoney = nextMoney

end)
