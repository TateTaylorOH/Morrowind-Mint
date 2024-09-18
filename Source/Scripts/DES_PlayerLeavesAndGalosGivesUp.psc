Scriptname DES_PlayerLeavesAndGalosGivesUp   extends ReferenceAlias

location property DLC2RavenRockLocation auto
actor property playerref auto
MiscObject Property DES_Dram auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if getOwningQuest().IsStageDone(0)
		if !PlayerRef.IsInLocation(DLC2RavenRockLocation)
			getOwningQuest().SetStage(6)
		endif
	endif
endEvent

import SEA_BarterFunctions

Event OnInit()
	SEA_BarterFunctions.RegisterFormForAllEvents(getowningquest())
endevent

Event OnPlayerGameLoad()
	SEA_BarterFunctions.RegisterFormForAllEvents(getowningquest())
endevent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if getOwningQuest().IsStageDone(10) && akBaseItem == DES_Dram
		getOwningQuest().SetStage(15)
	endif
endevent