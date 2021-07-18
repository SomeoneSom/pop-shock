--repeating this so that size is constant through the week
--yay winapi bc we need to detect what monitor the window is on and find the size of that window
local ffi = require("ffi")
ffi.cdef[[
    typedef void *PVOID;
    typedef PVOID HANDLE;
    typedef HANDLE HMONITOR;
    typedef unsigned long DWORD;
    typedef long LONG;
    typedef struct tagRECT {
        LONG left;
        LONG top;
        LONG right;
        LONG bottom;
    } RECT, *PRECT, *NPRECT, *LPRECT;
    typedef struct tagMONITORINFO {
        DWORD cbSize;
        RECT  rcMonitor;
        RECT  rcWork;
        DWORD dwFlags;
    } MONITORINFO, *LPMONITORINFO;
    typedef int BOOL;
    typedef struct tagPOINT {
        LONG x;
        LONG y;
    } POINT, *PPOINT, *NPPOINT, *LPPOINT;
    HMONITOR MonitorFromPoint(POINT pt, DWORD dwFlags);
    BOOL GetMonitorInfoW(HMONITOR hMonitor, LPMONITORINFO lpmi);
]]
--the actual normal stuff
function start(song)
    print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)
    --just kidding more winapi!
    local pt = ffi.new("POINT")
    pt.x = 0
    pt.y = 0
    local monitor = ffi.C.MonitorFromPoint(pt, 2)
    local lpmoninf = ffi.new("MONITORINFO[1]")
    lpmoninf[0].cbSize = ffi.sizeof("MONITORINFO")
    ffi.C.GetMonitorInfoW(monitor, lpmoninf)
    local moninf = ffi.new("MONITORINFO")
    local moninf = lpmoninf[0]
    --ok now normal stuff pretty much
    measurex = moninf.rcMonitor.right * 1 / 6
    measurey = moninf.rcMonitor.bottom * 1 / 6
    local sizex = moninf.rcMonitor.right * 4 / 6
    local sizey = moninf.rcMonitor.bottom * 4 / 6
    moveWindow(measurex, measurey, sizex, sizey)
end
function update(elapsed)
    --do nothing
end
function beatHit(beat)
    --do nothing
end
function stepHit(step)
    --eventually do something
end
--shut your heckin' mouth playstate.hx line 238
function playerOneSing(shut, your)
    --do nothing
end
function playerTwoSing(heckin, mouth)
    --do nothing
end
function playerOneTurn(shut, your)
    --do nothing
end
function playerTwoTurn(heckin, mouth)
    --do nothing
end
function playerOneMiss(shut, your)
    --do nothing
end
function playerTwoMiss(heckin, mouth)
    --do nothing
end