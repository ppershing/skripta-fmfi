%% inputs
draw subpath(2,3) of (inout_path(k[1],2,1,k[1],2,1));
draw inout_path(k[1],2,1,s[1],2,1);
draw subpath(2,3) of (inout_path(k[1],2,2,k[1],2,2));
draw inout_path(k[1],2,2,s[1],2,2);
draw subpath(2,3) of (inout_path(k[1],3,0,k[1],3,0));
draw inout_path(k[1],3,0,s[1],3,0);
draw subpath(2,3) of (inout_path(k[1],3,3,k[1],3,3));
draw inout_path(k[1],3,3,s[1],3,3);
% round 1
draw inout_path(s[1],2,2,k[2],2,2);
draw inout_path(s[1],2,3,k[2],3,2);
draw inout_path(s[1],3,2,k[2],2,3);
draw inout_path(s[1],3,3,k[2],3,3);

draw inout_path(k[1],2,1,s[1],2,1);
draw inout_path(k[1],2,2,s[1],2,2);
draw inout_path(k[1],3,0,s[1],3,0);
draw inout_path(k[1],3,3,s[1],3,3);
% round 2
draw inout_path(s[2],2,0,k[3],0,2);
draw inout_path(s[2],2,2,k[3],2,2);
draw inout_path(s[2],3,0,k[3],0,3);
draw inout_path(s[2],3,2,k[3],2,3);

draw inout_path(k[2],2,2,s[2],2,2);
draw inout_path(k[2],3,2,s[2],3,2);
draw inout_path(k[2],2,3,s[2],2,3);
draw inout_path(k[2],3,3,s[2],3,3);
% round 3
draw inout_path(s[3],0,0,k[4],0,0);
draw inout_path(s[3],0,2,k[4],2,0);
draw inout_path(s[3],2,0,k[4],0,2);
draw inout_path(s[3],2,2,k[4],2,2);

draw inout_path(k[3],0,2,s[3],0,2);
draw inout_path(k[3],2,2,s[3],2,2);
draw inout_path(k[3],0,3,s[3],0,3);
draw inout_path(k[3],2,3,s[3],2,3);
%% final round
draw inout_path(k[4],0,0,s[4],0,0);
draw inout_path(k[4],2,0,s[4],2,0);
draw inout_path(k[4],0,2,s[4],0,2);
draw inout_path(k[4],2,2,s[4],2,2);
%% final boxes
draw inout_path(s[4],0,0,k[5],0,0);
draw subpath(0,1) of (inout_path(k[5],0,0,k[5],0,0));
draw inout_path(s[4],0,1,k[5],0,1);
draw subpath(0,1) of (inout_path(k[5],0,1,k[5],0,1));
draw inout_path(s[4],0,2,k[5],0,2);
draw subpath(0,1) of (inout_path(k[5],0,2,k[5],0,2));
draw inout_path(s[4],0,3,k[5],0,3);
draw subpath(0,1) of (inout_path(k[5],0,3,k[5],0,3));
draw inout_path(s[4],2,0,k[5],2,0);
draw subpath(0,1) of (inout_path(k[5],2,0,k[5],2,0));
draw inout_path(s[4],2,1,k[5],2,1);
draw subpath(0,1) of (inout_path(k[5],2,1,k[5],2,1));
draw inout_path(s[4],2,2,k[5],2,2);
draw subpath(0,1) of (inout_path(k[5],2,2,k[5],2,2));
draw inout_path(s[4],2,3,k[5],2,3);
draw subpath(0,1) of (inout_path(k[5],2,3,k[5],2,3));
