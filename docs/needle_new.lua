-- DO NOT WRITE CODE OUTSIDE OF THE if-then-end SECTIONS BELOW!! (unless the code is a function definition)
--new version

if (sim_call_type==sim_childscriptcall_initialization) then
print("Hello world, printing to the default console")
	-- Put some initialization code here
simExtRemoteApiStart(19999,1300,false,true)

console = simAuxiliaryConsoleOpen("Aux Console", 500, 0x10)
  id=tonumber(simGetScriptSimulationParameter(sim_handle_self,"id EyeRob"))
--id=10  
--console = simAuxiliaryConsoleOpen("Aux Console", 500, 0x10)
	q_in={0.0,0.0,0.0,0.0,0.0,0.0}
	q_out={0.0,0.0,3.0,0.0,0.0,0.0}

--prismatic joints
    pri21=simGetObjectHandle('Prismatic_joint_S21')
    pri22=simGetObjectHandle('Prismatic_joint_S22')
    pri11=simGetObjectHandle('Prismatic_joint_S11')
    pri12=simGetObjectHandle('Prismatic_joint_S12')
    pri01=simGetObjectHandle('Prismatic_joint_S01')
	pri00=simGetObjectHandle('Prismatic_jointS00')

--rotational joints
	revoluteJointS21=simGetObjectHandle('Revolute_joint_S21')
	revoluteJointS22=simGetObjectHandle('Revolute_joint_S22')
	revoluteJointS11=simGetObjectHandle('Revolute_joint_S11')

    simSetJointPosition(pri21,-(15.2262-3.275)/1000)
    simSetJointPosition(pri22,(10.3346-3.275)/1000)
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
	pos00= simGetJointPosition(pri00)
	revoluteJointS21_pos= simGetJointPosition(revoluteJointS21)
	revoluteJointS22_pos= simGetJointPosition(revoluteJointS22)
	revoluteJointS11_pos= simGetJointPosition(revoluteJointS11)

    step=0.0002

-- Input: (position/orientation)-->Vrep -->Output: (RGB image)
  --result,data_IN  =simExtShareMemoryOpen("EyeRob_entrada_"..id,4) --position (4 bytes (single in matlab))
  --result,data_OUT  =simExtShareMemoryOpen("EyeRob_salida_"..id,4*4+3) --position (1 float)

  result,floatMem_IN  =simExtShareMemoryOpen("EyeRob_entrada_"..id,6*4) --position in joint space (6 float * 4 bytes per float) 
  result,floatMem_OUT  =simExtShareMemoryOpen("EyeRob_salida_"..id ,6*4) --position in joint space (6 float * 4 bytes per float)
  


  n=0

end


if (sim_call_type==sim_childscriptcall_actuation) then
message,auxiliaryData=simGetSimulatorMessage()
--get data
result,data=simExtShareMemoryRead(floatMem_IN)

--unpacking floats and parsing them into data types
q_in=simUnpackFloats(data,0,6)

-- set Vrep joint positions from received data only  using rotational joints - not used at the moment
--Q1 - done
--simSetJointTargetPosition(pri21,-q_in[1])
--simSetJointTargetPosition(pri22,q_in[1])
--Q2
--simSetJointTargetPosition(revoluteJointS21,q_in[2])
--Q3 -done
--simSetJointTargetPosition(pri11,q_in[3])
--simSetJointTargetPosition(pri12,-q_in[3])
--Q4
--simSetJointTargetPosition(revoluteJointS11,q_in[4])
--Q5 -done
--simSetJointTargetPosition(pri01,q_in[5])
--Q6 -done
--simSetJointTargetPosition(pri00,-q_in[6])


-- set Vrep joint positions from received data only using translational joints 
--Q1 - done
simSetJointTargetPosition(pri21,-q_in[1])
--Q1 & Q2 mixed
simSetJointTargetPosition(pri22,q_in[1]+q_in[2])
--Q3 -done
simSetJointTargetPosition(pri11,q_in[3])
--Q3 & Q4 mixed
simSetJointTargetPosition(pri12,-q_in[3]-q_in[4])
--Q5 -done
simSetJointTargetPosition(pri01,q_in[5])
--Q6 -done
simSetJointTargetPosition(pri00,-q_in[6])


--send back current joint positions

--get current joint positions
--Q1
pos21=simGetJointPosition(pri21)
--Q2
revoluteJointS21_pos=simGetJointPosition(revoluteJointS21)
--Q3
pos11=simGetJointPosition(pri11)
--Q4
revoluteJointS11_pos=simGetJointPosition(revoluteJointS11)
--Q5
pos01=simGetJointPosition(pri01)
--Q6
pos00=simGetJointPosition(pri00)

-- set the q_out vector
q_out[1] = -pos21
q_out[2] = revoluteJointS21_pos
q_out[3] = pos11
q_out[4] = -revoluteJointS11_pos
q_out[5] = pos01
q_out[6] = -pos00

--pack data into floats
data_out=simPackFloats(q_out,0,6)
--send data
result=simExtShareMemoryWrite(floatMem_OUT,data_out)
pos22=simGetJointPosition(pri22)

simAuxiliaryConsolePrint(console,'L1:')
simAuxiliaryConsolePrint(console,pos11)
simAuxiliaryConsolePrint(console,'\n')
simAuxiliaryConsolePrint(console,'L2:')
simAuxiliaryConsolePrint(console,pos12)
simAuxiliaryConsolePrint(console,'\n')
simAuxiliaryConsolePrint(console,'joint:')
simAuxiliaryConsolePrint(console,revoluteJointS11_pos)
simAuxiliaryConsolePrint(console,'\n')


--simAuxiliaryConsolePrint(console,'\n')
--simAuxiliaryConsolePrint(console,q_in[1])
--simAuxiliaryConsolePrint(console,'\n')
--simAuxiliaryConsolePrint(console,q_in[2])
--simAuxiliaryConsolePrint(console,'\n')
--simAuxiliaryConsolePrint(console,q_in[3])
--simAuxiliaryConsolePrint(console,'\n')
--simAuxiliaryConsolePrint(console,q_in[4])
--simAuxiliaryConsolePrint(console,'\n')
--simAuxiliaryConsolePrint(console,q_in[5])
--simAuxiliaryConsolePrint(console,'\n')
--simAuxiliaryConsolePrint(console,q_in[6])
--simAuxiliaryConsolePrint(console,'\n')
--simAuxiliaryConsolePrint(console,'--------------')
--simAuxiliaryConsolePrint(console,'\n')

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