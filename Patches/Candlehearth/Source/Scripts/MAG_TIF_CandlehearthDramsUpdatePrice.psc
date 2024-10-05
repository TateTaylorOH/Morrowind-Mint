;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname MAG_TIF_CandlehearthDramsUpdatePrice Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Float DramRoomCost = RoomCost.GetValue()*DES_DramWorth.GetValue()
Float WeekDramRoomCost = MAG_RoomCostWeekly.GetValue()*DES_DramWorth.GetValue()
Float MonthDramRoomCost = MAG_RoomCostMonthly.GetValue()*DES_DramWorth.GetValue()

DES_DramRoomCost.SetValue(DramRoomCost)
MAG_RoomCostDramsWeekly.SetValue(WeekDramRoomCost)
MAG_RoomCostDramsMonthly.SetValue(MonthDramRoomCost)

GetOwningQuest().UpdateCurrentInstanceGlobal(DES_DramRoomCost)
GetOwningQuest().UpdateCurrentInstanceGlobal(MAG_RoomCostDramsWeekly)
GetOwningQuest().UpdateCurrentInstanceGlobal(MAG_RoomCostDramsMonthly)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property RoomCost Auto
GlobalVariable Property MAG_RoomCostWeekly Auto
GlobalVariable Property MAG_RoomCostMonthly Auto
GlobalVariable Property DES_DramRoomCost Auto
GlobalVariable Property MAG_RoomCostDramsWeekly Auto
GlobalVariable Property MAG_RoomCostDramsMonthly Auto
GlobalVariable Property DES_DramWorth Auto
