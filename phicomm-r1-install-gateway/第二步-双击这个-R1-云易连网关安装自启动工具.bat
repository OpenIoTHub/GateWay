@echo off
echo R1-���������������װ��������
echo *
echo ����װ���������ص�R1����������
echo *
adb kill-server
adb start-server
echo ��Ҫ�鿴R1��IP��ַ
set /p ip=������IP��ַ��
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ
echo ��ʼͨ���������ADB���ӡ���
echo *
adb connect %ip%
echo *
adb shell settings put secure install_non_market_apps 1
echo *
echo ��װ���ϴ��С���
adb push app-armeabi-v7a-release.apk /data/local/tmp/
echo *
echo Ӧ�ó���װ�С���
adb shell /system/bin/pm install -t /data/local/tmp/app-armeabi-v7a-release.apk

echo �����
adb shell am start -n com.iotserv.gateway/.MainActivity
echo *
ping -n 5 127.1>nul
echo ������ gateway.png �鿴�Ƿ��Ѵ����
echo *
adb shell screencap -p /data/local/tmp/gateway.png
echo ͼƬ�����С���
adb pull /data/local/tmp/gateway.png
echo *
adb shell rm /data/local/tmp/gateway.png
echo ����ͼƬ������
echo ���м���Ƿ�ɹ������
echo *

:end
echo ��������˳�...
pause > nul
