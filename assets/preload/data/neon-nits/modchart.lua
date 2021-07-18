--yay winapi bc we need to detect what monitor the window is on and find the size of that window
--jk we just using primary display
local ffi = require("ffi")
local measurex
local measurey
local offset = 0
local flag = true
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

    --add to the mod queues
    --1pm 7/16/21: just now realized there are semicolons but it doesnt break it and i dont care enough\lol
    --amp
    amp(64, 68, measurex / -2, 0);
    amp(68, 72, measurex / 2, 0);
    amp(72, 76, 0, measurey / -2);
    amp(76, 88, 0, measurey / 2);
    amp(88, 92, 0, measurey / -2);
    amp(92, 96, 0, measurey / 2);
    amp(96, 100, measurex / -2, 0);
    amp(100, 104, measurex / 2, 0);
    amp(104, 108, 0, measurey / -2);
    amp(108, 117, 0, measurey / 2);
    amp(117, 121, 0, measurey / -2);
    amp(121, 122, measurex / -4, 0);
    amp(122, 124, measurex / 4, 0);
    amp(124, 126, 0, measurey / 4);
    amp(126, 128, 0, measurey / -4);
    amp(128, 132, measurex / -2, 0);
    amp(132, 136, measurex / 2, 0);
    amp(136, 140, 0, measurey / -2);
    amp(140, 152, 0, measurey / 2);
    amp(152, 156, 0, measurey / -2);
    amp(156, 160, 0, measurey / 2);
    amp(160, 164, measurex / -2, 0);
    amp(164, 168, measurex / 2, 0);
    amp(168, 172, 0, measurey / -2);
    amp(172, 181, 0, measurey / 2);
    amp(181, 185, 0, measurey / -2);
    amp(185, 186, measurex / -4, 0);
    amp(186, 188, measurex / 4, 0);
    amp(188, 190, 0, measurey / 4);
    amp(190, 192, 0, measurey / -4);
    amp(192, 196, 0, measurey / -2);
    amp(196, 200, 0, measurey / 2);
    amp(200, 204, measurex / 2, 0);
    amp(204, 208, measurex / -2, 0);
    amp(208, 212, 0, measurey / 2);
    amp(212, 216, measurex / 2, 0);
    amp(216, 220, 0, measurey / -2);
    amp(220, 224, measurex / -2, 0);
    amp(224, 228, measurex / 2, 0);
    amp(228, 232, 0, measurey / 2);
    amp(232, 236, measurex / -2, 0);
    amp(236, 240, 0, measurey / -2);
    amp(240, 244, 0, measurey / 2);
    amp(244, 248, measurex / -2, 0);
    amp(248, 252, 0, measurey / -2);
    amp(252, 256, 0, measurey / 2);
    amp(256, 260, 0, measurey / -2);
    amp(260, 264, 0, measurey / 2);
    amp(264, 268, measurex / 2, 0);
    amp(268, 272, measurex / -2, 0);
    amp(272, 276, 0, measurey / 2);
    amp(276, 280, measurex / 2, 0);
    amp(280, 284, 0, measurey / -2);
    amp(284, 288, measurex / -2, 0);
    amp(288, 292, measurex / 2, 0);
    amp(292, 296, 0, measurey / 2);
    amp(296, 300, measurex / -2, 0);
    amp(300, 304, 0, measurey / -2);
    amp(304, 308, 0, measurey / 2);
    amp(308, 312, measurex / -2, 0);
    amp(312, 316, 0, measurey / -2);
    amp(316, 320, 0, measurey / 2);
    amp(448, 452, 0, measurey / -4);
    amp(452, 454, measurex / -4, 0);
    amp(454, 455, 0, measurey / 4);
    amp(455, 459, measurex / 4, 0);
    amp(459, 461, 0, measurey / 4);
    amp(461, 464, measurex / -4, 0);
    amp(464, 466, 0, measurey / -4);
    amp(466, 468, 0, measurey / -4);
    amp(468, 469, measurex / -4, 0);
    amp(469, 470, measurex / -4, 0);
    amp(470, 472, measurex / 4, 0);
    amp(472, 476, 0, measurey / 4);
    amp(476, 480, measurex / -4, 0);
    amp(480, 485, 0, measurey / 4);
    amp(485, 486, measurex / -4, 0);
    amp(486, 488, 0, measurey / -4);
    amp(488, 491, 0, measurey / 4);
    amp(491, 493, measurex / -4, 0);
    amp(493, 494, measurex / 4, 0);
    amp(494, 496, 0, measurey / -4);
    amp(496, 500, 0, measurey / -4);
    amp(500, 501, 0, measurey / 4);
    amp(501, 503, measurex / -4, 0);
    amp(503, 506, 0, measurey / 4);
    amp(506, 506.5, measurex / -4, 0);
    amp(506.5, 507, measurex / 4, 0);
    amp(507, 507.5, measurex / -4, 0);
    amp(507.5, 509, measurex / 4, 0);
    amp(509, 510, measurex / -4, 0);
    amp(510, 512, 0, measurey / -4);
    amp(512, 516, 0, measurey / -4);
    amp(516, 518, measurex / -4, 0);
    amp(518, 519, 0, measurey / 4);
    amp(519, 523, measurex / 4, 0);
    amp(523, 525, 0, measurey / 4);
    amp(525, 528, measurex / -4, 0);
    amp(528, 530, 0, measurey / -4);
    amp(530, 532, 0, measurey / -4);
    amp(532, 533, measurex / -4, 0);
    amp(533, 534, measurex / -4, 0);
    amp(534, 536, measurex / 4, 0);
    amp(536, 540, 0, measurey / 4);
    amp(540, 544, measurex / -4, 0);
    amp(544, 549, 0, measurey / 4);
    amp(549, 550, measurex / -4, 0);
    amp(550, 552, 0, measurey / -4);
    amp(552, 555, 0, measurey / 4);
    amp(555, 557, measurex / -4, 0);
    amp(557, 558, measurex / 4, 0);
    amp(558, 560, 0, measurey / -4);
    amp(560, 564, 0, measurey / -4);
    amp(564, 565, 0, measurey / 4);
    amp(565, 567, measurex / -4, 0);
    amp(567, 570, 0, measurey / 4);
    amp(570, 570.5, measurex / -4, 0);
    amp(570.5, 571, measurex / 4, 0);
    amp(571, 571.5, measurex / -4, 0);
    amp(571.5, 573, measurex / 4, 0);
    amp(573, 574, measurex / -4, 0);
    amp(574, 576, 0, measurey / -4);
    amp(576, 584, 0, measurey / -4);
    amp(584, 585, measurex / -4, 0);
    amp(585, 587, 0, measurey / 4);
    amp(587, 588, measurex / 4, 0);
    amp(588, 589, 0, measurey / 4);
    amp(589, 592, measurex / -4, 0);
    amp(592, 596, measurex / 4, 0);
    amp(596, 600, 0, measurey / 4);
    amp(600, 604, measurex / -4, 0);
    amp(604, 608, 0, measurey / 4);
    amp(608, 609, 0, measurey / -4);
    amp(609, 611, 0, measurey / 4);
    amp(611, 612, 0, measurey / 4);
    amp(612, 613, 0, measurey / 4);
    amp(613, 614, measurex / -4, 0);
    amp(614, 615, measurex / 4, 0);
    amp(615, 616, 0, measurey / -4);
    amp(616, 617, measurex / -4, 0);
    amp(617, 618, 0, measurey / 4);
    amp(618, 619, 0, measurey / -4);
    amp(619, 620, measurex / 4, 0);
    amp(620, 621, 0, measurey / -4);
    amp(621, 622, measurex / -4, 0);
    amp(622, 624, measurex / 4, 0);
    amp(624, 626, 0, measurey / -4);
    amp(626, 628, 0, measurey / 4);
    amp(628, 630, 0, measurey / -4);
    amp(630, 631, measurex / -4, 0);
    amp(631, 632, measurex / 4, 0);
    amp(632, 633, measurex / -4, 0);
    amp(633, 634, 0, measurey / 4);
    amp(634, 635, 0, measurey / -4);
    amp(635, 636, measurex / 4, 0);
    amp(636, 637, 0, measurey / -4);
    amp(637, 638, 0, measurey / 4);
    amp(638, 640, measurex / -4, 0);
    amp(640, 648, 0, measurey / -4);
    amp(648, 649, measurex / -4, 0);
    amp(649, 651, 0, measurey / 4);
    amp(651, 652, measurex / 4, 0);
    amp(652, 653, 0, measurey / 4);
    amp(653, 656, measurex / -4, 0);
    amp(656, 660, measurex / 4, 0);
    amp(660, 664, 0, measurey / 4);
    amp(664, 668, measurex / -4, 0);
    amp(668, 672, 0, measurey / 4);
    amp(672, 673, 0, measurey / -4);
    amp(673, 675, 0, measurey / 4);
    amp(675, 676, 0, measurey / 4);
    amp(676, 677, 0, measurey / 4);
    amp(677, 678, measurex / -4, 0);
    amp(678, 679, measurex / 4, 0);
    amp(679, 680, 0, measurey / -4);
    amp(680, 681, measurex / -4, 0);
    amp(681, 682, 0, measurey / 4);
    amp(682, 683, 0, measurey / -4);
    amp(683, 684, measurex / 4, 0);
    amp(684, 685, 0, measurey / -4);
    amp(685, 686, measurex / -4, 0);
    amp(686, 688, measurex / 4, 0);
    amp(688, 690, 0, measurey / -4);
    amp(690, 692, 0, measurey / 4);
    amp(692, 694, 0, measurey / -4);
    amp(694, 695, measurex / -4, 0);
    amp(695, 696, measurex / 4, 0);
    amp(696, 697, measurex / -4, 0);
    amp(697, 698, 0, measurey / 4);
    amp(698, 699, 0, measurey / -4);
    amp(699, 700, measurex / 4, 0);
    amp(700, 701, 0, measurey / -4);
    amp(701, 702, 0, measurey / 4);
    amp(702, 708, measurex / -4, 0);
    amp(712, 720, 0, measurey / -2);
    amp(720, 728, measurex / -2, 0);
    amp(728, 736, 0, measurey / 2);
    amp(736, 738, measurex / 4, 0);
    amp(738, 739, measurex / 4, 0);
    amp(739, 741, measurex / -4, 0);
    amp(741, 744, measurex / 4, 0);
    amp(744, 745, measurex / -4, 0);
    amp(745, 746, measurex / 4, 0);
    amp(746, 748, 0, measurey / -4);
    amp(748, 750, 0, measurey / -4);
    amp(750, 752, 0, measurey / 4);
    amp(752, 754, 0, measurey / 4);
    amp(754, 755, 0, measurey / 4);
    amp(755, 757, measurex / 4, 0);
    amp(757, 759, measurex / -4, 0);
    amp(759, 760, measurex / 4, 0);
    amp(760, 761, measurex / -4, 0);
    amp(761, 763, 0, measurey / -4);
    amp(763, 765, 0, measurey / -4);
    amp(765, 767, 0, measurey / 4);
    amp(767, 772, 0, measurey / 4);
    amp(776, 784, 0, measurey / -2);
    amp(784, 792, measurex / -2, 0);
    amp(792, 800, 0, measurey / 2);
    amp(800, 802, measurex / 4, 0);
    amp(802, 803, measurex / 4, 0);
    amp(803, 805, measurex / -4, 0);
    amp(805, 808, measurex / 4, 0);
    amp(808, 809, measurex / -4, 0);
    amp(809, 810, measurex / 4, 0);
    amp(810, 812, 0, measurey / -4);
    amp(812, 814, 0, measurey / -4);
    amp(814, 816, 0, measurey / 4);
    amp(816, 818, 0, measurey / 4);
    amp(818, 819, 0, measurey / 4);
    amp(819, 821, measurex / 4, 0);
    amp(821, 823, measurex / -4, 0);
    amp(823, 824, measurex / 4, 0);
    amp(824, 825, measurex / -4, 0);
    amp(825, 827, 0, measurey / -4);
    amp(827, 829, 0, measurey / -4);
    amp(829, 831, 0, measurey / 4);
    amp(831, 832, 0, measurey / 4);
    amp(832, 838, measurex / -2, 0);
    amp(838, 840, measurex / 2, 0);
    amp(840, 846, 0, measurey / -2);
    amp(846, 848, 0, measurey / 2);
    amp(848, 854, measurex / 2, 0);
    amp(854, 856, measurex / -2, 0);
    amp(856, 862, measurex / 2, 0);
    amp(862, 864, 0, measurey / 2);
    amp(864, 866, measurex / 4, 0);
    amp(866, 867, measurex / 4, 0);
    amp(867, 869, measurex / -4, 0);
    amp(869, 872, measurex / 4, 0);
    amp(872, 873, measurex / -4, 0);
    amp(873, 874, measurex / 4, 0);
    amp(874, 876, 0, measurey / -4);
    amp(876, 878, 0, measurey / -4);
    amp(878, 880, 0, measurey / 4);
    amp(880, 882, 0, measurey / 4);
    amp(882, 883, 0, measurey / 4);
    amp(883, 885, measurex / 4, 0);
    amp(885, 887, measurex / -4, 0);
    amp(887, 888, measurex / 4, 0);
    amp(888, 889, measurex / -4, 0);
    amp(889, 891, 0, measurey / -4);
    amp(891, 893, 0, measurey / -4);
    amp(893, 895, 0, measurey / 4);
    amp(895, 896, 0, measurey / 4);
    amp(896, 902, measurex / -2, 0);
    amp(902, 904, measurex / 2, 0);
    amp(904, 910, 0, measurey / -2);
    amp(910, 912, 0, measurey / 2);
    amp(912, 918, measurex / 2, 0);
    amp(918, 920, measurex / -2, 0);
    amp(920, 926, measurex / 2, 0);
    amp(926, 928, 0, measurey / 4);
    amp(928, 930, measurex / 4, 0);
    amp(930, 931, measurex / 4, 0);
    amp(931, 933, measurex / -4, 0);
    amp(933, 936, measurex / 4, 0);
    amp(936, 937, measurex / -4, 0);
    amp(937, 938, measurex / 4, 0);
    amp(938, 940, 0, measurey / -4);
    amp(940, 942, 0, measurey / -4);
    amp(942, 944, 0, measurey / 4);
    amp(944, 946, 0, measurey / 4);
    amp(946, 947, 0, measurey / 4);
    amp(947, 949, measurex / 4, 0);
    amp(949, 951, measurex / -4, 0);
    amp(951, 952, measurex / 4, 0);
    amp(952, 953, measurex / -4, 0);
    amp(953, 955, 0, measurey / -4);
    amp(955, 957, 0, measurey / -4);
    amp(957, 959, 0, measurey / 4);
    amp(959, 960, 0, measurey / 4);
    amp(960, 964, 0, measurey / -4);
    amp(964, 966, measurex / -4, 0);
    amp(966, 967, 0, measurey / 4);
    amp(967, 971, measurex / 4, 0);
    amp(971, 973, 0, measurey / 4);
    amp(973, 976, measurex / -4, 0);
    amp(976, 978, 0, measurey / -4);
    amp(978, 980, 0, measurey / -4);
    amp(980, 981, measurex / -4, 0);
    amp(981, 982, measurex / -4, 0);
    amp(982, 984, measurex / 4, 0);
    amp(984, 988, 0, measurey / 4);
    amp(988, 992, measurex / -4, 0);
    amp(992, 997, 0, measurey / 4);
    amp(997, 998, measurex / -4, 0);
    amp(998, 1000, 0, measurey / -4);
    amp(1000, 1003, 0, measurey / 4);
    amp(1003, 1005, measurex / -4, 0);
    amp(1005, 1006, measurex / 4, 0);
    amp(1006, 1008, 0, measurey / -4);
    amp(1008, 1012, 0, measurey / -4);
    amp(1012, 1013, 0, measurey / 4);
    amp(1013, 1015, measurex / -4, 0);
    amp(1015, 1018, 0, measurey / 4);
    amp(1018, 1018.5, measurex / -4, 0);
    amp(1018.5, 1019, measurex / 4, 0);
    amp(1019, 1019.5, measurex / -4, 0);
    amp(1019.5, 1021, measurex / 4, 0);
    amp(1021, 1022, measurex / -4, 0);
    amp(1022, 1024, 0, measurey / -4);
    amp(1024, 1028, 0, measurey / -4);
    amp(1028, 1030, measurex / -4, 0);
    amp(1030, 1031, 0, measurey / 4);
    amp(1031, 1035, measurex / 4, 0);
    amp(1035, 1037, 0, measurey / 4);
    amp(1037, 1040, measurex / -4, 0);
    amp(1040, 1042, 0, measurey / -4);
    amp(1042, 1044, 0, measurey / -4);
    amp(1044, 1045, measurex / -4, 0);
    amp(1045, 1046, measurex / -4, 0);
    amp(1046, 1048, measurex / 4, 0);
    amp(1048, 1052, 0, measurey / 4);
    amp(1052, 1056, measurex / -4, 0);
    amp(1056, 1061, 0, measurey / 4);
    amp(1061, 1062, measurex / -4, 0);
    amp(1062, 1064, 0, measurey / -4);
    amp(1064, 1067, 0, measurey / 4);
    amp(1067, 1069, measurex / -4, 0);
    amp(1069, 1070, measurex / 4, 0);
    amp(1070, 1072, 0, measurey / -4);
    amp(1072, 1076, 0, measurey / -4);
    amp(1076, 1077, 0, measurey / 4);
    amp(1077, 1079, measurex / -4, 0);
    amp(1079, 1082, 0, measurey / 4);
    amp(1082, 1082.5, measurex / -4, 0);
    amp(1082.5, 1083, measurex / 4, 0);
    amp(1083, 1083.5, measurex / -4, 0);
    amp(1083.5, 1085, measurex / 4, 0);
    amp(1085, 1086, measurex / -4, 0);
    amp(1086, 1088, 0, measurey / -4);
    amp(1088, 1092, 0, measurey / -4);
    amp(1092, 1094, measurex / -4, 0);
    amp(1094, 1096, measurex / 4, 0);
    amp(1096, 1100, 0, measurey / 4);
    amp(1100, 1103, measurex / -4, 0);
    amp(1103, 1104, 0, measurey / -4);
    amp(1104, 1106, measurex / 4, 0);
    amp(1106, 1107, measurex / 4, 0);
    amp(1107, 1109, measurex / -4, 0);
    amp(1109, 1110, 0, measurey / 4);
    amp(1110, 1112, 0, measurey / -4);
    amp(1112, 1116, measurex / 4, 0);
    amp(1116, 1120, 0, measurey / 4);
    amp(1120, 1122, measurex / -4, 0);
    amp(1122, 1124, measurex / -4, 0);
    amp(1124, 1126, measurex / 4, 0);
    amp(1126, 1128, measurex / -4, 0);
    amp(1128, 1132, 0, measurey / -4);
    amp(1132, 1134, measurex / -4, 0);
    amp(1134, 1136, 0, measurey / -4);
    amp(1136, 1140, measurex / 4, 0);
    amp(1140, 1141, measurex / -4, 0);
    amp(1141, 1143, 0, measurey / -4);
    amp(1143, 1145, measurex / -4, 0);
    amp(1145, 1146, 0, measurey / 4);
    amp(1146, 1147, 0, measurey / -4);
    amp(1147, 1148, measurex / 4, 0);
    amp(1148, 1150, 0, measurey / -4);
    amp(1150, 1152, measurex / -4, 0);
    amp(1152, 1156, 0, measurey / -4);
    amp(1156, 1158, measurex / -4, 0);
    amp(1158, 1160, measurex / 4, 0);
    amp(1160, 1164, 0, measurey / 4);
    amp(1164, 1167, measurex / -4, 0);
    amp(1167, 1168, 0, measurey / -4);
    amp(1168, 1170, measurex / 4, 0);
    amp(1170, 1171, measurex / 4, 0);
    amp(1171, 1173, measurex / -4, 0);
    amp(1173, 1174, 0, measurey / 4);
    amp(1174, 1176, 0, measurey / -4);
    amp(1176, 1180, measurex / 4, 0);
    amp(1180, 1184, 0, measurey / 4);
    amp(1184, 1186, measurex / -4, 0);
    amp(1186, 1188, measurex / -4, 0);
    amp(1188, 1190, measurex / 4, 0);
    amp(1190, 1192, measurex / -4, 0);
    amp(1192, 1196, 0, measurey / -4);
    amp(1196, 1198, measurex / -4, 0);
    amp(1198, 1200, 0, measurey / -4);
    amp(1200, 1204, measurex / 4, 0);
    amp(1204, 1205, measurex / -4, 0);
    amp(1205, 1207, 0, measurey / -4);
    amp(1207, 1209, measurex / -4, 0);
    amp(1209, 1210, 0, measurey / 4);
    amp(1210, 1211, 0, measurey / -4);
    amp(1211, 1212, measurex / 4, 0);
    amp(1212, 1214, 0, measurey / -4);
    amp(1214, 1216, measurex / -4, 0);
    amp(1216, 1224, 0, measurey / -4);
    amp(1224, 1225, measurex / -4, 0);
    amp(1225, 1227, 0, measurey / 4);
    amp(1227, 1228, measurex / 4, 0);
    amp(1228, 1229, 0, measurey / 4);
    amp(1229, 1232, measurex / -4, 0);
    amp(1232, 1236, measurex / 4, 0);
    amp(1236, 1240, 0, measurey / -4);
    amp(1240, 1244, measurex / -4, 0);
    amp(1244, 1248, 0, measurey / 4);
    amp(1248, 1249, 0, measurey / -4);
    amp(1249, 1251, 0, measurey / 4);
    amp(1251, 1252, 0, measurey / 4);
    amp(1252, 1253, 0, measurey / 4);
    amp(1253, 1254, measurex / -4, 0);
    amp(1254, 1255, measurex / 4, 0);
    amp(1255, 1256, 0, measurey / -4);
    amp(1256, 1257, measurex / -4, 0);
    amp(1257, 1258, 0, measurey / 4);
    amp(1258, 1259, 0, measurey / -4);
    amp(1259, 1260, measurex / 4, 0);
    amp(1260, 1261, 0, measurey / -4);
    amp(1261, 1262, measurex / -4, 0);
    amp(1262, 1264, measurex / 4, 0);
    amp(1264, 1268, measurex / 4, 0);
    amp(1268, 1272, measurex / 4, 0);
    amp(1272, 1276, 0, measurey / -4);
    amp(1276, 1280, 0, measurey / -4);
    amp(1280, 1288, 0, measurey / -4);
    amp(1288, 1289, measurex / -4, 0);
    amp(1289, 1291, 0, measurey / 4);
    amp(1291, 1292, measurex / 4, 0);
    amp(1292, 1293, 0, measurey / 4);
    amp(1293, 1296, measurex / -4, 0);
    amp(1296, 1300, measurex / 4, 0);
    amp(1300, 1304, 0, measurey / -4);
    amp(1304, 1308, measurex / -4, 0);
    amp(1308, 1312, 0, measurey / 4);
    amp(1312, 1313, 0, measurey / -4);
    amp(1313, 1315, 0, measurey / 4);
    amp(1315, 1316, 0, measurey / 4);
    amp(1316, 1317, 0, measurey / 4);
    amp(1317, 1318, measurex / -4, 0);
    amp(1318, 1319, measurex / 4, 0);
    amp(1319, 1320, 0, measurey / -4);
    amp(1320, 1321, measurex / -4, 0);
    amp(1321, 1322, 0, measurey / 4);
    amp(1322, 1323, 0, measurey / -4);
    amp(1323, 1324, measurex / 4, 0);
    amp(1324, 1325, 0, measurey / -4);
    amp(1325, 1326, measurex / -4, 0);
    amp(1326, 1328, measurex / 4, 0);
    amp(1328, 1336, measurex / 4, 0);
    amp(1336, 1344, 0, measurey / -4);
