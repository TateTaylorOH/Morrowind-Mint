Scriptname DES_DramOfficeTrespassScript extends ObjectReference  

actor property DES_DramExchangerRef auto
actor property playerref auto
Quest Property DES_DramMorrowindServicesQuest auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if akactionref == playerref
		(DES_DramMorrowindServicesQuest as QF_DES_DramMorrowindServices_0300000D).Trespassing = 1
		DES_DramExchangerRef.EvaluatePackage()
	endif
EndEvent
