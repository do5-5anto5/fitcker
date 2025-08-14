import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

extension DebounceAndCancelExtension on Ref {
  Future<http.Client> getCleanClient() async {
    final client = http.Client();

    var disposed = false;
    onDispose(() {
      disposed = true;
      client.close();
    });

    if (disposed) throw Exception('Client disposed');
    await Future.delayed(Duration(seconds: 1));

    return client;
  }
}