end
function columnSwap(a, b)
    tweenPos(b, _G['defaultStrum'..a..'X'], getActorY(b), 0.1, nil)
    tweenPos(a, _G['defaultStrum'..b..'X'], getActorY(a), 0.1, nil)
end
function unSwap(a, b)
    tweenPos(a, _G['defaultStrum'..a..'X'], getActorY(a), 0.1, nil)
    tweenPos(b, _G['defaultStrum'..b..'X'], getActorY(b), 0.1, nil)
end
function update(elapsed)
    if curStep >= 384 and offset ~= 0 then
        local curr = ((songPos - offset)/1000)*(bpm/15)
        for i = 0, 7 do
            setActorY(_G['defaultStrum'..i..'Y'] + (getActorHeight(i) / 4) * math.sin(i + curr), i)
        end
    end
end
function beatHit(beat)
    --do nothing
end
function stepHit(step)
    if curStep >= 1088 and curStep <= 1344 and (curStep - 4) % 8 == 0 then
        if flag then
            columnSwap(0, 1)
            columnSwap(2, 3)
            columnSwap(4, 5)
            columnSwap(6, 7)
        else
            unSwap(0, 1)
            unSwap(2, 3)
            unSwap(4, 5)
            unSwap(6, 7)
        end
        flag = not flag
    end
    if step == 384 then
        offset = songPos
    elseif step == 432 then
        moveWindowRel(0, measurey  * 3 / -16)
    elseif step == 436 then
        moveWindowRel(0, measurey  * 3 / -16)
    elseif step == 440 then
        moveWindowRel(0, measurey  * 3 / -16)
    elseif step == 444 then
        moveWindowRel(0, measurey  * 3 / -16)
    elseif step == 944 then
        moveWindowRel(0, measurey  * 3 / -16)
    elseif step == 948 then
        moveWindowRel(0, measurey  * 3 / -16)
    elseif step == 952 then
        moveWindowRel(0, measurey  * 3 / -16)
    elseif step == 960 then
        moveWindowRel(0, measurey  * 3 / -16)
    else
        --do nothing
    end
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
function ring(a, b, c, d, e, f)
    print("test")
end