Scriptname DES_ExchangeDramsFunctions extends Quest Conditional

Actor Property PlayerRef auto
MiscObject Property DES_Dram auto
MiscObject Property Gold001 auto

;--------------------------------------------------

function ForDrams(MiscObject coin, int count)

float worth = 3
float convertedcount = count*worth
PlayerRef.RemoveItem(coin, count)
PlayerRef.AddItem(DES_Dram, convertedcount as int)

endfunction

function ForDramsRoom(MiscObject coin, int count)

float worth = 3
float convertedcount = count/worth
PlayerRef.RemoveItem(coin, convertedcount as int)
PlayerRef.AddItem(DES_Dram, count)

endfunction

;--------------------------------------------------

;Since Solstheim vendors won't trade in ulfrics until after the Stormcloaks win the Civil War, this mod assumes the coin's worth is always 1 gold.

;--------------------------------------------------

function DramsForSeptims(MiscObject coin, int count)

float worth = 3
float convertedcount = count/worth
PlayerRef.RemoveItem(coin, count)
PlayerRef.AddItem(Gold001, convertedcount as int)

endfunction

;--------------------------------------------------

Int Property HasVended Auto Conditional
Int Property Ulfric Auto Conditional