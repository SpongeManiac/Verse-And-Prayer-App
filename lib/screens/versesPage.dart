import 'package:flutter/src/widgets/framework.dart';
import 'package:verse_prayer_study/models/verseData.dart';
import 'package:verse_prayer_study/shared/crudState.dart';

import 'themedPage.dart';

class VersesPage extends ThemedPage {
  VersesPage({super.key, required super.title});

  @override
  State<StatefulWidget> createState() => _VersesPageState();
}

class _VersesPageState extends CRUDState<VerseData> {
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
    // TODO: implement readView
    throw UnimplementedError();
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
