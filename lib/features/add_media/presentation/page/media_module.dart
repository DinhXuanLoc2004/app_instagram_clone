import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:flutter/services.dart';

class MediaModule {
  static const MEDIA_CHANNEL_NAME = 'MEDIA_CHANNEL';
  static const OPEN_MEDIA_METHOD = 'OPEN_MEDIA';

  static const mediaChannel = MethodChannel(MEDIA_CHANNEL_NAME);

  static Future<void> openMediaModule() async {
    try {
      final result = await mediaChannel.invokeMethod(OPEN_MEDIA_METHOD);
      Log.debug('result openMediaModule:: $result');
    } on PlatformException catch (e) {
      Log.debug('openMediaModule exception:: $e');
    }
  }
}