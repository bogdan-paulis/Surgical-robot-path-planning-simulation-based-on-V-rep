% Copyright 2006-2016 Coppelia Robotics GmbH. All rights reserved. 
% marc@coppeliarobotics.com
% www.coppeliarobotics.com
% 
% -------------------------------------------------------------------
% THIS FILE IS DISTRIBUTED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED
% WARRANTY. THE USER WILL USE IT AT HIS/HER OWN RISK. THE ORIGINAL
% AUTHORS AND COPPELIA ROBOTICS GMBH WILL NOT BE LIABLE FOR DATA LOSS,
% DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING OR
% MISUSING THIS SOFTWARE.
% 
% You are free to use/modify/distribute this file for whatever purpose!
% -------------------------------------------------------------------
%
% This file was automatically created for V-REP release V3.3.2 on August 29th 2016

% This example illustrates how to execute complex commands from
% a remote API client. You can also use a similar construct for
% commands that are not directly supported by the remote API.
%
% Load the demo scene 'remoteApiCommandServerExample.ttt' in V-REP, then 
% start the simulation and run this program.
%
% IMPORTANT: for each successful call to simxStart, there
% should be a corresponding call to simxFinish at the end!

function complexCommandTest()

    disp('Program started');
    % vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
    vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    vrep.simxFinish(-1); % just in case, close all opened connections
    clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

    if (clientID>-1)
        disp('Connected to remote API server');
        
        % 1. First send a command to display a specific message in a dialog box:
       % [res retInts retFloats retStrings retBuffer]=vrep.simxCallScriptFunction(clientID,'remoteApiCommandServer',vrep.sim_scripttype_childscript,'displayText_function',[],[],'Hello world!',[],vrep.simx_opmode_blocking);
%         if (res==vrep.simx_return_ok)
%             fprintf('Returned message: %s\n',retStrings);
%         else
%             fprintf('Remote function call failed\n');
%         end
%         for i=1:1
%         [res retInts retFloats retStrings retBuffer]=vrep.simxCallScriptFunction(clientID,'remoteApiCommandServer',vrep.sim_scripttype_childscript,'Prismatic_control',[],[],'Hello world!',[],vrep.simx_opmode_blocking);
%         end
%         if (res==vrep.simx_return_ok)
%             fprintf('Returned message: %s\n',retStrings);
%         else
%             fprintf('Remote function call failed\n');
%         end
%         if (simxGetObjectHandle(clientID,"Prismatic_joint0",&jointHandle,simx_opmode_blocking)==simx_return_ok) 
% {
%     // here we have the joint handle in variable jointHandle!    
% }
[returnCode,handle]=vrep.simxGetObjectHandle(clientID,'Prismatic_joint0#',vrep.simx_opmode_oneshot_wait)
if (vrep.simxGetObjectHandle(clientID,handle,vrep.simx_opmode_blocking)==vrep.simx_return_ok) 
{
    %%// here we have the joint handle in variable jointHandle!    
         vrep.simxSetJointPosition(clientID,leg,0.01,vrep.simx_opmode_oneshot);
}
end
        leg=vrep.simxGetObjectHandle(clientID,'Prismatic_joint0',vrep.simx_opmode_blocking);
        for i=1:100
     send=vrep.simxSetJointTargetPosition(clientID,handle,0.1,vrep.simx_opmode_oneshot);
        end
%vrep.simxSetJointPosition(clientID,'Prismatic_joint0',0.1,vrep.simx_opmode_oneshot);

%         % 2. Now create a dummy object at coordinate 0.1,0.2,0.3 with name 'MyDummyName':
%         [res retInts retFloats retStrings retBuffer]=vrep.simxCallScriptFunction(clientID,'remoteApiCommandServer',vrep.sim_scripttype_childscript,'createDummy_function',[],[0.1 0.2 0.3],'MyDummyName',[],vrep.simx_opmode_blocking);
%         if (res==vrep.simx_return_ok)
%             fprintf('Dummy handle: %d\n',retInts(1));
%         else
%             fprintf('Remote function call failed\n');
%         end
% 
%         % 3. Now send a code string to execute some random functions:
%         code=['local octreeHandle=simCreateOctree(0.5,0,1)', char(10), ...
%             'simInsertVoxelsIntoOctree(octreeHandle,0,{0.1,0.1,0.1},{255,0,255})', char(10), ...
%             'return ''done'''];
%         [res retInts retFloats retStrings retBuffer]=vrep.simxCallScriptFunction(clientID,'remoteApiCommandServer',vrep.sim_scripttype_childscript,'executeCode_function',[],[],code,[],vrep.simx_opmode_blocking);
%            code=['pri1=simGetObjectHandle(''Prismatic_joint0'')', char(10), ...
%             'simSetJointTargetPosition(pri1,0.01)', char(10), ...
%             'return ''done'''];
%                 [res retInts retFloats retStrings retBuffer]=vrep.simxCallScriptFunction(clientID,'remoteApiCommandServer',vrep.sim_scripttype_childscript,'executeCode_function',[],[],code,[],vrep.simx_opmode_blocking);
% 
%         if (res==vrep.simx_return_ok)
%             fprintf('Code execution returned: %s\n',retStrings);
%         else
%             fprintf('Remote function call failed\n');
%         end

        % Now close the connection to V-REP:    
        vrep.simxFinish(clientID);
    else
        disp('Failed connecting to remote API server');
    end
    vrep.delete(); % call the destructor!
    
    disp('Program ended');
