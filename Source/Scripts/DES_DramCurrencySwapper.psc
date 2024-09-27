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
Form LastLocation

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
	int i = DES_DramSeptimLocations.Find(akNewLoc)
	IF (PlayerRef.IsInLocation(DES_DramSeptimLocations.GetAt(i) as Location))
		SwapToDrams()
	ELSEIF i == -1
	;debug.messagebox("We are not in Morrowind.")
		ResetCurrency()
		;debug.notification("ResetCurrency")
		PlayerREF.RemovePerk(DES_MorrowindPriceAdjustmentPerk)
	ENDIF
	LastLocation = akNewLoc
ENDEVENT

Event OnCurrencyRevert(Form a_kOldCurrency)
	int i = DES_DramSeptimLocations.Find(LastLocation)
	IF (PlayerRef.IsInLocation(DES_DramSeptimLocations.GetAt(i) as Location))
		SwapToDrams()
	ENDIF
	LastLocation = NONE
EndEvent

Function SwapToDrams()
	;debug.messagebox("We are in Morrowind.")
	IF (PlayerREF.HasPerk(DES_MorrowindPriceAdjustmentPerk))
		PlayerREF.RemovePerk(DES_MorrowindPriceAdjustmentPerk)
	ENDIF
	;debug.notification("LastCurrency is " + LastCurrency.GetName())
	SetCurrency(DES_Dram)
	float DramRoomCost = RoomCost.GetValue()*DES_DramWorth.GetValue()
	;debug.notification(RoomCost.GetValue() + " * " + DES_DramWorth.GetValue() + " = " + dramroomcost)
	DES_DramRoomCost.SetValue(DramRoomCost)
	DES_DramMorrowindServicesQuest.UpdateCurrentInstanceGlobal(DES_DramRoomCost)
	(DES_DramMorrowindServicesQuest as DES_ExchangeDramsFunctions).Ulfric = (Quest.GetQuest("DES_UlfricWindhelmServices") as DES_ExchangeSeptimsFunctions).DecreeSceneComplete
	;debug.notification("Dram RoomCost = " + DES_DramRoomCost.GetValue())
endFunction


Function InitializeThings()
	SEA_BarterFunctions.RegisterFormForAllEvents(getowningquest())

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

	IF (Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).DramValue != goldValue
		Utility.Wait(5)
		(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).DramValue = goldValue
	ENDIF
	
endFunction
