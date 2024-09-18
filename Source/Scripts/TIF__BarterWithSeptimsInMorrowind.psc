;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__BarterWithSeptimsInMorrowind Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BarterWithSeptims(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerREF Auto
Form Property Gold001 Auto 
Quest Property DES_DramMorrowindServicesQuest auto

Bool ShouldRevertCurrency
Form LastCurrency

Import SEA_BarterFunctions 

Function BarterWithSeptims(Actor a_kVendor)
    If (!a_kVendor)

        Return
    EndIf

    LastCurrency = GetCurrency()
    ShouldRevertCurrency = False
    If (!LastCurrency)

        ShouldRevertCurrency = True
    EndIf
    SetCurrency(Gold001)
    (DES_DramMorrowindServicesQuest as DES_ExchangeDramsFunctions).BarteringInSeptims = 1 

    a_kVendor.ShowBarterMenu()

    ;We do this for Skyrim Souls compatibility.
    While (Utility.IsInMenuMode())

        Utility.Wait(0.1)
    EndWhile

    If (ShouldRevertCurrency)

        ResetCurrency()
    Else

        SetCurrency(LastCurrency)
        (DES_DramMorrowindServicesQuest as DES_ExchangeDramsFunctions).BarteringInSeptims = 0 
    EndIf

EndFunction
