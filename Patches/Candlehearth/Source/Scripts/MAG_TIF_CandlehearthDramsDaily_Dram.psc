;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname MAG_TIF_CandlehearthDramsDaily_Dram Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as DialogueGenericScript).Gold = DES_Dram
(GetOwningQuest() as DialogueGenericScript).RoomRentalCost = RoomCost
(akspeaker as RentRoomScript).RentRoom(GetOwningQuest() as DialogueGenericScript)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property DES_Dram Auto

GlobalVariable Property RoomCost Auto
