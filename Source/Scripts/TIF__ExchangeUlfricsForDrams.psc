;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__ExchangeUlfricsForDrams Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Exchange.ForDrams(DES_Ulfric, count)

;Since Solstheim vendors won't trade in 
;ulfrics until after the Stormcloaks win the 
;Civil War, this mod assumes the coin's 
;worth is always 1 gold.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1

DES_ExchangeDramsFunctions Property Exchange auto
MiscObject Property DES_Ulfric auto
int Property count auto
