Scriptname DES_ExchangeDramsFunctions extends Quest Conditional

Actor Property PlayerRef auto
MiscObject Property DES_Dram auto
MiscObject Property DES_Ulfric auto
MiscObject Property Gold001 auto

;--------------------------------------------------

function SeptimsForDrams(MiscObject coin, int count)

float worth = 0.3333333333333333333333333
float convertedcount = count/worth
PlayerRef.RemoveItem(coin, count)
PlayerRef.AddItem(DES_Dram, convertedcount as int)

endfunction

function SeptimsForDramsForRoom(MiscObject coin, int count)

float worth = 0.3333333333333333333333333
float convertedcount = count*worth
PlayerRef.RemoveItem(coin, convertedcount as int)
PlayerRef.AddItem(DES_Dram, count)

endfunction

;--------------------------------------------------

function DramsForSeptims(MiscObject coin, int count)

float worth = 3
float convertedcount = count/worth
PlayerRef.RemoveItem(coin, count)
PlayerRef.AddItem(Gold001, convertedcount as int)

endfunction

;--------------------------------------------------

function UlfricsForDrams(MiscObject coin, int count)

float worth = 3
float convertedcount = count/worth
PlayerRef.RemoveItem(coin, count)
PlayerRef.AddItem(DES_Dram, convertedcount as int)

endfunction

function UlfricsForDramsForRoom(MiscObject coin, int count)

float worth = 3
float convertedcount = count*worth
PlayerRef.RemoveItem(coin, convertedcount as int)
PlayerRef.AddItem(DES_Dram, count)

endfunction

;--------------------------------------------------

Int Property AskedWho Auto Conditional
Int Property AskedDram Auto Conditional
Int Property Ulfric Auto Conditional