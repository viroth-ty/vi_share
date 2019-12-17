package com.share.vi.vi_share

import android.app.Activity
import android.content.Context
import android.net.Uri
import android.widget.Toast
import com.facebook.CallbackManager
import com.facebook.FacebookCallback
import com.facebook.FacebookException
import com.facebook.share.Sharer
import com.facebook.share.model.ShareLinkContent
import com.facebook.share.widget.ShareDialog
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class ViSharePlugin(activity: Context?, methodChannel: MethodChannel) : MethodCallHandler {
  private var activity : Activity? = null
  var methodChannel: MethodChannel? = methodChannel
  var callbackManager = CallbackManager.Factory.create();
  var shareDialog: ShareDialog? = null

  init {
    this.activity = activity as Activity?
    methodChannel.setMethodCallHandler(this)
  }
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "vi_share")
      channel.setMethodCallHandler(ViSharePlugin(registrar.activeContext(), channel))
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    var url: String
    var msg: String
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }
    else if(call.method == "shareToFacebook") {
      url = call.argument<String>("url").toString()
      msg = call.argument<String>("msg").toString()

      shareToFacebook(url, msg, result)
    }
    else {
      result.notImplemented()
    }
  }

  private fun shareToFacebook(url: String, msg: String, result: Result) {
    val shareDialog = ShareDialog(activity)

    shareDialog.registerCallback(callbackManager, object : FacebookCallback<Sharer.Result> {
      override fun onSuccess(result: Sharer.Result?) {
      }
      override fun onCancel() {
      }
      override fun onError(error: FacebookException?) {
      }
    })

    var content = ShareLinkContent
            .Builder()
            .setContentUrl(Uri.parse("https://developers.facebook.com"))
            .build()

    if (ShareDialog.canShow(ShareLinkContent::class.java)) {
      shareDialog.show(content)
      result.success("success")
    }
  }

}
