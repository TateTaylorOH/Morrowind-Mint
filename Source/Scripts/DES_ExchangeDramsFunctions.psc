Scriptname DES_ExchangeDramsFunctions extends Quest Conditional

Actor Property PlayerRef auto
MiscObject Property DES_Dram auto
MiscObject Property Gold001 auto
GlobalVariable Property DES_DramWorth auto

;--------------------------------------------------
;EXCHANGE FUNCTIONS
;--------------------------------------------------

function ForDrams(MiscObject coin, int count)

float worth = DES_DramWorth.GetValue()
float convertedcount = count*worth
PlayerRef.RemoveItem(coin, count)
PlayerRef.AddItem(DES_Dram, convertedcount as int)

endfunction

function ForDramsRoom(MiscObject coin, int count)

float worth = DES_DramWorth.GetValue()
float convertedcount = count/worth
PlayerRef.RemoveItem(coin, convertedcount as int)
PlayerRef.AddItem(DES_Dram, count)

endfunction

;--------------------------------------------------

;Since Solstheim vendors won't trade in ulfrics until after the Stormcloaks win the Civil War, this mod assumes the coin's worth is always 1 gold.

;--------------------------------------------------

function DramsForSeptims(MiscObject coin, int count)

float worth = DES_DramWorth.GetValue()
float convertedcount = count/worth
PlayerRef.RemoveItem(coin, count)
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
	Endif
endEvent

;--------------------------------------------------
;INTS FOR DIALOGUE CHECKS
;--------------------------------------------------

Int Property Intro Auto Conditional
Int Property Ulfric Auto Conditional
Int Property HasVended Auto Conditional
Int Property Trespassing Auto Conditional