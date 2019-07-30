import 'package:catcher/catcher_plugin.dart';

import 'package:tap_now/app.dart';

void main() {
  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["fuzhen.song@cz-tek.com"])
  ]);

  Catcher(new App(), debugConfig: debugOptions, releaseConfig: releaseOptions);
}
