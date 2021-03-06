clearListener()
--maintTestTimer.stop maintTestTimer
/*


To start the main class, we have to initialize the other classes. 

constClass()---include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----constClass.ms"
mathClass()----include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----mathLibrary.ms"
objClass()-----include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----ObjClass.ms"
weightClass()--include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----weighHandler.ms"
posClass()-----include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----posClass.ms"
predClass()----include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----predictionClass.ms"
valueClass()---include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----valueClass.ms"
wndClass()-----include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----WndClass.ms"
clockClass()---include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----clockClass.ms"

!!!! They are not supposed to be changed so they will not be variables. !!!!

----Initialize Main Class--------------------------------------------------------

	1)--Initiate constClass.-----------------------------------------------------
	2)--Import const values into valueClass.-------------------------------------
	3)--Initiate all Objects.----------------------------------------------------
	4)--Initiate all Weights.----------------------------------------------------

----Update Main Class------------------------------------------------------------

	Assingning Local Classes-----------------------------------------------------
	Assinging Constant Class as a local Class------------------------------------
	Assinging Object Class as a local Class--------------------------------------
	Assinging Wind Class as a local Class----------------------------------------
	Assinging Weight Class as a local Class--------------------------------------
	Assinging Position Class as a local Class------------------------------------
	Assinging Prediction Class as a local Class----------------------------------
	Assinging Values Class as a local Class--------------------------------------

	---------Loop Start----------------------------------------------------------

	5)--Update past Values in valueClass.----------------------------------------
	6)--update objPosition Values.-----------------------------------------------
	7)--Import Object Position to valueClass.------------------------------------
	8)--Import Position values to posClass from valueClass.----------------------
	9)--Update Dist values in PosClass.------------------------------------------
	10)-Update Spd values in PosClass.-------------------------------------------
	11)-Update acl values in PosClass.-------------------------------------------
	12)-Update tilt values in PosClass.------------------------------------------
	13)-Import Dist, Spd, acl and Tlt to ValueClass from PosClass.---------------
	14)-Import Dist, Spd, acl and Tlt to WndClass from ValueClass.---------------
	-- Removed 15)-Calculate displacement in WndClass.--------------------------------------
	16)-Import wind estimate to ValueClass.--------------------------------------
	17)-Import Dist,Spd,acl,Tlt and WndEst into weightClass from ValueClass.-----
	18)-Catch weight Values for each current Value, and its Position.------------
	19)-Import weight values and position from Weight class to value class.------
	20)-Import weight Values from ValueClass to WndClass.------------------------
	21)-Calculate Final wind and Tilt in WndClass.-------------------------------
	22)-Import final wind force and tilt from WndClass to valueClass.------------
	23)-Import Wind values from valueClass to objectClass.-----------------------
	24)-Output wind values in windObject.----------------------------------------

	---------End of wind Output and Calculation.---------------------------------

	25)-Import values from ValueClass to Prediction Class.-----------------------
	26)-Calculate predictions.---------------------------------------------------
	27)-Import predictions from predClass to ValueClass.-------------------------
	28)-Import pastPrecitcions from ValueClass to weightClass.-------------------
	29)-Update weights for previous values.--------------------------------------
	30)-End of Loop--------------------------------------------------------------

----End Main Class---------------------------------------------------------------

*/

--External Libraries

include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----constClass.ms"
include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----mathLibrary.ms"
include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----ObjClass.ms"
include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----weighHandler.ms"
include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----posClass.ms"
include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----predictionClass.ms"
include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----valueClass.ms"
include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----WindClass.ms"
include "C:\Users\Samir\Documents\GitHub\MachineLearningMax\machineLearning\NeuralNetBeta\TESTED-OK----clockClass.ms"

const = constClass()
mathClass()

