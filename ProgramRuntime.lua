--[[

    add-on: Moneytor
    author: git.ruderalis.fr
    source: addon.ruderalis.fr/moneytor

    Copyright (C) <2026>  <Ruderalis>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

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

    elseif nextMoney > currentMoney then

        report = Ruderalib.Color:ColorString('[ +', Ruderalib.Color.GREEN)
          .. " "
          .. Ruderalib.Color:ColorString(GetCoinTextureString(nextMoney - currentMoney))
          .. Ruderalib.Color:ColorString(']', Ruderalib.Color.GREEN)

    end

    if not report
      then

        return

    end

    SendSystemMessage(report .. " = "
      .. Ruderalib.Color:ColorString(GetCoinTextureString(nextMoney)))

    currentMoney = nextMoney

end)
