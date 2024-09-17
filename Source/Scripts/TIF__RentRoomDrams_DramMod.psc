;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 0
Scriptname TIF__RentRoomDrams_DramMod Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as DialogueGenericScript).Gold = DES_Dram
(GetOwningQuest() as DialogueGenericScript).RoomRentalCost = DES_DramRoomCost
(akspeaker as RentRoomScript).RentRoom(GetOwningQuest() as DialogueGenericScript)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property DES_Dram auto
GlobalVariable Property DES_DramRoomCost auto
