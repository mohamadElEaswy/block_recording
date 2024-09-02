import 'package:flutter/services.dart';

class MethodChannelExample {
  static const MethodChannel channel =
      MethodChannel('flutter_native_channel');

  // Call the method in the native
  Future<void> callNativeMethod() async {
    try {
      final String result = await channel.invokeMethod('getNativeMessage');
      print('Received from platform: $result');
    } on PlatformException catch (e) {
      print("Failed to invoke method: '${e.message}'.");
    }
  }

  // Listen to the call from native
  void setUpMethodCallHandler() {
    channel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case 'sendMessageToFlutter':
          print('Received from platform: ${call.arguments}');
          return 'Reply from Flutter';
        default:
          throw MissingPluginException('Not implemented');
      }
    });
  }
}