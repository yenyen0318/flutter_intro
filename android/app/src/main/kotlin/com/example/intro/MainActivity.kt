package com.example.intro

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.Log
import androidx.annotation.NonNull
import android.util.Rational
import android.app.PictureInPictureParams

class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"
    
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler {
                call,
                result ->
            if (call.method == "showNativeView") {
                showNativeView()
                Log.d("aaa", "顯示小視窗")
                result.success("顯示小視窗")
            } else {
                result.notImplemented()
            }
        }
    }

    private fun showNativeView() {
        Log.d("aaa", "顯示小視窗2")
        val aspectRatio = Rational(16, 9)
        val params = PictureInPictureParams.Builder().setAspectRatio(aspectRatio).build()
        enterPictureInPictureMode(params)
        Log.d("aaa", "顯示小視窗3")
    }
}
