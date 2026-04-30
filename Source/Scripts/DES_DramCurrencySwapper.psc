Scriptname DES_DramCurrencySwapper extends ReferenceAlias

Quest Property DES_CurrencyFramework auto
Actor Property PlayerRef auto
MiscObject Property DES_Dram Auto 

;--------------------------------------------------

FormList Property DES_RentRoomLocationExclusions  Auto
Location Property DLC2RavenRockLocation auto
Location Property DLC2TelMithrynLocation auto
float goldValue

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

	IF (Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).DramValue != goldValue
		Utility.Wait(5)
		(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).DramValue = goldValue
	ENDIF
endFunction

;--------------------------------------------------

GlobalVariable Property RoomCost auto  
GlobalVariable Property DES_DramRoomCost auto  
GlobalVariable Property DES_UlfricChanceNone auto  
globalvariable property DES_DramWorth auto

Function UpdateCosts()
	float DramRoomCost = RoomCost.GetValue()*DES_DramWorth.GetValue()
	DES_DramRoomCost.SetValue(DramRoomCost)
	GetOwningQuest().UpdateCurrentInstanceGlobal(DES_DramRoomCost)
	(GetOwningQuest() as DES_ExchangeDramsFunctions).Ulfric = (Quest.GetQuest("DES_UlfricWindhelmServices") as QF_DES_UlfricWindhelmService_03000002).DecreeSceneComplete
endFunction

;--------------------------------------------------

EVENT OnInit()
	InitializeThings()
ENDEVENT

;--------------------------------------------------

EVENT OnPlayerGameLoad()
	InitializeThings()
ENDEVENT

;--------------------------------------------------

Formlist Property DES_DramLocations auto
Perk Property DES_MorrowindPriceAdjustmentPerk auto

EVENT OnLocationChange(Location akOldLoc, Location akNewLoc)
	UpdateCosts()
	(DES_CurrencyFramework as DES_CurrencyFramework_Functions).SwapCurrency(DES_DramLocations, DES_MorrowindPriceAdjustmentPerk, DES_Dram)
ENDEVENT