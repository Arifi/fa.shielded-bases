local oldUnit = Unit
Unit = Class(oldUnit) {
    OnDamage = function(self, instigator, amount, vector, damageType)
		local newAmount = 2 * amount
		        
        oldUnit.OnDamage(self, instigator, newAmount, vector, damageType)
    end,
}