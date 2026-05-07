Scriptname DES_DramCurrencySwapper extends ReferenceAlias

DES_CurrencyFramework_Functions Property CurrencyFunctions auto
Actor Property PlayerRef auto
MiscObject Property DES_Dram Auto 

;--------------------------------------------------
;FUNCTIONS
;--------------------------------------------------

FormList Property DES_CustomCurrencyLocations Auto
Location Property DLC2RavenRockLocation auto
Location Property DLC2TelMithrynLocation auto

Function Initialize()

	IF !DES_CustomCurrencyLocations.HasForm(DLC2RavenRockLocation)
		DES_CustomCurrencyLocations.AddForm(DLC2RavenRockLocation)
	ENDIF

	IF !DES_CustomCurrencyLocations.HasForm(DLC2TelMithrynLocation)
		DES_CustomCurrencyLocations.AddForm(DLC2TelMithrynLocation)
	ENDIF

	CurrencyFunctions.RegisterModuleQuest("MorrowindUsesDrams.esp", GetOwningQuest().GetFormID())

	IF Game.IsPluginInstalled("WindhelmUsesUlfrics.esp")
		DES_UlfricChanceNone.SetValue(0)
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
	(GetOwningQuest() as DES_DramQuestScript).Ulfric = (Quest.GetQuest("DES_UlfricWindhelmServices")).GetStage()
endFunction

;--------------------------------------------------
;EVENTS
;--------------------------------------------------

EVENT OnInit()
	Utility.Wait(1)
	Initialize()
ENDEVENT

;--------------------------------------------------

EVENT OnPlayerGameLoad()
	IF Game.IsPluginInstalled("WindhelmUsesUlfrics.esp")
		DES_UlfricChanceNone.SetValue(0)
	ENDIF
ENDEVENT

;--------------------------------------------------

Formlist Property DES_DramLocations auto
Perk Property DES_MorrowindPriceAdjustmentPerk auto

EVENT OnLocationChange(Location akOldLoc, Location akNewLoc)
	While CurrencyFunctions.CurrencyIsSwapping
		Utility.Wait(0.1)
	endWhile
	UpdateCosts()
	CurrencyFunctions.SwapCurrency(DES_DramLocations, DES_MorrowindPriceAdjustmentPerk, DES_Dram)
ENDEVENT