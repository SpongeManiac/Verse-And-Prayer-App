import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:verse_prayer_study/models/bibleData.dart';
import 'package:verse_prayer_study/models/bookData.dart';
import 'package:verse_prayer_study/models/verseData.dart';
import 'package:verse_prayer_study/platform/database/database.dart';
import 'package:verse_prayer_study/shared/crudState.dart';

import 'themedPage.dart';

class VersesPage extends ThemedPage {
  VersesPage({super.key, required super.title});

  @override
  void initState(BuildContext context) {
    super.initState(context);
    setAndroidBack(() async {
      app.navigation.goto(context, '/');
      return false;
    });
  }

  @override
  State<StatefulWidget> createState() => _VersesPageState();
}

class _VersesPageState extends CRUDState<VerseData> {
  TextEditingController newChapter = TextEditingController(text: '');
  TextEditingController newVerse = TextEditingController(text: '');

  BibleData? selectedBible;
  List<BibleData> get bibles => widget.app.biblesNotifier.value;
  set bibles(List<BibleData> value) => widget.app.biblesNotifier.value = value;

  List<DropdownMenuItem<BibleData>> get biblesItems {
    return bibles
        .map((b) => DropdownMenuItem(
              value: b,
              child: Row(
                children: [
                  Text('(${b.language})'),
                  Text(b.name),
                ],
              ),
            ))
        .toList();
  }

  BookData? selectedBook;
  List<BookData> get books => widget.app.booksNotifier.value;
  set books(List<BookData> books) => widget.app.booksNotifier.value = books;

  List<DropdownMenuItem<BookData>> get booksItems {
    return books
        .map((b) => DropdownMenuItem(
              value: b,
              child: Text(b.name),
            ))
        .toList();
  }

  Future<void> setBibleBooks() async {
    var bookNum = selectedBook != null ? books.indexOf(selectedBook!) : -1;
    var booksDB = await widget.db.getBibleBooks(selectedBible);
    books = booksDB.map((b) => BookData().fromEntry(b)).toList();
    selectedBook = bookNum == -1 ? null : books[bookNum];
  }

  Future<void> getVerse() async {
    print('Getting verse...');
    if (selectedBible != null &&
        selectedBook != null &&
        newChapter.text.isNotEmpty &&
        newVerse.text.isNotEmpty) {
      print(
          'Getting ${selectedBible!.name}, ${selectedBook!.name}, ${newChapter.text}:${newVerse.text} ...');
      var verseDB = await widget.db.getSpecificVerse(selectedBible!,
          selectedBook!, int.parse(newChapter.text), int.parse(newVerse.text));
      verse = verseDB == null ? 'No verse found.' : verseDB.scripture;
    } else {
      verse = 'No verse found.';
    }
    setState(() {});
  }

  String verse = '';
  void Function()? submit;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget get verseForm => Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const Text('Select a verse'),
              DropdownButtonFormField(
                isExpanded: true,
                items: biblesItems,
                value: selectedBible,
                onChanged: (value) {
                  selectedBible = value;
                  () async {
                    await setBibleBooks();
                  }();
                  setState(() {});
                  if (selectedBible != null &&
                      selectedBook != null &&
                      newChapter.text.isNotEmpty &&
                      newVerse.text.isNotEmpty) {
                    setState(() {
                      submit = getVerse;
                    });
                  } else {
                    setState(() {
                      submit = null;
                    });
                  }
                },
              ),
              DropdownButtonFormField(
                isExpanded: true,
                items: booksItems,
                value: selectedBook,
                onChanged: (value) {
                  selectedBook = value;
                  setState(() {});
                  if (selectedBible != null &&
                      selectedBook != null &&
                      newChapter.text.isNotEmpty &&
                      newVerse.text.isNotEmpty) {
                    setState(() {
                      submit = getVerse;
                    });
                  } else {
                    setState(() {
                      submit = null;
                    });
                  }
                },
              ),
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Row(
                  children: [
                    TextFormField(
                      controller: newChapter,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: 'Chapter',
                        constraints:
                            BoxConstraints(maxWidth: constraints.maxWidth / 2),
                      ),
                      onChanged: (value) {
                        if (selectedBible != null &&
                            selectedBook != null &&
                            value.isNotEmpty &&
                            newVerse.text.isNotEmpty) {
                          setState(() {
                            submit = getVerse;
                          });
                        } else {
                          setState(() {
                            submit = null;
                          });
                        }
                      },
                    ),
                    TextFormField(
                      controller: newVerse,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: 'Verse',
                        constraints:
                            BoxConstraints(maxWidth: constraints.maxWidth / 2),
                      ),
                      onChanged: (value) {
                        if (selectedBible != null &&
                            selectedBook != null &&
                            newChapter.text.isNotEmpty &&
                            value.isNotEmpty) {
                          setState(() {
                            submit = getVerse;
                          });
                        } else {
                          setState(() {
                            submit = null;
                          });
                        }
                      },
                    ),
                  ],
                );
              }),
              Expanded(
                child: Center(
                  child: Text(verse),
                ),
              ),
              ElevatedButton(
                onPressed: submit,
                child: const Text('Get Verse'),
              )
            ],
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    widget.initState(context);
  }

  @override
  Future<List<VerseData?>> create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Widget createView(BuildContext context) {
    // TODO: implement createView
    throw UnimplementedError();
  }

  @override
  Future<void> delete(VerseData item) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Widget deleteView(BuildContext context) {
    // TODO: implement deleteView
    throw UnimplementedError();
  }

  @override
  Widget readView(BuildContext context) {
    return verseForm;
  }

  @override
  Future<VerseData> update(VerseData item) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Widget updateView(BuildContext context) {
    // TODO: implement updateView
    throw UnimplementedError();
  }
}
