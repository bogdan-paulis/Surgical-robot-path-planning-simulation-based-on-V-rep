-- DO NOT WRITE CODE OUTSIDE OF THE if-then-end SECTIONS BELOW!! (unless the code is a function definition)
--VERSION 1.1 : Entrega la imagen invertida para simplificar el procesamiento en el cliente 
if (sim_call_type==sim_childscriptcall_initialization) then
	id=tonumber(simGetScriptSimulationParameter(sim_handle_self,"Id Camara"))
	cam=simGetObjectHandle('vrepCam')
	view=simFloatingViewAdd(0.9,0.9,0.2,0.2,0)
	simAdjustView(view,cam,64)
	resolution=simGetVisionSensorResolution(cam) 
-- Input: (position/orientation)-->Vrep -->Output: (RGB image)
	result,floatMem_IN  =simExtShareMemoryOpen("vrepCam_entrada_"..id,3*4*2) --position (3 float),Orientation (3 float ) is 32bit system. float has 4 bytes 4*6=24
	result,charMem_OUT  =simExtShareMemoryOpen("vrepCam_salida_"..id ,resolution[1]*resolution[2]*3) --RGB (char)
    position={0.0,0.0,0.0}
	eulerAngles={0.0,0.0,0.0}
end


if (sim_call_type==sim_childscriptcall_actuation) then
	imageBuffer,resolutionX,resolutionY=simGetVisionSensorCharImage(cam,0,0,0,0)
	result=simExtShareMemoryWrite(charMem_OUT,imageBuffer)
	result,data=simExtShareMemoryRead(floatMem_IN)
	position=simUnpackFloats(data,0,3)
	eulerAngles=simUnpackFloats(data,3,3)
	simSetObjectPosition(cam,-1,position)
	simSetObjectOrientation(cam,-1,eulerAngles)

end


if (sim_call_type==sim_childscriptcall_sensing) then

	-- Put your main SENSING code here

end


if (sim_call_type==sim_childscriptcall_cleanup) then
--close all memories
	simExtShareMemoryClose();

end