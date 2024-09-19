Scriptname DES_ExchangeDramsFunctions extends Quest Conditional

Actor Property PlayerRef auto
MiscObject Property DES_Dram auto
MiscObject Property Gold001 auto
MiscObject Property DES_Ulfric auto
GlobalVariable Property DES_DramWorth auto
Location Property DES_DLC2RROfficeOfExchangeLocation auto
Formlist Property DES_DramSeptimLocations auto

ObjectReference Property DES_DramSafe auto
ObjectReference Property DES_SeptimSafe auto
ObjectReference Property DES_UlfricSafe auto

;--------------------------------------------------
;EXCHANGE FUNCTIONS
;--------------------------------------------------

function ForDrams(MiscObject coin, int count)

float worth = DES_DramWorth.GetValue()
float convertedcount = count*worth
PlayerRef.RemoveItem(coin, count)
IF PlayerRef.IsInLocation(DES_DLC2RROfficeOfExchangeLocation)
	IF coin == Gold001
		DES_SeptimSafe.Additem(Gold001, count)
	ELSEIF coin == DES_Ulfric
		DES_UlfricSafe.Additem(DES_Ulfric, count)
	ENDIF
ENDIF
PlayerRef.AddItem(DES_Dram, convertedcount as int)

endfunction

function ForDramsRoom(MiscObject coin, int count)

float worth = DES_DramWorth.GetValue()
float convertedcount = count/worth
PlayerRef.RemoveItem(coin, convertedcount as int)
IF PlayerRef.IsInLocation(DES_DLC2RROfficeOfExchangeLocation)
	IF coin == Gold001
		DES_SeptimSafe.Additem(Gold001, convertedcount as int)
	ELSEIF coin == DES_Ulfric
		DES_UlfricSafe.Additem(DES_Ulfric, convertedcount as int)
	ENDIF
ENDIF
PlayerRef.AddItem(DES_Dram, count)

endfunction

;--------------------------------------------------

;Since Solstheim vendors won't trade in ulfrics until after the Stormcloaks win the Civil War, this mod assumes the coin's worth is always 1 gold.

;--------------------------------------------------

function DramsForSeptims(MiscObject coin, int count)

float worth = DES_DramWorth.GetValue()
float convertedcount = count/worth
PlayerRef.RemoveItem(coin, count)
IF PlayerRef.IsInLocation(DES_DLC2RROfficeOfExchangeLocation)
	IF coin == DES_Dram
		DES_DramSafe.Additem(DES_Dram, count)
	ENDIF
ENDIF
PlayerRef.AddItem(Gold001, convertedcount as int)

endfunction

;--------------------------------------------------
;TUTORIAL QUEST
;--------------------------------------------------

import SEA_BarterFunctions

Event OnCustomBarterMenu(Actor a_kSeller)
	If GetCurrency() == DES_Dram
		IF PlayerRef.GetItemCount(DES_Dram) == 0
			setstage(10)
		elseif PlayerRef.GetItemCount(DES_Dram) > 0
			setstage(16)
		ENDIF
	elseif DES_DramSeptimLocations.HasForm(PlayerRef.GetCurrentLocation()) && GetCurrency() == Gold001
		hasVended = 1
	Endif
endEvent

;--------------------------------------------------
;INTS FOR DIALOGUE CHECKS
;--------------------------------------------------

Int Property Intro Auto Conditional
Int Property HasVended Auto Conditional
Int Property Trespassing Auto Conditional
Int Property BarteringInSeptims Auto Conditional
Int Property Ulfric Auto Conditional