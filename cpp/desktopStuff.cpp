#define IMPLEMENT_API
#include "include/hx/CFFI.h"
#include <iostream>
#include <string>
#include <windows.h>
#include <ShlObj.h>
#include <atlbase.h>
#include <locale>
#include <fstream>
#include <codecvt>
class CCoInitialize {
    public:
	    CCoInitialize() : m_hr(CoInitialize(NULL)) { }
	    ~CCoInitialize() { if (SUCCEEDED(m_hr)) CoUninitialize(); }
	    operator HRESULT() const { return m_hr; }
	    HRESULT m_hr;
};
void FindDesktopFolderView(REFIID riid, void **ppv) {
	CComPtr<IShellWindows> spShellWindows;
	spShellWindows.CoCreateInstance(CLSID_ShellWindows);
	CComVariant vtLoc(CSIDL_DESKTOP);
	CComVariant vtEmpty;
	long lhwnd;
	CComPtr<IDispatch> spdisp;
	spShellWindows->FindWindowSW(&vtLoc, &vtEmpty, SWC_DESKTOP, &lhwnd, SWFO_NEEDDISPATCH, &spdisp);
	CComPtr<IShellBrowser> spBrowser;
	CComQIPtr<IServiceProvider>(spdisp)->QueryService(SID_STopLevelBrowser, IID_PPV_ARGS(&spBrowser));
	CComPtr<IShellView> spView;
	spBrowser->QueryActiveShellView(&spView);
	spView->QueryInterface(riid, ppv);
}
extern "C" {
    value setUpDesktop() {
        WCHAR wallBuff[256];
        WCHAR pathBuff[256];
        GetCurrentDirectoryW(256, pathBuff);
        std::wstring_convert<std::codecvt_utf8<wchar_t>, wchar_t> converter;
        std::string saveTo = converter.to_bytes(pathBuff) + "\\originalDesktop.txt";
        std::wstring fullpath(std::wstring(pathBuff) + L"\\bgs\\B2.png");
        HWND taskbar = FindWindowW(L"Shell_TrayWnd", NULL);
        if (!taskbar) {
            std::cout << "Finding taskbar failed with error: " << GetLastError() << std::endl;
            return alloc_int(0);
        }
        CCoInitialize initCom;
        CComPtr<IFolderView2> desktop;
        FindDesktopFolderView(IID_PPV_ARGS(&desktop));
        if (desktop == NULL) {
            std::cout << "Getting desktop failed" << std::endl;
            return alloc_int(0);
        }
        DWORD flags = 0;
        desktop->GetCurrentFolderFlags(&flags);
        desktop->SetCurrentFolderFlags(FWF_NOICONS, flags ^ FWF_NOICONS);
        ShowWindow(taskbar, SW_HIDE);
        SystemParametersInfoW(SPI_GETDESKWALLPAPER, 256, &wallBuff, NULL);
        std::wofstream saver;
        saver.open(saveTo.c_str());
        if (!saver) {
            std::cout << "Opening saver failed" << std::endl;
            return alloc_int(0);
        }
        saver << wallBuff << std::endl;
        saver.close();
        SystemParametersInfoW(SPI_SETDESKWALLPAPER, 0, (void *)fullpath.c_str(), SPIF_UPDATEINIFILE | SPIF_SENDCHANGE);
        HWND hwnd = FindWindowA(NULL, "Friday Night Funkin' Pop Shock");
        return alloc_int(0);
    }
    value restoreDesktop() {
        WCHAR pathBuff[256];
        GetCurrentDirectoryW(256, pathBuff);
        std::wstring_convert<std::codecvt_utf8<wchar_t>, wchar_t> converter;
        std::string saveTo = converter.to_bytes(pathBuff) + "\\originalDesktop.txt";
        HWND taskbar = FindWindowW(L"Shell_TrayWnd", NULL);
        if (!taskbar) {
            std::cout << "Finding taskbar failed with error: " << GetLastError() << std::endl;
            return alloc_int(0);
        }
        CCoInitialize initCom;
        CComPtr<IFolderView2> desktop;
        FindDesktopFolderView(IID_PPV_ARGS(&desktop));
        if (desktop == NULL) {
            std::cout << "Getting desktop failed" << std::endl;
            return alloc_int(0);
        }
        desktop->SetCurrentFolderFlags(FWF_NOICONS, ~FWF_NOICONS);
        ShowWindow(taskbar, SW_SHOW);
        WCHAR readBuff[256];
        std::wifstream loader;
        loader.open(saveTo.c_str());
        if (!loader) {
            std::cout << "Opening loader failed" << std::endl;
            return alloc_int(0);
        }
        loader.getline(readBuff, 256);
        loader.close();
        SystemParametersInfoW(SPI_SETDESKWALLPAPER, 0, &readBuff, SPIF_UPDATEINIFILE | SPIF_SENDCHANGE);
        return alloc_int(0);
    }
    value toggleTaskbar(value show) {
        HWND taskbar = FindWindowW(L"Shell_TrayWnd", NULL);
        if (!taskbar) {
            std::cout << "Finding taskbar failed with error: " << GetLastError() << std::endl;
            return alloc_int(0);
        }
        if (val_int(show) == 1) {
            ShowWindow(taskbar, SW_SHOW);
        } else {
            ShowWindow(taskbar, SW_HIDE);
        }
        return alloc_int(0);
    }
    /*value setWinSize() {
        POINT pt = {0, 0};
        HMONITOR monitor = MonitorFromPoint(pt, 2);
        MONITORINFO moninf;
        moninf.cbSize = sizeof(MONITORINFO);
        GetMonitorInfoW(monitor, &moninf);
        int measurex = moninf.rcMonitor.right * 1 / 6;
        int measurey = moninf.rcMonitor.bottom * 1 / 6;
        int sizex = moninf.rcMonitor.right * 4 / 6;
        int sizey = moninf.rcMonitor.bottom * 4 / 6;
        HWND hwnd = FindWindowW(NULL, L"Friday Night Funkin' Pop Shock");
        MoveWindow(hwnd, measurex, measurey, sizex, sizey, TRUE);
        return alloc_int(0);
    }*/
    value getW() {
        POINT pt = {0, 0};
        HMONITOR monitor = MonitorFromPoint(pt, 2);
        MONITORINFO moninf;
        moninf.cbSize = sizeof(MONITORINFO);
        GetMonitorInfoW(monitor, &moninf);
        return alloc_int(moninf.rcMonitor.right * 4 / 6);
    }
    value getH() {
        POINT pt = {0, 0};
        HMONITOR monitor = MonitorFromPoint(pt, 2);
        MONITORINFO moninf;
        moninf.cbSize = sizeof(MONITORINFO);
        GetMonitorInfoW(monitor, &moninf);
        return alloc_int(moninf.rcMonitor.bottom * 4 / 6);
    }
    value getMX() {
        POINT pt = {0, 0};
        HMONITOR monitor = MonitorFromPoint(pt, 2);
        MONITORINFO moninf;
        moninf.cbSize = sizeof(MONITORINFO);
        GetMonitorInfoW(monitor, &moninf);
        return alloc_int(moninf.rcMonitor.right * 1 / 6);
    }
    value getMY() {
        POINT pt = {0, 0};
        HMONITOR monitor = MonitorFromPoint(pt, 2);
        MONITORINFO moninf;
        moninf.cbSize = sizeof(MONITORINFO);
        GetMonitorInfoW(monitor, &moninf);
        return alloc_int(moninf.rcMonitor.bottom * 1 / 6);
    }
}
DEFINE_PRIM(setUpDesktop, 0);
DEFINE_PRIM(restoreDesktop, 0);
DEFINE_PRIM(toggleTaskbar, 1);
//DEFINE_PRIM(setWinSize, 0);
DEFINE_PRIM(getW, 0);
DEFINE_PRIM(getH, 0);
DEFINE_PRIM(getMX, 0);
DEFINE_PRIM(getMY, 0);