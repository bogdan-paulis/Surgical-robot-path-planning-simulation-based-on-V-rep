-- DO NOT WRITE CODE OUTSIDE OF THE if-then-end SECTIONS BELOW!! (unless the code is a function definition)

if (sim_call_type==sim_childscriptcall_initialization) then
print("Hello world, printing to the default console")
	-- Put some initialization code here
simExtRemoteApiStart(19999,1300,false,true)

console = simAuxiliaryConsoleOpen("Aux Console", 500, 0x10)
  id=tonumber(simGetScriptSimulationParameter(sim_handle_self,"id EyeRob"))
--id=10  
--console = simAuxiliaryConsoleOpen("Aux Console", 500, 0x10)
    position_in={0.0,0.0,0.0}
	position_out={0.0,0.0,0.0}

  eulerAngles={0.0,0.0,3.0}
	q_in={0.0,0.0,0.0,0.0,0.0,0.0}
	q_out={0.0,0.0,3.0,0.0,0.0,0.0}


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
    simSetJointTargetVelocity(pri22,0.001)
    simSetJointTargetVelocity(pri11,0.001)
    simSetJointTargetVelocity(pri12,0.001)
    simSetJointTargetVelocity(pri01,0.001)
    pos21=simGetJointPosition(pri21)
    pos22=simGetJointPosition(pri22)
    pos11=simGetJointPosition(pri11)
    pos12=simGetJointPosition(pri12)
    pos01=simGetJointPosition(pri01)
    step=0.0002

-- Input: (position/orientation)-->Vrep -->Output: (RGB image)
  --result,data_IN  =simExtShareMemoryOpen("EyeRob_entrada_"..id,4) --position (4 bytes (single in matlab))
  --result,data_OUT  =simExtShareMemoryOpen("EyeRob_salida_"..id,4*4+3) --position (1 float)
  result,floatMem_IN  =simExtShareMemoryOpen("EyeRob_entrada_"..id,6*4) --position (3 float),Orientation (3 float ) 
  result,floatMem_OUT  =simExtShareMemoryOpen("EyeRob_salida_"..id ,6*4) --RGB (char)
  


  n=0
print(pos21)
end


if (sim_call_type==sim_childscriptcall_actuation) then
message,auxiliaryData=simGetSimulatorMessage()
--get data
result,data=simExtShareMemoryRead(floatMem_IN)

--unpacking floats and parsing them into data types
q_in=simUnpackFloats(data,0,6)
--send back current joint positions
pos21=simGetJointPosition(pri21)
pos22=simGetJointPosition(pri22)
pos11=simGetJointPosition(pri11)
pos12=simGetJointPosition(pri12)
pos01=simGetJointPosition(pri01)
q_out[1] = pos21
q_out[2] = pos22
q_out[3] = pos11
q_out[4] = pos12
q_out[5] = pos01
q_out[6] = 0.0
--pack data into floats
data_out=simPackFloats(q_out,0,6)
--send data
result=simExtShareMemoryWrite(floatMem_OUT,data_out)

--eulerAngles=simUnpackFloats(data,3,3)


simAuxiliaryConsolePrint(console,'\n')
simAuxiliaryConsolePrint(console,q_in[1])
simAuxiliaryConsolePrint(console,'\n')
simAuxiliaryConsolePrint(console,q_in[2])
simAuxiliaryConsolePrint(console,'\n')
simAuxiliaryConsolePrint(console,q_in[3])
simAuxiliaryConsolePrint(console,'\n')
simAuxiliaryConsolePrint(console,q_in[4])
simAuxiliaryConsolePrint(console,'\n')
simAuxiliaryConsolePrint(console,q_in[5])
simAuxiliaryConsolePrint(console,'\n')
simAuxiliaryConsolePrint(console,q_in[6])
simAuxiliaryConsolePrint(console,'\n')
simAuxiliaryConsolePrint(console,'--------------')
simAuxiliaryConsolePrint(console,'\n')

simSetJointTargetPosition(pri21,q_in[1])
simSetJointTargetPosition(pri22,q_in[2])
simSetJointTargetPosition(pri11,q_in[3])
simSetJointTargetPosition(pri12,q_in[4])
simSetJointTargetPosition(pri01,q_in[5])


--pos22_out=simGetJointPosition(pri22)
 --result,data=simExtShareMemoryRead(data_IN)


--position=simUnpackFloats(data,0,3)

--simAuxiliaryConsolePrint(console,'\n')
--simAuxiliaryConsolePrint(console,position[3])
--pos=simUnpackInts(data,0,2)
--temp=pos22_out*1000
 --result=simExtShareMemoryWrite(data_OUT,temp)
--print(test_IN)
--simAuxiliaryConsolePrint(console,data)





  --position=simUnpackFloats(data,0,3)
  --eulerAngles=simUnpackFloats(data,3,3)




end
if (sim_call_type==sim_childscriptcall_sensing) then

	-- Put your main SENSING code here

end


if (sim_call_type==sim_childscriptcall_cleanup) then

	-- Put some restoration code here
simExtShareMemoryClose();

end

--if simGetScriptExecutionCount() == 0 then
  --console = simAuxiliaryConsoleOpen("Aux Console", 500, 0x10)
  --oldprint = print
  --print = function(...)
  --  simAuxiliaryConsolePrint(console, ...)
 --end
--end