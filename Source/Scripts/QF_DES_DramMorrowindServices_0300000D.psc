;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DES_DramMorrowindServices_0300000D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Galos
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Galos Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(0)
(DES_DramMorrowindServicesQuest as DES_ExchangeDramsFunctions).Intro = 1
Alias_Galos.trytoEvaluatePackage()
Ledger.Disable()
Ledger.Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DES_DramMorrowindServicesQuest  Auto  

ObjectReference Property Ledger  Auto  
