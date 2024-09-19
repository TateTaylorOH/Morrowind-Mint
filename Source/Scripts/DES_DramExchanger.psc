Scriptname DES_DramExchanger extends ReferenceAlias  

MiscObject Property Gold001 auto
MiscObject Property DES_Dram auto
Actor Property DES_DramExchangerRef auto
Formlist Property DES_DramSeptimLocations auto

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
			IF !aksourceContainer
				if akBaseItem == Gold001
					int count = aiItemCount*(DES_DramWorth.GetValue() as int)
					PlayerRef.removeItem(akBaseItem, count, true)
					PlayerRef.addItem(DES_Dram, count, true)
				endif
			ENDIF
		endif
	ENDIF
EndEvent