Scriptname DES_DramCurrencySwapper extends ReferenceAlias

Actor Property PlayerREF Auto
Form Property DES_Dram Auto 
Perk Property DES_MorrowindPriceAdjustmentPerk auto

Location Property DLC2RavenRockLocation auto
Location Property DLC2TelMithrynLocation auto

Quest Property DES_DramMorrowindServicesQuest auto

FormList Property DES_RentRoomLocationExclusions  Auto
GlobalVariable Property RoomCost auto  
GlobalVariable Property DES_DramRoomCost auto  

Bool ShouldRevertCurrency
Form LastCurrency

Import SEA_BarterFunctions 

EVENT OnInit()
	InitializeThings()
ENDEVENT

EVENT OnPlayerGameLoad()
	InitializeThings()
ENDEVENT

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
		float DramRoomCost = RoomCost.GetValue()*3
		;debug.notification("Roomcost * 3 = " + dramroomcost)
		DES_DramRoomCost.SetValue(DramRoomCost)
		DES_DramMorrowindServicesQuest.UpdateCurrentInstanceGlobal(DES_DramRoomCost)
		;debug.notification("Dram RoomCost = " + DES_DramRoomCost.GetValue())	
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

Function InitializeThings()
	IF !DES_RentRoomLocationExclusions.HasForm(DLC2RavenRockLocation)
		DES_RentRoomLocationExclusions.AddForm(DLC2RavenRockLocation)
	ENDIF

	IF !DES_RentRoomLocationExclusions.HasForm(DLC2TelMithrynLocation)
		DES_RentRoomLocationExclusions.AddForm(DLC2TelMithrynLocation)
	ENDIF

	IF Game.IsPluginInstalled("WindhelmUsesUlfrics.esp")
		(DES_DramMorrowindServicesQuest as DES_ExchangeDramsFunctions).Ulfric = 1
	ENDIF

	;IF (Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).DramValue != 0.33
	;	Utility.Wait(5)
	;	(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).DramValue = 0.33
	;ENDIF
endFunction
