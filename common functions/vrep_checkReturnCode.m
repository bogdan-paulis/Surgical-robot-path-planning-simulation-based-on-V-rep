function [  ] = vrep_checkReturnCode( returnCode )
%VREP_CHECKRETURNCODE Summary of this function goes here
% displays Remote API function return codes for the Vrep MAtlab Api
%   Detailed explanation goes here

simx_return_ok                      =0;
simx_return_novalue_flag            =1;     
simx_return_timeout_flag            =2;     
simx_return_illegal_opmode_flag     =4;     
simx_return_remote_error_flag       =8;     
simx_return_split_progress_flag     =16;        
simx_return_local_error_flag        =32;        
simx_return_initialize_error_flag   =64; 

switch returnCode
   case simx_return_ok
    disp('simx_return_ok');
   case simx_return_novalue_flag
    disp('simx_return_novalue_flag');
  case simx_return_timeout_flag
    disp('simx_return_timeout_flag');
  case simx_return_illegal_opmode_flag
     disp('simx_return_illegal_opmode_flag');
  case simx_return_remote_error_flag
    disp('simx_return_remote_error_flag');
  case simx_return_split_progress_flag
    disp('simx_return_split_progress_flag');
  case simx_return_local_error_flag
    disp('simx_return_local_error_flag');
  case simx_return_initialize_error_flag
    disp('simx_return_initialize_error_flag');

   otherwise
      disp('not a valid Remote API function return code');
end


        
end

