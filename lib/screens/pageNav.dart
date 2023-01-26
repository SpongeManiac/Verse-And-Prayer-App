import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import '../shared/baseApp.dart';
import 'themedPage.dart';

import '../shared/globals.dart' show app;
import '../widgets/hideableFloatingAction.dart';
import '../widgets/loadingIndicator.dart';

class PageNav extends StatefulWidget {
  PageNav({
    super.key,
  }) : super();

  bool _alertShowing = false;

  Future<bool> Function() androidOnBack = () async {
    print('default back');
    return true;
  };

  Future<bool> exitDialog(BuildContext context) async {
    print('running alert');
    if (_alertShowing) {
      print('alert is showing: $_alertShowing');
      return false;
    }
    _alertShowing = true;
    //print('awaiting show dialog');
    bool? result = await showDialog(
        context: context,
        builder: (context) {
          print('building dialog');
          return AlertDialog(
              title: const Text('Do you really want to quit?'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      _alertShowing = false;
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .labelLarge!
                              .color),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 202, 202, 202)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      _alertShowing = false;
                    },
                    child: const Text('No'))
              ]);
        });
    //print('Alert is gone');
    _alertShowing = false;
    result ??= false;
    if (result) {
      app.appCleanup();
    }
    return result;
  }

  void goto(BuildContext context, String route, [bool popNav = false]) {
    if (route == '/' || app.routes.containsKey(route)) {
      if (route != app.currentRoute) {
        print('resetting back button');
        androidOnBack = () async {
          goto(context, '/passages');
          return false;
        };
        app.currentRoute = route;
        app.floatingActionNotifier.value = HideableFloatingActionData(false);
        app.routeNotifier.value = route;
      } else {
        //when same route
      }
    } else {
      //when route doesn't exist
    }
    if (popNav) {
      Navigator.pop(context);
    }
  }

  @override
  State<PageNav> createState() => _PageNavState();
}

class _PageNavState extends State<PageNav> with WindowListener {
  _PageNavState() : super();

  double seeker = 0;

  @override
  void initState() {
    windowManager.addListener(this);
    () async {
      await windowManager.setPreventClose(true);
      setState(() {});
    }();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder<String>(
          valueListenable: app.routeNotifier,
          builder: (_, newRoute, __) {
            //replace root with homeRoute
            newRoute = newRoute == '/' ? app.homeRoute : newRoute;
            //set build function
            ThemedPage Function(BuildContext)? builder = app.routes[newRoute];
            if (builder == null) {
              //reset current route to home route
              builder = app.routes[app.homeRoute];
              app.currentRoute = app.homeRoute;
            } else {
              //set current route
              app.currentRoute = newRoute;
            }
            return WillPopScope(
              onWillPop: () => widget.androidOnBack(),
              child: builder!(context),
            );
          },
        ),
        LoadingIndicator(
          loadingNotifier: app.loadingNotifier,
          loadingProgressNotifier: app.loadingProgressNotifier,
        ),
      ],
    );
  }

  //window controls
  @override
  void onWindowClose() async {
    await app.closeApp(context);
  }
}