struct mainClass
(
	conCs = constClass(),
	wndCs = WindClass(),
	objCs = objClass(),
	weiCs = weightClass(),
	posCs = posClass(),
	valCs = valueClass(),
	prdCs = predClass(),

	fn init name obj1 obj2 windObj =
	(
		/*
			
			Obj1 - Is the source object
			obj2 - Is the Target object
			WindObj - Is the WindObj

			simulation1.initAll Will import the obj1 obj2 windObj.
			weightsS1.init Will initialize the weights for Pos, Speed, Aceleration, Tilt and Wind.
			The weights are divided in 3 sets to represent the axis with 20 Tensors for each layer.
			The Wind layer has only one axis layer with 20 Tensors.

		*/
		

		name.conCs.Init name.conCs--------------------------1)  Initiate constClass.------------------------------------------------------

		name.valCs.importConst name.valCs name.conCs--------2)  Import const values into valueClass.--------------------------------------
		
		name.objCs.initAll name.objCs obj1 obj2 windObj-----3)  Initiate all Objects.-----------------------------------------------------
		
		name.weiCs.init name.weiCs--------------------------4)  Initiate all Weights.-----------------------------------------------------

		return true
	),
	fn updateValues name =
	(
		----------------------------------------------------Assingning Local Classes------------------------------------------------------
		
		name.IconCs = name.conCs----------------------------Assinging Constant Class as a local Class-----------------------------------------
		name.lobjCs = name.objCs----------------------------Assinging Object Class as a local Class-------------------------------------------
		name.lwndCs = name.wndCs----------------------------Assinging Wind Class as a local Class-------------------------------------------
		name.lweiCs = name.weiCs----------------------------Assinging Weight Class as a local Class----------------------------------------
		name.lposCs = name.posCs----------------------------Assinging Position Class as a local Class-------------------------------------------
		name.lprdCs = name.prdCs----------------------------Assinging Prediction Class as a local Class------------------------------------------
		name.lvalCs = name.valCs----------------------------Assinging Values Class as a local Class-------------------------------------------

		----------------------------------------------------Loop Start--------------------------------------------------------------------

		name.lvalCs.updatePast name.lvalCs------------------5)  Update past Values in valueClass.-----------------------------------------
		
		name.lobjCs.updateValues name.lobjCs----------------6)  update objPosition Values.------------------------------------------------

		name.lvalCs.importObjPos name.lvalCs name.lobjCs----7)  Import Object Position to valueClass.-------------------------------------

		name.lposCs.importValues name.lposCs name.lvalCs----8)  Import Position values to posClass from valueClass.-----------------------

		name.lposCs.updateDst name.lposCs-------------------9)  Update Dist values in PosClass.-------------------------------------------

		name.lposCs.updateSpd name.lposCs-------------------10) Update Spd values in PosClass.--------------------------------------------

		name.lposCs.updateAcl name.lposCs-------------------11) Update acl values in PosClass.--------------------------------------------

		name.lposCs.updateTlt name.lposCs-------------------12) Update tilt values in PosClass.-------------------------------------------
	
	 	name.lvalCs.importPos name.lvalCs name.lposCs-------13) Import Dist, Spd, acl and Tlt to ValueClass from PosClass.----------------

	 	--name.lwndCs.importValues name.lwndCs name.lvalCs--Removed---- 14) Import Dist, Spd, acl and Tlt to WndClass from ValueClass.----------------

	 	--name.lwndCs.displacement name.lwndCs--------------Removed---- 15) Calculate displacement in WndClass.-------------------------

	 	--name.lvalCs.importWnd name.lvalCs name.lwndCs-----Removed---- 16) Import wind estimate to ValueClass.-------------------------

	 	name.lweiCs.importValues name.lweiCs name.lvalCs----17) Import Dist,Spd,acl,Tlt and WndEst into weightClass from ValueClass.------

	 	name.lweiCs.catchWeights name.lweiCs----------------18) Catch weight Values for each current Value, and its Position.-------------

	 	name.lvalCs.importWeights name.lvalCs name.lweiCs---19) Import weight values and position from Weight class to value class.-------

	 	name.lwndCs.importValues name.lwndCs name.lvalCs----20) Import weight Values from ValueClass to WndClass.-------------------------

	 	name.lwndCs.updateValues name.lwndCs----------------21) Calculate Final wind and Tilt in WndClass.--------------------------------

	 	name.lvalCs.importWnd name.lvalCs name.lwndCs-------22) Import final wind force and tilt from WndClass to valueClass.-------------
	
	 	name.lobjCs.importValues name.lobjCs name.lvalCs----23) Import Wind values from valueClass to objectClass.------------------------

	 	name.lobjCs.outputWind name.lobjCs------------------24) Output wind values in windObject.-----------------------------------------

	 	
	 	----------------------------------------------------End of wind Output and Caluculation.------------------------------------------


	 	name.lprdCs.importValues name.lprdCs name.lvalCs----25) Import values from ValueClass to Prediction Class.------------------------

	 	name.lprdCs.updatePred name.lprdCs------------------26) Calculate predictions.----------------------------------------------------

	 	name.lvalCs.importPred name.lvalCs name.lprdCs------27) Import predictions from predClass to ValueClass.--------------------------

	 	name.lweiCs.importPastPred name.lweiCs name.lvalCs--28) Import pastPrecitcions from ValueClass to weightClass.--------------------

	 	name.lweiCs.updateWeights name.lweiCs---------------29) Update weights for previous values.---------------------------------------

	 	----------------------------------------------------30) End of Loop---------------------------------------------------------------
	 	
	 	

	 	----------------------------------------------------Test--------------------------------------------------------------------------
		 	


		 	name.lvalCs.tltL 
		 	name.lvalCs.tltF 
		 	name.lvalCs.tltLPred
		 	
		 	TltTARGET = [(name.lvalCs.tltF[1]),(name.lvalCs.tltF[2])]
		 	tiltFinal = [(name.lvalCs.wndT[1]),(name.lvalCs.wndT[2])]
		 	tiltPred  = [name.lvalCs.tltLPred[1],name.lvalCs.tltLPred[2]]
			
			/*
		 		twoDec = mathClass.twoDecFn 
		 		seconds = (getLocalTime())
		 		if (seconds[8] >= 5 and seconds[8] < 100) do
		 		(
		 			clearListener()
		 			format "WndForc: %\n" (twoDec (mathClass.absFn name.lvalCs.wndF     name.lvalCs.MaxW))
		 			format "WndPast: %\n" (twoDec (mathClass.absFn name.lvalCs.wndFpast name.lvalCs.MaxW))
		 			format "\n"
		 			format "DstTarg: %\n" (twoDec (mathClass.absFn name.lvalCs.dstF     name.lvalCs.maxAbs))
		 			format "DstSing: %\n" (twoDec (mathClass.absFn name.lvalCs.dstS     name.lvalCs.maxD))
		 			format "DstPast: %\n" (twoDec (mathClass.absFn name.lvalCs.dstSPast name.lvalCs.maxD))
		 			format "DstPred: %\n" (twoDec (mathClass.absFn name.lvalCs.dstSPred name.lvalCs.maxD))
		 			format "\n"
		 			format "SpdSing: %\n" (twoDec (mathClass.absFn name.lvalCs.spdS     name.lvalCs.maxS))
		 			format "SpdPast: %\n" (twoDec (mathClass.absFn name.lvalCs.spdSPast name.lvalCs.maxS))
		 			format "SpdPred: %\n" (twoDec (mathClass.absFn name.lvalCs.spdSPred name.lvalCs.maxS))
		 			format "\n"
		 			format "AclSing: %\n" (twoDec (mathClass.absFn name.lvalCs.AclS     name.lvalCs.maxA))
		 			format "AclPast: %\n" (twoDec (mathClass.absFn name.lvalCs.AclSPast name.lvalCs.maxA))
		 			format "AclPred: %\n" (twoDec (mathClass.absFn name.lvalCs.AclSPred name.lvalCs.maxA))
		 			format "\n"
		 			format "tltL---: [%,%]\n" (twoDec (name.lvalCs.tltL[1])    ) (twoDec (name.lvalCs.tltL[2])    )
		 			format "tltF---: [%,%]\n" (twoDec (name.lvalCs.tltF[1])    ) (twoDec (name.lvalCs.tltF[2])    )
		 			format "WndT---: [%,%]\n" (twoDec (name.lvalCs.wndT[1])) (twoDec (name.lvalCs.wndT[2]))
		 			format "\n"
		 			format "SouPos--:%\n" name.valCs.souPos
		 			format "TarPos--:%\n" name.valCs.TarPos
		 			format "\n"
		 			format "WndFWeig: % --- Position : %\n" (name.lvalCs.wndFw) name.lvalCs.wndFWpos
		 			format "DstFWeig: % --- Position : %\n" (name.lvalCs.dstFW) name.lvalCs.dstFWpos
		 			format "DstSWeig: % --- Position : %\n" (name.lvalCs.dstSW) name.lvalCs.dstSWpos
		 			format "SpdSWeig: % --- Position : %\n" (name.lvalCs.spdSW) name.lvalCs.spdSWpos
		 			format "AclSWeig: % --- Position : %\n" (name.lvalCs.aclSW) name.lvalCs.aclSWpos
		 			format "\n"
		 			format "dstTWeiX: % --- Position : %\n" ((name.lvalCs.dstTW[1])) name.lvalCs.dstTWpos[1]
					format "spdTWeiX: % --- Position : %\n" ((name.lvalCs.spdTW[1])) name.lvalCs.spdTWpos[1]
		 			format "TltLWeiX: % --- Position : %\n" ((name.lvalCs.tltLW[1])) name.lvalCs.tltLWpos[1]
		 			format "\n"
		 			format "dstTWeiY: % --- Position : %\n" ((name.lvalCs.dstTW[2])) name.lvalCs.dstTWpos[2]
					format "spdTWeiY: % --- Position : %\n" ((name.lvalCs.spdTW[2])) name.lvalCs.spdTWpos[2]
		 			format "TltLWeiY: % --- Position : %\n" ((name.lvalCs.tltLW[2])) name.lvalCs.tltLWpos[2]
		 			format "\n"
		 			format "MaxWind: %\n" name.lvalCs.MaxW
		 			format "MaxAbs-: %\n" name.lvalCs.maxAbs
		 			format "MaxDist: % -- currentMaxD: %\n" name.lvalCs.maxD name.lvalCs.currentMaxD
		 			format "MaxSpdS: % -- currentMaxS: %\n" name.lvalCs.maxS name.lvalCs.currentMaxS
		 			format "MaxAclS: % -- currentMaxA: %\n" name.lvalCs.maxA name.lvalCs.currentMaxA
		 			format "MaxWt  : %\n" name.lvalCs.maxWT
		 			format "MaxTltL: %\n" name.lvalCs.maxt
			 		
		 		)
			*/

			if name.lvalCs.dstF <= name.lvalCs.maxAbs do
			(
				--name.lvalCs.maxAbs = name.lvalCs.maxAbs/2
				--name.lvalCs.maxD = name.lvalCs.currentMaxD
				--name.lvalCs.maxS = name.lvalCs.currentMaxS
				--name.lvalCs.maxA = name.lvalCs.currentMaxA

				--name.lvalCs.currentMaxD = 0
				--name.lvalCs.currentMaxS = 0
				--name.lvalCs.currentMaxA = 0

			)
			if name.lvalCs.dstS > name.lvalCs.currentMaxD do
			(
				name.lvalCs.currentMaxD = name.lvalCs.dstS
			)
			if name.lvalCs.spdS > name.lvalCs.currentMaxS do
			(
				name.lvalCs.currentMaxS = name.lvalCs.spdS
			)
			if name.lvalCs.AclS > name.lvalCs.currentMaxA do
			(
				name.lvalCs.currentMaxA = name.lvalCs.AclS
			)
		 	$tltFObjBLU.pos = name.lvalCs.souPos
		 	$tltFObjBLU.height = name.lvalCs.dstF
		 	$tltFObjBLU.dir = [0,0,1]
			$tltFObjBLU.rotation.X_rotation = name.lvalCs.tltF[1]
			$tltFObjBLU.rotation.Y_rotation = name.lvalCs.tltF[2]
		 	/*

			$tltLObjGRE.pos = name.lvalCs.souPos
			$tltLObjGRE.height = 100
		 	$tltLObjGRE.dir = [0,0,1]
			$tltLObjGRE.rotation.X_rotation = name.lvalCs.tltL[1]
			$tltLObjGRE.rotation.Y_rotation = name.lvalCs.tltL[2]

			$predObjRED.pos = name.lvalCs.souPos
			$predObjRED.height = 100
			$predObjRED.dir = [0,0,1]
			$predObjRED.rotation.X_rotation = name.lvalCs.tltLPred[1]
			$predObjRED.rotation.Y_rotation = name.lvalCs.tltLPred[2]

			$posPred.pos = name.lvalCs.posFPred
			*/
		----------------------------------------------------End of test-------------------------------------------------------------------
	 	return true
	),

	private
	IconCs = undefined,
	lobjCs = undefined,
	lwndCs = undefined,
	lweiCs = undefined,
	lposCs = undefined,
	lprdCs = undefined,
	lvalCs = undefined
)


testClass = mainClass()
testClass.init testClass $sourceBox $targetBox $windObj
testClass.updateValues testClass


fn mainTest = (testClass.updateValues testClass)

maintTestTimer = clockClass()
maintTestTimer.create maintTestTimer mainTest


/*
maintTestTimer.start  maintTestTimer
maintTestTimer.stop   maintTestTimer
$windObj.strength = 10
$wjuindObj.dir = [0,0,1]
testClass.valCs.currentMaxD =0
testClass.valCs.currentMaxS =0
testClass.valCs.currentMaxA =0

testClass.valCs.MaxW   = 15
testClass.valCs.MaxAbs = 200
testClass.valCs.maxD   = 200
testClass.valCs.MaxS   = 5
testClass.valCs.MaxA   = 10
testClass.valCs.MaxT   = 90
testClass.valCs.maxWt  = 90


animationRange = interval 0 100
animationRange = interval 0 500
animationRange = interval 0 1000
animationRange = interval 0 5000

testClass.init testClass $sourceBox $targetBox $windObj
testClass.weiCs.dstFWarr.count
*/