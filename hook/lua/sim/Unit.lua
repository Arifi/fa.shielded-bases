local oldUnit = Unit
Unit = Class(oldUnit) {

	-------------------------------------------------------------------------------------------
    ---- TOGGLES
    -------------------------------------------------------------------------------------------
     OnScriptBitSet = function(self, bit)
		oldUnit.OnScriptBitSet(self, bit)
        if bit == 0 then --Shield toggle
            --self:PlayUnitAmbientSound( 'ActiveLoop' )
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
	
	EnableShield = function(self)
        self:SetScriptBit('RULEUTC_ShieldToggle', true)
        if self.MyShield then
            self.MyShield:TurnOn()
			self.Economy.MaintenanceConsumptionPerSecondEnergy = 9,
        end
    end,

    DisableShield = function(self)
        self:SetScriptBit('RULEUTC_ShieldToggle', false)
        if self.MyShield then
            self.MyShield:TurnOff()
        end
    end,
}