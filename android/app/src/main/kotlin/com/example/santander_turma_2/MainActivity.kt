package com.example.santander_turma_2

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL_NAME = "com.example.santander_turma_2/battery_stream";
    private var batteryBroadcastReceiver : BatteryBroadcastReceiver? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
            .setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                        val onNewBatteryValueCallback = fun(value: Float) { events?.success(value) }
                        batteryBroadcastReceiver = BatteryBroadcastReceiver(onNewBatteryValueCallback)
                        registerReceiver(batteryBroadcastReceiver, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
                    }

                    override fun onCancel(arguments: Any?) {
                        println("cancelling listener")
                    }
                }
            )
    }
}

private class BatteryBroadcastReceiver(val callback: ((Float) -> Unit)) : BroadcastReceiver(){
    override fun onReceive(context: Context?, intent: Intent?) {
        val battery: Float? = intent?.let { intentValue ->
            val level: Int = intentValue.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
            level.toFloat()
        }
        callback((battery ?: 0.0) as Float)
    }

}