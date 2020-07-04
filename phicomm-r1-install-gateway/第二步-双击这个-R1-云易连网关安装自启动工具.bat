@echo off
echo R1-云易连网关软件安装自启工具
echo *
echo 将安装云易连网关到R1并打开自启动
echo *
adb kill-server
adb start-server
echo 需要查看R1的IP地址
set /p ip=请输入IP地址：
if "%ip%" == "" echo 提示：请输入正确的IP地址
echo 开始通过网络进行ADB连接……
echo *
adb connect %ip%
echo *
adb shell settings put secure install_non_market_apps 1
echo *
echo 安装包上传中……
adb push app-armeabi-v7a-release.apk /data/local/tmp/
echo *
echo 应用程序安装中……
adb shell /system/bin/pm install -t /data/local/tmp/app-armeabi-v7a-release.apk

echo 打开软件
adb shell am start -n com.iotserv.gateway/.MainActivity
echo *
ping -n 5 127.1>nul
echo 截屏中 gateway.png 查看是否已打开软件
echo *
adb shell screencap -p /data/local/tmp/gateway.png
echo 图片下载中……
adb pull /data/local/tmp/gateway.png
echo *
adb shell rm /data/local/tmp/gateway.png
echo 缓存图片已清理
echo 自行检查是否成功打开软件
echo *

:end
echo 按任意键退出...
pause > nul
