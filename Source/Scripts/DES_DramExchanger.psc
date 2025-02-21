Scriptname DES_DramExchanger extends ReferenceAlias  

MiscObject Property Gold001 auto
MiscObject Property DES_Dram auto
Actor Property DES_DramExchangerRef auto
Formlist Property DES_DramSeptimLocations auto
GlobalVariable Property DES_ConvertCoins auto

Actor Property PlayerRef auto
GlobalVariable property DES_DramWorth auto

Event OnInit()
	AddInventoryEventFilter(Gold001)
endEvent

Event OnPlayerLoadGame()
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(Gold001)
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	
	IF !DES_DramExchangerRef.IsInDialogueWithPlayer()
		IF  DES_DramSeptimLocations.HasForm(PlayerRef.GetCurrentLocation()) || DES_DramSeptimLocations.HasForm(PlayerRef.GetCurrentLocation().GetParent())
			IF !aksourceContainer && DES_ConvertCoins.GetValue() > 0
				if akBaseItem == Gold001
					float count = aiItemCount*DES_DramWorth.GetValue()
					PlayerRef.removeItem(akBaseItem, aiItemCount as int, true)
					PlayerRef.addItem(DES_Dram, count as int, true)
				endif
			ENDIF
		endif
	ENDIF
EndEvent
