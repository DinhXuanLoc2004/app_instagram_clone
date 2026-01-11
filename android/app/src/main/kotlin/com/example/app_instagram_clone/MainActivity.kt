package com.example.app_instagram_clone

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity

import com.facebook.*
import com.facebook.login.LoginConfiguration
import com.facebook.login.LoginManager
import com.facebook.login.LoginResult
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.UUID

class MainActivity : FlutterActivity() {
    private val FB_LOGIN_CHANNEL = "FB_LOGIN_CHANNEL";
    private val FB_LOGIN = "FB_LOGIN";

    private  lateinit var callbackManager: CallbackManager
    private  var pendingResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        callbackManager = CallbackManager.Factory.create()

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, FB_LOGIN_CHANNEL)
            .setMethodCallHandler { call, result ->
                when(call.method) {
                    FB_LOGIN -> {
                        if (pendingResult != null) {
                            result.error(
                                "ALREADY_ACTIVE",
                                "Login already in progress",
                                null
                            )
                            return@setMethodCallHandler
                        }
                        pendingResult = result
                        loginWithFB()
                    }
                    else -> result.notImplemented()
                }
            }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        callbackManager.onActivityResult(requestCode, resultCode, data)
    }

    private fun loginWithFB(){
        val nonce = UUID.randomUUID().toString()

        val config = LoginConfiguration(
            permissions = listOf("public_profile", "email"),
            nonce = nonce
        )

        LoginManager.getInstance().registerCallback(
            callbackManager,
            object : FacebookCallback<LoginResult> {
                override fun onSuccess(result: LoginResult) {
                    val token = AuthenticationToken.getCurrentAuthenticationToken()
                    pendingResult?.success(token?.token)
                    clearResult()
                }

                override fun onCancel() {
                    pendingResult?.success(null)
                    clearResult()
                }

                override fun onError(error: FacebookException) {
                    pendingResult?.error("FB_LOGIN_ERROR", error.message, null)
                    clearResult()
                }
            }
        )

        LoginManager.getInstance().logIn(this, config)
    }

    private fun clearResult(){
        pendingResult = null
    }
}
