import 'dart:isolate';
import 'dart:async';
import 'dart:io';

final usage = "spawnUri <message>";

Future main(List<String> args) {
  if (args.length == 0) {
    print(usage);
    exit(1);
  }
  var msg = args[0];
  var response = new ReceivePort();
  Future<Isolate> remote = Isolate.spawnUri(Uri.parse('https://raw.githubusercontent.com/damondouglas/isolate-hosted-on-github-test.dart/29846d932531bb870112eba4d9bc7f5b6a5ed7fb/echo.dart'), [msg], response.sendPort);
  remote.then((_) => response.first)
  .then((msg) {
    print("received: $msg");
  });
}
