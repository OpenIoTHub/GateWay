package com.iotserv.gateway;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import com.iotserv.gateway.MainActivity;

public class SYSBroadcastReceiver extends android.content.BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        if(Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())){
//            开机开启后台服务
            Intent it=new Intent(context, NatCloudClientService.class);
            context.startService(it);

//            开机打开应用
//            Intent thisIntent = new Intent(context, MainActivity.class);
//            thisIntent.setAction("android.intent.action.MAIN");
//            thisIntent.addCategory("android.intent.category.LAUNCHER");
//            thisIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//            context.startActivity(thisIntent);
        }
    }
}