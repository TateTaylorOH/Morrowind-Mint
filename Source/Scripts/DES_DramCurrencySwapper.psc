Scriptname DES_DramCurrencySwapper extends ReferenceAlias

Actor Property PlayerREF Auto
Form Property DES_Dram Auto 
Perk Property DES_MorrowindPriceAdjustmentPerk auto

Location Property DLC2RavenRockLocation auto
Location Property DLC2TelMithrynLocation auto

Formlist Property DES_DramSeptimLocations auto
Formlist Property DES_DramFairMerchants auto

Quest Property DES_DramMorrowindServicesQuest auto

FormList Property DES_RentRoomLocationExclusions  Auto
GlobalVariable Property RoomCost auto  
GlobalVariable Property DES_DramRoomCost auto  
GlobalVariable Property DES_UlfricChanceNone auto  

Bool ShouldRevertCurrency
Form LastCurrency

globalvariable property DES_DramWorth auto

float goldValue

Import SEA_BarterFunctions 

EVENT OnInit()
	InitializeThings()
ENDEVENT

EVENT OnPlayerGameLoad()
	InitializeThings()
ENDEVENT

EVENT OnLocationChange(Location akOldLoc, Location akNewLoc)
	IF DES_DramSeptimLocations.HasForm(PlayerRef.GetCurrentLocation()) || DES_DramSeptimLocations.HasForm(PlayerRef.GetCurrentLocation().GetParent())
	;debug.messagebox("We are in Morrowind.")
		IF (PlayerREF.HasPerk(DES_MorrowindPriceAdjustmentPerk))
			PlayerREF.RemovePerk(DES_MorrowindPriceAdjustmentPerk)
		ENDIF
		;debug.notification("LastCurrency is " + LastCurrency.GetName())
		ShouldRevertCurrency = False
		IF (!LastCurrency)
			ShouldRevertCurrency = True
		ENDIF
		SetCurrency(DES_Dram)
		float DramRoomCost = RoomCost.GetValue()*DES_DramWorth.GetValue()
		;debug.notification(RoomCost.GetValue() + " * " + DES_DramWorth.GetValue() + " = " + dramroomcost)
		DES_DramRoomCost.SetValue(DramRoomCost)
		DES_DramMorrowindServicesQuest.UpdateCurrentInstanceGlobal(DES_DramRoomCost)
		(DES_DramMorrowindServicesQuest as DES_ExchangeDramsFunctions).Ulfric = (Quest.GetQuest("DES_UlfricWindhelmServices") as DES_ExchangeSeptimsFunctions).DecreeSceneComplete
		;debug.notification("Dram RoomCost = " + DES_DramRoomCost.GetValue())	
	ELSEIF !DES_DramSeptimLocations.HasForm(PlayerRef.GetCurrentLocation()) && !DES_DramSeptimLocations.HasForm(PlayerRef.GetCurrentLocation().GetParent())
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
		DES_UlfricChanceNone.SetValue(0)
	ENDIF
	
	goldValue = 1/DES_DramWorth.GetValue()
	DES_Dram.SetGoldValue(goldValue as int)

	IF (Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).DramValue != 0.33
		Utility.Wait(5)
		(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).DramValue = 0.33
	ENDIF
	
endFunction
