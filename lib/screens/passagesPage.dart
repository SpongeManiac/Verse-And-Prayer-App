import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:verse_prayer_study/models/bibleData.dart';
import 'package:verse_prayer_study/models/bookData.dart';
import 'package:verse_prayer_study/models/passageData.dart';
import 'package:verse_prayer_study/models/verseData.dart';
import 'package:verse_prayer_study/platform/database/database.dart';
import 'package:verse_prayer_study/shared/crudState.dart';

import 'themedPage.dart';

class PassagesPage extends ThemedPage {
  PassagesPage({super.key, required super.title, super.floatingActionButton});

  @override
  void initState(BuildContext context) {
    super.initState(context);
    setAndroidBack(() async {
      //goto home/root route
      //app.navigation.goto(context, '/');
      return await app.navigation.exitDialog(context);
      //return false;
    });
  }

  @override
  State<StatefulWidget> createState() => _PassagesPageState();
}

class _PassagesPageState extends CRUDState<PassageData> {
  TextEditingController newStartVerse = TextEditingController(text: '');
  TextEditingController newEndVerse = TextEditingController(text: '');

  BibleDB? selectedBible;
  List<BibleDB> get bibles => widget.app.biblesNotifier.value;
  set bibles(List<BibleDB> value) => widget.app.biblesNotifier.value = value;

  List<DropdownMenuItem<BibleDB>> get biblesItems {
    return bibles
        .map((b) => DropdownMenuItem(
              value: b,
              child: Row(
                children: [
                  Text('(${b.language}) '),
                  Text(b.name),
                ],
              ),
            ))
        .toList();
  }

  BookDB? selectedBook;
  List<BookDB> get books => widget.app.booksNotifier.value;
  set books(List<BookDB> books) => widget.app.booksNotifier.value = books;

  List<DropdownMenuItem<BookDB>> get booksItems {
    return books
        .map((b) => DropdownMenuItem(
              value: b,
              child: Text(b.name),
            ))
        .toList();
  }

  Future<void> setBibleBooks() async {
    var bookNum = selectedBook != null ? books.indexOf(selectedBook!) : -1;
    books = await widget.db.getBibleBooks(selectedBible);
    selectedBook = bookNum == -1 ? null : books[bookNum];
  }

  List<PassageData> get passages => widget.app.passagesNotifier.value;
  set passages(List<PassageData> newPassages) =>
      widget.app.passagesNotifier.value = newPassages;
  void addPassage(PassageData passage) {
    List<PassageData> copy = List.from(passages);
    copy.add(passage);
    passages = copy;
  }

  Future<void> getVerses() async {
    print('Getting verse(s)...');
    print(save);
    if (checkFormCompleted()) {
      print('form completed');
      if (formKey.currentState!.validate()) {
        print('form validated');
        //get first verse regardless
        var split1 = newStartVerse.text.split(':');
        v1 = await widget.db.getSpecificVerse(selectedBible!, selectedBook!,
            int.parse(split1[0]), int.parse(split1[1]));
        //make sure first verse exists
        if (v1 != null) {
          if (newEndVerse.text.isNotEmpty) {
            //multiple verses
            //print('multiple verses');
            var split2 = newEndVerse.text.split(':');
            //print(split2);
            v2 = await widget.db.getSpecificVerse(selectedBible!, selectedBook!,
                int.parse(split2[0]), int.parse(split2[1]));

            if (v2 != null) {
              //make sure the start verse is before the end verse
              if (!(v1!.id <= v2!.id)) {
                //swap verses
                var tmp = v1;
                v1 = v2;
                v2 = tmp;
              }
              //clear verse text
              passage = '';
              //get all verses
              var versesBetween = await widget.db.getVerseRange(v1!, v2!);
              //turn verses into single text
              var chapter = 0;
              for (var v in versesBetween) {
                if (v.chapter != chapter) {
                  chapter = v.chapter;
                  passage = '$passage\n\nCHAPTER ${v.chapter}\n\n';
                }
                passage = '$passage ${v.verse} ${v.scripture}';
              }
              save = create;
            } else {
              //second verse not found
              passage = '${v1!.scripture}\nEnd verse not found.';
              save = create;
            }
          } else {
            //single verse only
            passage = v1!.scripture;
            save = create;
          }
        } else {
          //first verse did not exist
          passage = 'Starting verse not found.';
          save = null;
        }
        //check if multiple verses
      } else {
        //form not valid
        save = null;
      }
    } else {
      passage = 'Form not complete.';
      save = null;
    }
    print(save);
    setState(() {});
  }

