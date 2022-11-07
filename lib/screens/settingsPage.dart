import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../models/settingsData.dart';
import '../shared/colorMaterializer.dart';
import 'themedPage.dart';
import '../shared/globals.dart' as globals;
import '../widgets/actionButtonLayout.dart';

class SettingsPage extends ThemedPage {
  SettingsPage({
    super.key,
    required super.title,
  }) : super();

  @override
  void initState(BuildContext context) {
    super.initState(context);
    setAndroidBack(() async {
      app.navigation.goto(context, '/');
      return false;
    });
  }

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<DropdownMenuItem<MaterialColor>> _themeDropdown = [];

  MaterialColor? _selectedItem = globals.themes['Blue'];

  SettingsData get copy => globals.app.settingsNotifier.value.copy();
  set copy(newVal) {
    widget.app.settingsNotifier.value = newVal;
  }

  Color pickerColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    widget.initState(context);
    //build themedropdown
    for (var theme in globals.themes.keys) {
      MaterialColor color = globals.themes[theme]!;
      _themeDropdown.add(
        DropdownMenuItem(
          value: color,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 50),
            child: Center(
              child: Text(
                theme,
                style: TextStyle(color: color),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

      pickerColor = globals.themes['Custom']!;
    }

    loadState(copy);
  }

  void loadState(SettingsData state) {
    //set state
    _selectedItem = globals.themes.values.elementAt(state.theme);
    pickerColor = Color(state.color);
  }

  Future<void> _themeChanged(MaterialColor? color) async {
    _selectedItem = color;
    var tmp = copy;
    if (color != null) {
      var idx = globals.themes.values.toList().indexOf(color);
      if (idx == 5) {
        //user chose custom color, show the color picker
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Select a color'),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: pickerColor,
                    onColorChanged: (color) {
                      pickerColor = color;
                    },
                  ),
                ),
                actions: [
                  ElevatedButton(
                    child: const Text('Done'),
                    onPressed: () {
                      var mat = ColorMaterializer.getMaterial(pickerColor);
                      setState(() {
                        //print('themes before:');
                        print(globals.themes.values);
                        globals.themes['Custom'] = mat;
                        //print('themes after:');
                        //print(globals.themes.values);
                        _themeDropdown[idx] = DropdownMenuItem(
                          value: mat,
                          child: Container(
                            constraints: const BoxConstraints(maxHeight: 50),
                            child: Center(
                              child: Text(
                                'Custom',
                                style: TextStyle(color: mat),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                        Navigator.of(context).pop();
                        tmp.color = pickerColor.value;
                        tmp.theme = idx;

                        copy = tmp;
                      });
                    },
                  ),
                ],
              );
            });
      } else {
        tmp.theme = idx;
        copy = tmp;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: globals.app.settingsNotifier,
      builder: (context, SettingsData newState, _) {
        //HomePageData newState = newStateUncasted;
        newState.saveData();
        loadState(newState);
        // This method is rerun every time setState is called, for instance as done
        // by the _incrementCounter method above.
        //
        // The Flutter framework has been optimized to make rerunning build methods
        // fast, so that you can just rebuild anything that needs updating rather
        // than having to individually change instances of widgets.
        return Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text('Theme Color'),
                        subtitle: Text('Set the color of the app\'s theme.'),
                        trailing: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            items: _themeDropdown,
                            value: _selectedItem,
                            onChanged: (MaterialColor? newval) {
                              _themeChanged(newval);
                            },
                            isExpanded: true,
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            buttonWidth: 250,
                          ),
                        ),
                      ),
                      SwitchListTile(
                        title: Text('Dark Mode'),
                        subtitle: Text('Nocturnal Friendly.'),
                        value: widget.app.darkMode.value,
                        onChanged: (newVal) {
                          var tmp = copy;
                          widget.app.darkMode.value = newVal;
                          //update state
                          tmp.darkMode = newVal;
                          copy = tmp;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
