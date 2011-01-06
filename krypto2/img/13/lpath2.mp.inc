%% inputs
draw subpath(2,3) of (inout_path(k[1],0,0,k[1],0,0));
draw inout_path(k[1],0,0,s[1],0,0);
draw subpath(2,3) of (inout_path(k[1],0,2,k[1],0,2));
draw inout_path(k[1],0,2,s[1],0,2);
draw subpath(2,3) of (inout_path(k[1],0,3,k[1],0,3));
draw inout_path(k[1],0,3,s[1],0,3);
% round 1
draw inout_path(s[1],0,1,k[2],1,0);

draw inout_path(k[1],0,0,s[1],0,0);
draw inout_path(k[1],0,2,s[1],0,2);
draw inout_path(k[1],0,3,s[1],0,3);
% round 2
draw inout_path(s[2],1,0,k[3],0,1);

draw inout_path(k[2],1,0,s[2],1,0);
% round 3
draw inout_path(s[3],0,0,k[4],0,0);
draw inout_path(s[3],0,1,k[4],1,0);

draw inout_path(k[3],0,1,s[3],0,1);
%% final round
draw inout_path(k[4],0,0,s[4],0,0);
draw inout_path(k[4],1,0,s[4],1,0);
%% final boxes
draw inout_path(s[4],0,0,k[5],0,0);
draw subpath(0,1) of (inout_path(k[5],0,0,k[5],0,0));
draw inout_path(s[4],0,1,k[5],0,1);
draw subpath(0,1) of (inout_path(k[5],0,1,k[5],0,1));
draw inout_path(s[4],0,2,k[5],0,2);
draw subpath(0,1) of (inout_path(k[5],0,2,k[5],0,2));
draw inout_path(s[4],0,3,k[5],0,3);
draw subpath(0,1) of (inout_path(k[5],0,3,k[5],0,3));
draw inout_path(s[4],1,0,k[5],1,0);
draw subpath(0,1) of (inout_path(k[5],1,0,k[5],1,0));
draw inout_path(s[4],1,1,k[5],1,1);
draw subpath(0,1) of (inout_path(k[5],1,1,k[5],1,1));
draw inout_path(s[4],1,2,k[5],1,2);
draw subpath(0,1) of (inout_path(k[5],1,2,k[5],1,2));
draw inout_path(s[4],1,3,k[5],1,3);
draw subpath(0,1) of (inout_path(k[5],1,3,k[5],1,3));
