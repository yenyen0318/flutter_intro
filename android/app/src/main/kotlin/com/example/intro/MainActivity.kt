package com.example.intro

import android.app.PictureInPictureParams
import android.util.Rational
import android.content.res.Configuration
import androidx.annotation.NonNull
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { call, result ->
            if (call.method == "showNativeView") {
                showNativeView()
                Log.d("aaa", "顯示小視窗")
                result.success("顯示小視窗")
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onPictureInPictureModeChanged(
            isInPictureInPictureMode: Boolean,
            newConfig: Configuration?
    ) {
        super.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)
        if (isInPictureInPictureMode) {
            channel.invokeMethod("isInPictureInPictureMode", true)
        } else {
            channel.invokeMethod("isInPictureInPictureMode", false)
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
