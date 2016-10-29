local oldUnit = Unit
Unit = Class(oldUnit) {

	-------------------------------------------------------------------------------------------
    ---- TOGGLES
    -------------------------------------------------------------------------------------------
     OnScriptBitSet = function(self, bit)
        if bit == 0 then --Shield toggle
            self:PlayUnitAmbientSound( 'ActiveLoop' )
            self:EnableShield()
        elseif bit == 1 then --Weapon toggle
            --Amended in individual unit's script file
        elseif bit == 2 then --Jamming toggle
            self:StopUnitAmbientSound( 'ActiveLoop' )
            self:SetMaintenanceConsumptionInactive()
            self:DisableUnitIntel('ToggleBit2', 'Jammer')
        elseif bit == 3 then --Intel toggle
            self:StopUnitAmbientSound( 'ActiveLoop' )
            self:SetMaintenanceConsumptionInactive()
            self:DisableUnitIntel('ToggleBit3', 'RadarStealth')
            self:DisableUnitIntel('ToggleBit3', 'RadarStealthField')
            self:DisableUnitIntel('ToggleBit3', 'SonarStealth')
            self:DisableUnitIntel('ToggleBit3', 'SonarStealthField')
            self:DisableUnitIntel('ToggleBit3', 'Sonar')
            self:DisableUnitIntel('ToggleBit3', 'Omni')
            self:DisableUnitIntel('ToggleBit3', 'Cloak')
            self:DisableUnitIntel('ToggleBit3', 'CloakField')
            self:DisableUnitIntel('ToggleBit3', 'Spoof')
            self:DisableUnitIntel('ToggleBit3', 'Jammer')
            self:DisableUnitIntel('ToggleBit3', 'Radar')
        elseif bit == 4 then --Production toggle
            self:OnProductionPaused()
        elseif bit == 5 then --Stealth toggle
            self:StopUnitAmbientSound( 'ActiveLoop' )
            self:SetMaintenanceConsumptionInactive()
            self:DisableUnitIntel('ToggleBit5', 'RadarStealth')
            self:DisableUnitIntel('ToggleBit5', 'RadarStealthField')
            self:DisableUnitIntel('ToggleBit5', 'SonarStealth')
            self:DisableUnitIntel('ToggleBit5', 'SonarStealthField')
        elseif bit == 6 then --Generic pause toggle
            self:SetPaused(true)
        elseif bit == 7 then --Special toggle
            self:EnableSpecialToggle()
        elseif bit == 8 then --Cloak toggle
            self:StopUnitAmbientSound( 'ActiveLoop' )
            self:SetMaintenanceConsumptionInactive()
            self:DisableUnitIntel('ToggleBit8', 'Cloak')
        end

        if not self.MaintenanceConsumption then
            self.ToggledOff = true
        end
    end,

    OnScriptBitClear = function(self, bit)
        if bit == 0 then --Shield toggle
            self:StopUnitAmbientSound( 'ActiveLoop' )
            self:DisableShield()
        elseif bit == 1 then --Weapon toggle
        elseif bit == 2 then --Jamming toggle
            self:PlayUnitAmbientSound( 'ActiveLoop' )
            self:SetMaintenanceConsumptionActive()
            self:EnableUnitIntel('ToggleBit2', 'Jammer')
        elseif bit == 3 then --Intel toggle
            self:PlayUnitAmbientSound( 'ActiveLoop' )
            self:SetMaintenanceConsumptionActive()
            self:EnableUnitIntel('ToggleBit3', 'Radar')
            self:EnableUnitIntel('ToggleBit3', 'RadarStealth')
            self:EnableUnitIntel('ToggleBit3', 'RadarStealthField')
            self:EnableUnitIntel('ToggleBit3', 'SonarStealth')
            self:EnableUnitIntel('ToggleBit3', 'SonarStealthField')
            self:EnableUnitIntel('ToggleBit3', 'Sonar')
            self:EnableUnitIntel('ToggleBit3', 'Omni')
            self:EnableUnitIntel('ToggleBit3', 'Cloak')
            self:EnableUnitIntel('ToggleBit3', 'CloakField')
            self:EnableUnitIntel('ToggleBit3', 'Spoof')
            self:EnableUnitIntel('ToggleBit3', 'Jammer')
        elseif bit == 4 then --Production toggle
            self:OnProductionUnpaused()
        elseif bit == 5 then --Stealth toggle
            self:PlayUnitAmbientSound( 'ActiveLoop' )
            self:SetMaintenanceConsumptionActive()
            self:EnableUnitIntel('ToggleBit5', 'RadarStealth')
            self:EnableUnitIntel('ToggleBit5', 'RadarStealthField')
            self:EnableUnitIntel('ToggleBit5', 'SonarStealth')
            self:EnableUnitIntel('ToggleBit5', 'SonarStealthField')
        elseif bit == 6 then --Generic pause toggle
            self:SetPaused(false)
        elseif bit == 7 then --Special toggle
            self:DisableSpecialToggle()
        elseif bit == 8 then --Cloak toggle
            self:PlayUnitAmbientSound( 'ActiveLoop' )
            self:SetMaintenanceConsumptionActive()
            self:EnableUnitIntel('ToggleBit8', 'Cloak')
        end

        if self.MaintenanceConsumption then
            self.ToggledOff = false
        end
    end,
}