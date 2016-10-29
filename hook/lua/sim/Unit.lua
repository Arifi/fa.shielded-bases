local oldUnit = Unit
Unit = Class(oldUnit) {

	-------------------------------------------------------------------------------------------
    ---- TOGGLES
    -------------------------------------------------------------------------------------------
     OnScriptBitSet = function(self, bit)
        if bit == 0 then --Shield toggle
            self:PlayUnitAmbientSound( 'ActiveLoop' )
            self:EnableShield()
        elseif bit == 4 then --Production toggle
            self:OnProductionPaused()
        end

        if not self.MaintenanceConsumption then
            self.ToggledOff = true
        end
    end,

    OnScriptBitClear = function(self, bit)
        if bit == 0 then --Shield toggle
            self:StopUnitAmbientSound( 'ActiveLoop' )
            self:DisableShield()
        elseif bit == 4 then --Production toggle
            self:OnProductionUnpaused()
        end

        if self.MaintenanceConsumption then
            self.ToggledOff = false
        end
    end,
}