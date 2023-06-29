package com.example.yjy_sumsun_self_service;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;

import androidx.annotation.NonNull;

//flutter build apk 后，产出
import com.sunmi.extprinterservice.ExtPrinterService;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** YjySumsunSelfServicePlugin */
public class YjySumsunSelfServicePlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;
  private ExtPrinterService extPrinterService;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "yjy_sumsun_self_service");
    channel.setMethodCallHandler(this);

    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("++001++Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("getPlatformVersion2")){
      result.success("++002++Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("bindService")){
      Intent intent = new Intent();
      intent.setPackage("com.sunmi.extprinterservice");
      intent.setAction("com.sunmi.extprinterservice.PrinterService");
      context.bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE);
      result.success("成功绑定");
    } else if(call.method.equals("unbindService")){
      //使用结束后解绑服务
      context.unbindService(serviceConnection);
      result.success("解绑服务");
    } else if(call.method.equals("extPrinterInit")){
      try {
        extPrinterService.printerInit();
      } catch (RemoteException e) {
        throw new RuntimeException(e);
      }
      result.success("打印机初始化");
    } else if(call.method.equals("extPrinterStatus")){
      try {
        extPrinterService.getPrinterStatus();
      } catch (RemoteException e) {
        throw new RuntimeException(e);
      }
      result.success("获取打印机异常状态返回");
    } else if(call.method.equals("extSendRawData")){
//      extPrinterService.sendRawData();
      result.success("发送数据指令");
    }  else if(call.method.equals("extPrintText")){
      try {
        extPrinterService.printText("12312312\n");
      } catch (RemoteException e) {
        throw new RuntimeException(e);
      }
      result.success("打印文本内容");
    } else {
      result.notImplemented();
    }
  }

  ServiceConnection serviceConnection = new ServiceConnection() {
    @Override
    public void onServiceConnected(ComponentName name, IBinder service) {
//      ExtPrinterService ext = ExtPrinterService.Stub.asInterface(service);
      extPrinterService = ExtPrinterService.Stub.asInterface(service);
//      try {
////        ext.printerInit();
////        ext.printText("123");
////        ext.getPrinterStatus();
////        ext.sendRawData("");
//        ext.openDrawer();
//      } catch (RemoteException e) {
//        throw new RuntimeException(e);
//      }
    }
    @Override
    public void onServiceDisconnected(ComponentName name) { }
  };

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