  VerseDB? v1;
  VerseDB? v2;
  String passage = '';
  void Function()? submit;
  void Function()? save;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Form get verseForm => Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text('Select a verse'),
              DropdownButtonFormField(
                  isExpanded: true,
                  validator: bibleValidator,
                  items: biblesItems,
                  value: selectedBible,
                  onChanged: (value) {
                    selectedBible = value;
                    () async {
                      await setBibleBooks();
                    }();
                    checkFormCompleted();
                  }),
              DropdownButtonFormField(
                isExpanded: true,
                validator: bookValidator,
                items: booksItems,
                value: selectedBook,
                onChanged: (value) {
                  selectedBook = value;
                  checkFormCompleted();
                },
              ),
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Row(
                  children: [
                    TextFormField(
                      controller: newStartVerse,
                      validator: startVerseValidator,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9:]')),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Start Verse',
                        constraints:
                            BoxConstraints(maxWidth: constraints.maxWidth / 2),
                      ),
                      onChanged: (value) => checkFormCompleted(),
                    ),
                    TextFormField(
                      controller: newEndVerse,
                      validator: endVerseValidator,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9:]')),
                      ],
                      decoration: InputDecoration(
                        labelText: 'End Verse',
                        constraints:
                            BoxConstraints(maxWidth: constraints.maxWidth / 2),
                      ),
                      onChanged: (value) => checkFormCompleted(),
                    ),
                  ],
                );
              }),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ScrollConfiguration(
                    behavior:
                        const MaterialScrollBehavior().copyWith(dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                      PointerDeviceKind.stylus,
                    }),
                    child: SingleChildScrollView(
                      child: SelectableText(
                        passage,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: submit,
                  child: const Text('Get Passage'),
                ),
              ),
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
                    child: const Text('Save Passage'),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  bool checkFormCompleted() {
    save = null;
    if (selectedBible != null &&
        selectedBook != null &&
        newStartVerse.text.isNotEmpty) {
      setState(() {
        submit = getVerses;
      });
      return true;
    } else {
      setState(() {
        submit = null;
      });
      return false;
    }
  }

  String? bibleValidator(BibleDB? bible) {
    if (bible == null) return 'Please choose a bible';
    return null;
  }

  String? bookValidator(BookDB? book) {
    if (book == null) return 'Please choose a book';
    return null;
  }

  String? startVerseValidator(String? text) {
    var error = 'Use chapter:verse form';
    if (text == null || text.isEmpty) {
      return error;
    } else {
      if (text.contains(':')) {
        var split = text.split(':');
        if (split.length == 2) {
          return null;
        } else {
          return error;
        }
      } else {
        return error;
      }
    }
  }

  String? endVerseValidator(String? text) {
    var error = 'Use chapter:verse form';
    if (text == null) return error;
    if (text.isNotEmpty) {
      if (text.contains(':')) {
        var split = text.split(':');
        if (split.length == 2) {
          return null;
        } else {
          return error;
        }
      } else {
        return error;
      }
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.initState(context);
    widget.initFloatingAction(
        true, () => setCreate(), const Icon(Icons.add_rounded));
  }

  @override
  Future<List<PassageData?>> create() async {
    VerseDB pv1 = v1!;
    VerseDB pv2 = pv1;
    if (v2 != null) {
      pv2 = v2!;
    }

    PassageData newPassage = PassageData(
      v1: pv1.id,
      v2: pv2.id,
      bible: selectedBible!.name,
      book: selectedBook!.name,
      start: '${pv1.chapter}:${pv1.verse}',
      end: '${pv2.chapter}:${pv2.verse}',
      passage: passage,
    );
    await newPassage.saveData();
    addPassage(newPassage);
    await setRead();
    return [newPassage];
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
  Widget createView(BuildContext context) {
    return verseForm;
  }

  @override
  Future<void> delete(PassageData item) async {
    if (await widget.db.passageExists(item.id ??= -1)) {
      await widget.db.delPassage(item.id!);
      List<PassageData> tmp = List.from(passages);
      tmp.remove(item);
      passages = tmp;
    }
  }

  @override
  Widget deleteView(BuildContext context) {
    // TODO: implement deleteView
    throw UnimplementedError();
  }

  @override
  Future<void> setRead() async {
    // TODO: implement setRead
    await super.setRead();
    widget.setAndroidBack(() async {
      widget.app.navigation.goto(context, '/');
      return false;
    });
    widget.initFloatingAction(
      true,
      () => setCreate(),
      const Icon(Icons.add),
    );
  }

  @override
  Widget readView(BuildContext context) {
    return Stack(children: [
      ValueListenableBuilder<List<PassageData>>(
        valueListenable: widget.app.passagesNotifier,
        builder: (context, newPassages, _) {
          return RefreshIndicator(
              onRefresh: () async {
                passages = (await widget.db.getPassages())
                    .map((p) => PassageData().fromEntry(p))
                    .toList();
              },
              child: ScrollConfiguration(
                behavior: const MaterialScrollBehavior().copyWith(dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.stylus,
                }),
                child: ListView.builder(
                  itemCount: newPassages.length,
                  itemBuilder: (BuildContext context, int idx) {
                    var current = newPassages[idx];
                    return Card(
                      child: ExpansionTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${current.bible},',
                            ),
                            Row(
                              children: [
                                Text('${current.book} '),
                                Text(current.start),
                                const Text(' - '),
                                Text(current.end),
                              ],
                            ),
                          ],
                        ),
                        trailing: OutlinedButton(
                          onPressed: () => delete(current),
                          child: const Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                          ),
                        ),
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
                                    current.passage,
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
              ));
        },
      ),
      Positioned(
        bottom: 10,
        right: 10,
        child: widget.floatingActionButton,
      ),
    ]);
  }

  @override
  Future<PassageData> update(PassageData item) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Widget updateView(BuildContext context) {
    // TODO: implement updateView
    throw UnimplementedError();
  }
}
