import 'package:flutter/material.dart';
import 'package:verse_prayer_study/models/settingsData.dart';
import '../models/bibleData.dart';
import '../models/bookData.dart';
import '../platform/database/database.dart';
import '../screens/homePage.dart';
import '../screens/settingsPage.dart';
import '../screens/versesPage.dart';
import 'colorMaterializer.dart';
import 'globals.dart' as globals;
import 'package:path/path.dart' as p;

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
      ValueNotifier(SettingsData(0, 0, true));

  final ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(false);

  final ValueNotifier<double?> loadingProgressNotifier =
      ValueNotifier<double?>(0);

  final ValueNotifier<List<String>> languagesNotifier =
      ValueNotifier(<String>[]);

  final ValueNotifier<List<BibleData>> biblesNotifier =
      ValueNotifier(<BibleData>[]);

  final ValueNotifier<List<BookData>> booksNotifier =
      ValueNotifier(<BookData>[]);

  ValueNotifier<bool> darkMode = ValueNotifier(false);

  String currentRoute = '/';
  final Map<String, ThemedPage Function(BuildContext)> routes = {
    '/': (context) => HomePage(title: 'Home'),
    '/verses': (context) => VersesPage(title: 'Verses'),
    //'/prayers': (context) => PrayersPage(title: 'Prayers'),
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
    //await loadBooks();
  }

  Future<void> loadSettings() async {
    //get homepagestate db object
    var settings = await globals.db.getSettings();

    //give default value if null
    settings ??= const SettingsDB(
      id: 1,
      theme: 0,
      color: 0xFF000000,
      darkmode: false,
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
    biblesNotifier.value =
        biblesDB.map((b) => BibleData().fromEntry(b)).toList();
  }

  // Future<void> loadBooks() async {
  //   var booksDB = await globals.db.getBooks();
  //   booksNotifier.value = booksDB.map((b) => BookData().fromEntry(b)).toList();
  // }

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
