;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__ExchangeALLDramsForSeptims Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Exchange.DramsForSeptims(DES_Dram, PlayerRef.getItemCount(DES_Dram))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DES_ExchangeDramsFunctions Property Exchange auto
MiscObject Property DES_Dram auto
Actor Property PlayerRef auto