import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:verse_prayer_study/shared/crudState.dart';
import 'package:verse_prayer_study/screens/themedPage.dart';
import 'package:verse_prayer_study/widgets/hideableFloatingAction.dart';

import '../models/prayerData.dart';

class PrayersPage extends ThemedPage {
  PrayersPage({super.key, required super.title});

  @override
  void initState(BuildContext context) {
    super.initState(context);
    setAndroidBack(() async {
      //goto home/root route
      app.navigation.goto(context, '/');
      print('going back to home route');
      return false;
    });
  }

  @override
  State<StatefulWidget> createState() => _PrayersPageState();
}

class _PrayersPageState extends CRUDState<PrayerData> {
  List<PrayerData> get prayers => widget.app.prayersNotifier.value;
  set prayers(List<PrayerData> newPrayers) =>
      widget.app.prayersNotifier.value = newPrayers;

  TextEditingController newTitle = TextEditingController(text: '');
  TextEditingController newPrayer = TextEditingController(text: '');

  void Function()? save;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Form get prayerForm => Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Text('Create a prayer'),
              TextFormField(
                controller: newTitle,
                validator: titleValidator,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  hintText: 'Enter the title of your prayer',
                ),
                onChanged: (value) => checkFormCompleted(),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TextFormField(
                  controller: newPrayer,
                  validator: prayerValidator,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    label: Text('Prayer'),
                    hintText: 'Enter a prayer',
                  ),
                  onChanged: (value) => checkFormCompleted(),
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: cancel,
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: save,
                    child: const Text('Save Prayer'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  void checkFormCompleted() {
    if (newTitle.text.isNotEmpty &&
        newPrayer.text.isNotEmpty &&
        formKey.currentState!.validate()) {
      if (itemToEdit == null) {
        setState(() {
          save = create;
        });
      } else {
        setState(() {
          save = () async => await update(itemToEdit!);
        });
      }
    } else {
      setState(() {
        save = null;
      });
    }
  }

  String? titleValidator(String? val) {
    if (val == null || val.isEmpty) return 'Title cannot be empty';
    return null;
  }

  String? prayerValidator(String? val) {
    if (val == null || val.isEmpty) return 'Prayer cannot be empty';
    return null;
  }

  @override
  void initState() {
    super.initState();
    widget.initState(context);
    widget.initFloatingAction(
        true, () => setCreate(), const Icon(Icons.add_rounded));
  }

  @override
  Future<void> setCreate() async {
    await super.setCreate();
    widget.setAndroidBack(() async {
      await setRead();
      return false;
    });
  }

  @override
  Future<List<PrayerData?>> create() async {
    PrayerData prayer = PrayerData(name: newTitle.text, prayer: newPrayer.text);
    prayer.id = await widget.db.setPrayer(prayer.getCompanion());
    List<PrayerData> tmp = List.from(prayers);
    tmp.add(prayer);
    prayers = tmp;
    await setRead();
    return [prayer];
  }

  @override
  Widget createView(BuildContext context) {
    return prayerForm;
  }

  @override
  Future<void> delete(PrayerData item) async {
    if (await widget.db.prayerExists(item.id ??= -1)) {
      await widget.db.delPrayer(item.id!);
      List<PrayerData> tmp = List.from(prayers);
      tmp.remove(item);
      prayers = tmp;
    }
  }

  @override
  Widget deleteView(BuildContext context) {
    // TODO: implement deleteView
    throw UnimplementedError();
  }

  @override
  Widget readView(BuildContext context) {
    return ValueListenableBuilder<List<PrayerData>>(
      valueListenable: widget.app.prayersNotifier,
      builder: (context, newPrayers, _) {
        return Stack(
          children: [
            ListView.builder(
              itemCount: newPrayers.length,
              itemBuilder: (context, index) {
                var current = newPrayers[index];
                return Card(
                  child: ExpansionTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        OutlinedButton(
                          onPressed: () => setUpdate(current),
                          child: const Icon(Icons.edit_rounded),
                        ),
                        OutlinedButton(
                          onPressed: () => delete(current),
                          child: const Icon(Icons.delete_rounded,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    title: Text(current.name),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxHeight: 300,
                          ),
                          child: ScrollConfiguration(
                            behavior: const MaterialScrollBehavior()
                                .copyWith(dragDevices: {
                              PointerDeviceKind.mouse,
                              PointerDeviceKind.touch,
                              PointerDeviceKind.stylus,
                            }),
                            child: SingleChildScrollView(
                              child: SelectableText(
                                current.prayer,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: widget.floatingActionButton,
            ),
          ],
        );
      },
    );
  }

  @override
  Future<void> setUpdate(PrayerData item) async {
    await super.setUpdate(item);
    newTitle.text = item.name;
    newPrayer.text = item.prayer;
  }

  @override
  Future<PrayerData> update(PrayerData item) async {
    if (await widget.db.prayerExists(item.id!)) {
      List<PrayerData> tmp = List.from(prayers);
      int idx = tmp.indexOf(item);
      item.name = newTitle.text;
      item.prayer = newPrayer.text;
      await widget.db.updatePrayer(item.getEntry());
      tmp[idx] = item;
      prayers = tmp;
      await setRead();
      return item;
    }
    return PrayerData(id: -1);
  }

  @override
  Widget updateView(BuildContext context) {
    return prayerForm;
  }
}
