import 'package:flutter/material.dart';
import '../platform/database/database.dart';
import '../shared/baseApp.dart';
import '../shared/globals.dart' as globals;
import '../widgets/appBar.dart';
import '../widgets/hideableFloatingAction.dart';

abstract class ThemedPage extends StatefulWidget {
  ThemedPage({
    super.key,
    required this.title,
    this.floatingActionButton = const HideableFloatingAction(),
  }) : super();

  BaseApp get app => globals.app;
  SharedDatabase get db => globals.db;

  MaterialColor get theme => globals.app.theme;

  final String title;
  ValueNotifier<HideableFloatingActionData> get actionButtonNotifier =>
      app.floatingActionNotifier;
  HideableFloatingAction floatingActionButton;

  void initFloatingAction(bool visible, [void Function()? action, Icon? icon]) {
    //Run code after page is done building
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //update hideableFloatingAction's data
      actionButtonNotifier.value = HideableFloatingActionData(
        visible,
        action,
        icon,
      );
    });
  }

  AppBarData getDefaultAppBar() {
    return AppBarData(title, null);
  }

  void setAppBarData(AppBarData data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      app.appBarNotifier.value = data;
    });
  }

  void setAppBarTitle(String title) {
    AppBarData tmp = app.appBarNotifier.value.copy();
    tmp.title = title;
    setAppBarData(tmp);
  }

  void setAppBarActions(List<Widget> actions) {
    AppBarData tmp = app.appBarNotifier.value.copy();
    tmp.actions = actions;
    setAppBarData(tmp);
  }

  void setAndroidBack(Future<bool> Function() callback) {
    app.navigation.androidOnBack = callback;
  }

  void initState(BuildContext context) {
    setAppBarData(getDefaultAppBar());
  }

  Future<void> saveState() async {}
}
