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
miscobject property des_dram auto
formlist property DES_DramFairMerchants auto
perk property DES_MorrowindPriceAdjustmentPerk auto

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

    IF DES_DramFairMerchants.HasForm(PlayerRef.GetCurrentLocation()) || DES_DramFairMerchants.HasForm(PlayerRef.GetCurrentLocation().GetParent())
        If (PlayerREF.HasPerk(DES_MorrowindPriceAdjustmentPerk))
            PlayerREF.RemovePerk(DES_MorrowindPriceAdjustmentPerk)
        EndIf
    ENDIF

    ResetCurrency()
    (DES_DramMorrowindServicesQuest as DES_ExchangeDramsFunctions).BarteringInSeptims = 1 

    a_kVendor.ShowBarterMenu()

    ;We do this for Skyrim Souls compatibility.
    While (Utility.IsInMenuMode())

        Utility.Wait(0.1)
    EndWhile

    If (ShouldRevertCurrency)

        ResetCurrency()
    Else
    IF lastcurrency == DES_Dram
        If !(PlayerREF.HasPerk(DES_MorrowindPriceAdjustmentPerk))
            PlayerREF.addPerk(DES_MorrowindPriceAdjustmentPerk)
        EndIf
    endif

        SetCurrency(LastCurrency)
        (DES_DramMorrowindServicesQuest as DES_ExchangeDramsFunctions).BarteringInSeptims = 0 
    EndIf

EndFunction
