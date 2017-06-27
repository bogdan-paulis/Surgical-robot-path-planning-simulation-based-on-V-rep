-- DO NOT WRITE CODE OUTSIDE OF THE if-then-end SECTIONS BELOW!! (unless the code is a function definition)

if (sim_call_type==sim_childscriptcall_initialization) then
print("Hello world, printing to the default console")
	-- Put some initialization code here
  id=tonumber(simGetScriptSimulationParameter(sim_handle_self,"Id EyeRob"))
  -- Input: (position/orientation)-->Vrep -->Output: (RGB image)
  result,test_IN  =simExtShareMemoryOpen("EyeRob_entrada_"..id,3*4*2) --position (3 float),Orientation (3 float ) 
  
    position={0.0,0.0,0.0}
  eulerAngles={0.0,0.0,0.0}


    pri21=simGetObjectHandle('Prismatic_joint_S21')
    pri22=simGetObjectHandle('Prismatic_joint_S22')
    pri11=simGetObjectHandle('Prismatic_joint_S11')
    pri12=simGetObjectHandle('Prismatic_joint_S12')
    pri01=simGetObjectHandle('Prismatic_joint_S01')
    pos21=simGetJointPosition(pri21)
print(pos21)
    simSetJointTargetPosition(pri21,-(15.2262-3.275)/1000)
    simSetJointTargetPosition(pri22,(10.3346-3.275)/1000)
    simSetJointTargetVelocity(pri21,0.001)
    simSetJointTargetVelocity(pri22,test_IN)
    simSetJointTargetVelocity(pri11,0.001)
    simSetJointTargetVelocity(pri12,0.001)
    simSetJointTargetVelocity(pri01,0.001)
    pos21=simGetJointPosition(pri21)
    pos22=simGetJointPosition(pri22)
    pos11=simGetJointPosition(pri11)
    pos12=simGetJointPosition(pri12)
    pos01=simGetJointPosition(pri01)
    step=0.0002
result,pos22_OUT  =simExtShareMemoryOpen("EyeRob_salida_"..id ,pos22*3) --position (1 float)
    n=0
print(pos21)

	-- Make sure you read the section on "Accessing general-type objects programmatically"
	-- For instance, if you wish to retrieve the handle of a scene object, use following instruction:
	--
	-- handle=simGetObjectHandle('sceneObjectName')
	-- 
	-- Above instruction retrieves the handle of 'sceneObjectName' if this script's name has no '#' in it
	--
	-- If this script's name contains a '#' (e.g. 'someName#4'), then above instruction retrieves the handle of object 'sceneObjectName#4'
	-- This mechanism of handle retrieval is very convenient, since you don't need to adjust any code when a model is duplicated!
	-- So if the script's name (or rather the name of the object associated with this script) is:
	--
	-- 'someName', then the handle of 'sceneObjectName' is retrieved
	-- 'someName#0', then the handle of 'sceneObjectName#0' is retrieved
	-- 'someName#1', then the handle of 'sceneObjectName#1' is retrieved
	-- ...
	--
	-- If you always want to retrieve the same object's handle, no matter what, specify its full name, including a '#':
	--
	-- handle=simGetObjectHandle('sceneObjectName#') always retrieves the handle of object 'sceneObjectName' 
	-- handle=simGetObjectHandle('sceneObjectName#0') always retrieves the handle of object 'sceneObjectName#0' 
	-- handle=simGetObjectHandle('sceneObjectName#1') always retrieves the handle of object 'sceneObjectName#1'
	-- ...
	--
	-- Refer also to simGetCollisionhandle, simGetDistanceHandle, simGetIkGroupHandle, etc.
	--
	-- Following 2 instructions might also be useful: simGetNameSuffix and simSetNameSuffix

end


if (sim_call_type==sim_childscriptcall_actuation) then
message,auxiliaryData=simGetSimulatorMessage()
while message~=-1 do
    print(auxiliaryData[1])
   if (message==sim_message_keypress) then
      if (auxiliaryData[1]==2007) then
         -- up key
        pos21=simGetJointPosition(pri21,-1)
        pos21=step+pos21
        n=n+1
        simSetJointTargetPosition(pri21,pos21)
        print(pos21)
      end
      if (auxiliaryData[1]==2008) then
         -- down key
        pos21=simGetJointPosition(pri21,-1)
        pos21=-step+pos21
        n=n+1
        simSetJointTargetPosition(pri21,pos21)
        print(pos21)
--simSetJointTargetPosition(pri1,0.01)
      end
      if (auxiliaryData[1]==2009) then
         -- left key
        pos22=simGetJointPosition(pri22,-1)
        pos22=step+pos22
        n=n+1
        simSetJointTargetPosition(pri22,pos22)
        print(pos22)
      end
      if (auxiliaryData[1]==2010) then
         -- left key
        pos22=simGetJointPosition(pri22,-1)
        pos22=-step+pos22
        n=n+1
        simSetJointTargetPosition(pri22,pos22)
        print(pos22)
      end
      if (auxiliaryData[1]==119) then
         -- w key
        pos12=simGetJointPosition(pri12,-1)
        pos12=step+pos12
        n=n+1
        simSetJointTargetPosition(pri12,pos12)
        print(pos12)
      end
      if (auxiliaryData[1]==115) then
         -- s key
        pos12=simGetJointPosition(pri12,-1)
        pos12=-step+pos12
        n=n+1
        simSetJointTargetPosition(pri12,pos12)
        print(pos12)
      end
      if (auxiliaryData[1]==97) then
         -- a key
        pos11=simGetJointPosition(pri11,-1)
        pos11=step+pos11
        n=n+1
        simSetJointTargetPosition(pri11,pos11)
        print(pos11)
      end
      if (auxiliaryData[1]==100) then
         -- d key
        pos11=simGetJointPosition(pri11,-1)
        pos11=-step+pos11
        n=n+1
        simSetJointTargetPosition(pri11,pos11)
        print(pos11)
      end
      if (auxiliaryData[1]==113) then
         -- q key
        pos01=simGetJointPosition(pri01,-1)
        pos01=-step+pos01
        n=n+1
        simSetJointTargetPosition(pri01,pos01)
        print(pos01)
      end
      if (auxiliaryData[1]==101) then
         -- r key
        pos01=simGetJointPosition(pri01,-1)
        pos01=step+pos01
        n=n+1
        simSetJointTargetPosition(pri01,pos01)
        print(pos01)
      end
   end
   message,auxiliaryData=simGetSimulatorMessage()
end



end
if (sim_call_type==sim_childscriptcall_sensing) then

	-- Put your main SENSING code here

end


if (sim_call_type==sim_childscriptcall_cleanup) then

	-- Put some restoration code here

end