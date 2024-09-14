Scriptname DES_DramCurrencySwapper extends ReferenceAlias

Actor Property PlayerREF Auto
Form Property DES_Dram Auto 
Perk Property DES_MorrowindPriceAdjustmentPerk auto

Location Property DLC2RavenRockLocation auto
Location Property DLC2TelMithrynLocation auto

Bool ShouldRevertCurrency
Form LastCurrency

Import SEA_BarterFunctions 

EVENT OnLocationChange(Location akOldLoc, Location akNewLoc)
	IF PlayerRef.IsInLocation(DLC2RavenRockLocation) || PlayerRef.IsInLocation(DLC2TelMithrynLocation)
	;debug.messagebox("We are in Morrowind.")
		IF (PlayerREF.HasPerk(DES_MorrowindPriceAdjustmentPerk))
			PlayerREF.RemovePerk(DES_MorrowindPriceAdjustmentPerk)
		ENDIF
		IF !PlayerRef.IsInLocation(DLC2TelMithrynLocation)
			PlayerREF.AddPerk(DES_MorrowindPriceAdjustmentPerk)
		ENDIF
		;debug.notification("LastCurrency is " + LastCurrency.GetName())
		ShouldRevertCurrency = False
		IF (!LastCurrency)
			ShouldRevertCurrency = True
		ENDIF
		SetCurrency(DES_Dram)
	ELSEIF !PlayerRef.IsInLocation(DLC2RavenRockLocation) && !PlayerRef.IsInLocation(DLC2TelMithrynLocation)
	;debug.messagebox("We are not in Morrowind.")
		IF (ShouldRevertCurrency)
			ResetCurrency()
			;debug.notification("ResetCurrency")
		ELSE
			SetCurrency(LastCurrency)
			;debug.notification("Set Currency to " + LastCurrency.GetName())
		ENDIF
		PlayerREF.RemovePerk(DES_MorrowindPriceAdjustmentPerk)
		LastCurrency = GetCurrency()
	ENDIF
ENDEVENT
