import 'package:flutter/material.dart';
import '../../shared/customIcons.dart';
import 'flyoutItem.dart';
import '../../shared/globals.dart' show app;
import '../../screens/themedPage.dart';

class Flyout extends StatelessWidget {
  const Flyout({super.key});

  Map<String, ThemedPage Function(BuildContext)> get routes => app.routes;

  void navigate(BuildContext context, String route) {
    app.navigation.goto(context, route, true);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).padding.top + 100,
              width: double.infinity,
              child: Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: const Center(
                    child: Text(
                  'Verse & Prayer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // FlyoutItem(
                  //   icon: Icons.home_rounded,
                  //   text: 'Home',
                  //   onTapped: () => navigate(context, '/'),
                  // ),
                  FlyoutItem(
                    icon: Icons.short_text_rounded,
                    text: 'Passages',
                    onTapped: () => navigate(context, '/passages'),
                  ),
                  FlyoutItem(
                    icon: CustomIcons.praying_hands,
                    text: 'Prayers',
                    onTapped: () => navigate(context, '/prayers'),
                  ),
                  // FlyoutItem(
                  //   icon: Icons.queue_music_rounded,
                  //   text: 'Playlists',
                  //   onTapped: () => navigate(context, '/playlists'),
                  // ),
                  FlyoutItem(
                    icon: Icons.settings_rounded,
                    text: 'Settings',
                    onTapped: () => navigate(context, '/settings'),
                  ),
                ], //drawer top
              ),
            ),
            FlyoutItem(
              icon: Icons.close_rounded,
              text: 'Exit',
              onTapped: () => app.closeApp(context),
            ),
          ],
        ),
      ),
    );
  }
}