end























% -- DO NOT WRITE CODE OUTSIDE OF THE if-then-end SECTIONS BELOW!! (unless the code is a function definition)
% 
% if (sim_call_type==sim_childscriptcall_initialization) then
% 
% 	-- Put some initialization code here
% 
% --    pri1=simGetObjectHandle('Prismatic_joint0')
% --pri2=simGetObjectHandle('Prismatic_joint')
% 
% 
% 	-- Make sure you read the section on "Accessing general-type objects programmatically"
% 	-- For instance, if you wish to retrieve the handle of a scene object, use following instruction:
% 	--
% 	-- handle=simGetObjectHandle('sceneObjectName')
% 	-- 
% 	-- Above instruction retrieves the handle of 'sceneObjectName' if this script's name has no '#' in it
% 	--
% 	-- If this script's name contains a '#' (e.g. 'someName#4'), then above instruction retrieves the handle of object 'sceneObjectName#4'
% 	-- This mechanism of handle retrieval is very convenient, since you don't need to adjust any code when a model is duplicated!
% 	-- So if the script's name (or rather the name of the object associated with this script) is:
% 	--
% 	-- 'someName', then the handle of 'sceneObjectName' is retrieved
% 	-- 'someName#0', then the handle of 'sceneObjectName#0' is retrieved
% 	-- 'someName#1', then the handle of 'sceneObjectName#1' is retrieved
% 	-- ...
% 	--
% 	-- If you always want to retrieve the same object's handle, no matter what, specify its full name, including a '#':
% 	--
% 	-- handle=simGetObjectHandle('sceneObjectName#') always retrieves the handle of object 'sceneObjectName' 
% 	-- handle=simGetObjectHandle('sceneObjectName#0') always retrieves the handle of object 'sceneObjectName#0' 
% 	-- handle=simGetObjectHandle('sceneObjectName#1') always retrieves the handle of object 'sceneObjectName#1'
% 	-- ...
% 	--
% 	-- Refer also to simGetCollisionhandle, simGetDistanceHandle, simGetIkGroupHandle, etc.
% 	--
% 	-- Following 2 instructions might also be useful: simGetNameSuffix and simSetNameSuffix
% 
% end
% 
% 
if (sim_call_type==sim_childscriptcall_actuation) then
message,auxiliaryData=simGetSimulatorMessage()
while message~=-1 do
   if (message==sim_message_keypress) then
      if (auxiliaryData[1]==2007) then
         -- up key
--    simSetJointTargetPosition(pri1,-0.02)

      end
      if (auxiliaryData[1]==2008) then
         -- down key
--simSetJointTargetPosition(pri1,0.01)
      end
      if (auxiliaryData[1]==2009) then
         -- left key
--simSetJointTargetPosition(pri2,-0.01)
      end
      if (auxiliaryData[1]==2010) then
--simSetJointTargetPosition(pri2,0.01)

         -- right key
      end
   end
   message,auxiliaryData=simGetSimulatorMessage()
end
% 
% 
% 
% 
% 	-- Put your main ACTUATION code here
% 
% 	-- For example:
% 	--
% 	-- local position=simGetObjectPosition(handle,-1)
% 	-- position[1]=position[1]+0.001
% 	-- simSetObjectPosition(handle,-1,position)
% 
% end
% 
% 
% if (sim_call_type==sim_childscriptcall_sensing) then
% 
% 	-- Put your main SENSING code here
% 
% end
% 
% 
% if (sim_call_type==sim_childscriptcall_cleanup) then
% 
% 	-- Put some restoration code here
% 
% end
