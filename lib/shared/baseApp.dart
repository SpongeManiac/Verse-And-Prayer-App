import 'package:flutter/material.dart';
import 'package:verse_prayer_study/models/settingsData.dart';
import '../models/passageData.dart';
import '../models/prayerData.dart';
import '../platform/database/database.dart';
import '../screens/homePage.dart';
import '../screens/passagesPage.dart';
import '../screens/prayersPage.dart';
import '../screens/settingsPage.dart';
import 'colorMaterializer.dart';
import 'globals.dart' as globals;

import '../screens/pageNav.dart';
import '../screens/themedPage.dart';
import '../widgets/appBar.dart';
import '../widgets/flyout/flyout.dart';
import '../widgets/hideableFloatingAction.dart';

class BaseApp extends StatefulWidget {
  BaseApp(
      {super.key,
      this.appTitle = 'Verse & Prayer',
      this.navTitle = 'Verse & Prayer'});

  String appTitle;
  String? navTitle;
  AppBarTitleListener appBar = AppBarTitleListener();
  Flyout flyout = const Flyout();
  PageNav navigation = PageNav();

  MaterialColor get theme =>
      globals
          .themes[globals.themes.keys.toList()[settingsNotifier.value.theme]] ??
      globals.themes['Blue']!;

  set currentNavTitle(String newTitle) {
    navTitle = newTitle;
    AppBarData tmp = appBarNotifier.value.copy();
    tmp.title = newTitle;
    appBarNotifier.value = tmp;
  }

  //value notifiers
  ValueNotifier<AppBarData> appBarNotifier =
      ValueNotifier(AppBarData('Verse & Prayer'));
  String get currentNavTitle {
    return navTitle ??= appBarNotifier.value.title;
  }

  final ValueNotifier<String> routeNotifier = ValueNotifier('/');

  final ValueNotifier<HideableFloatingActionData> floatingActionNotifier =
      ValueNotifier(HideableFloatingActionData(false));

  final ValueNotifier<SettingsData> settingsNotifier =
      ValueNotifier(SettingsData(0, 0xFFFF00FF, true));

  final ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(false);

  final ValueNotifier<double?> loadingProgressNotifier =
      ValueNotifier<double?>(0);

  final ValueNotifier<List<String>> languagesNotifier =
      ValueNotifier(<String>[]);

  final ValueNotifier<List<BibleDB>> biblesNotifier =
      ValueNotifier(<BibleDB>[]);

  final ValueNotifier<List<BookDB>> booksNotifier = ValueNotifier(<BookDB>[]);

  final ValueNotifier<List<PassageData>> passagesNotifier =
      ValueNotifier(<PassageData>[]);

  final ValueNotifier<List<PrayerData>> prayersNotifier =
      ValueNotifier(<PrayerData>[]);

  ValueNotifier<bool> darkMode = ValueNotifier(true);

  //sets the route that '/' points to
  String homeRoute = '/passages';
  //start navigation on homeRoute
  String currentRoute = '/';
  final Map<String, ThemedPage Function(BuildContext)> routes = {
    '/passages': (context) => PassagesPage(
          title: 'Passages',
          floatingActionButton: const HideableFloatingAction(),
        ),
    '/prayers': (context) => PrayersPage(title: 'Prayers'),
    '/settings': (context) => SettingsPage(title: 'Settings'),
  };

  Scaffold appScaffold() {
    return Scaffold(
      appBar: appBar,
      drawer: flyout,
      body: navigation,
      resizeToAvoidBottomInset: false,
    );
  }

  Future<void> closeApp(BuildContext context) async {}

  Future<void> appCleanup() async {}

  void setNavTitle([String? title]) {
    currentNavTitle = title ??= currentNavTitle;
  }

  Future<void> load() async {
    await loadSettings();
    await loadBibles();
    await loadPassages();
    await loadPrayers();
  }

  Future<void> loadSettings() async {
    //get homepagestate db object
    var settings = await globals.db.getSettings();

    //give default value if null
    settings ??= const SettingsDB(
      id: 1,
      theme: 0,
      color: 0xFFFF00FF,
      darkmode: true,
    );

    //make sure data is valid
    if (settings.theme < 0 || settings.theme >= globals.themes.length) {
      settings = SettingsDB(
        id: 1,
        theme: 0,
        color: settings.color,
        darkmode: settings.darkmode,
      );
    }
    darkMode.value = settings.darkmode;
    globals.themes['Custom'] =
        ColorMaterializer.getMaterial(Color(settings.color));
    settingsNotifier.value = settingsNotifier.value.fromEntry(settings);
  }

  Future<void> saveSettings() async {
    await globals.db.setSettings(globals.app.settingsNotifier.value.getEntry());
  }

  Future<void> loadBibles() async {
    //get homepagestate db object
    var biblesDB = await globals.db.getBibles();
    biblesNotifier.value = biblesDB;
  }

  Future<void> loadPassages() async {
    var passagesDB = await globals.db.getPassages();
    passagesNotifier.value =
        passagesDB.map((p) => PassageData().fromEntry(p)).toList();
  }

  Future<void> loadPrayers() async {
    var prayersDB = await globals.db.getPrayers();
    prayersNotifier.value =
        prayersDB.map((p) => PrayerData().fromEntry(p)).toList();
  }

  @override
  State<StatefulWidget> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  _BaseAppState() : super();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Unsupported Platform',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
