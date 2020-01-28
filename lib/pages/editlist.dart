import 'package:dcydr/bloc/listpage/bloc.dart';
import 'package:dcydr/bloc/listpage/event.dart';
import 'package:dcydr/bloc/listpage/state.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/pages/listpage/listpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditListPage extends StatefulWidget {
  final RandomList list;

  EditListPage({@required this.list});

  @override
  State<EditListPage> createState() => _EditListPageState();
}

class _EditListPageState extends State<EditListPage> {
  ListPageBloc _pageBloc;

  @override
  Widget build(BuildContext context) {
    _pageBloc = BlocProvider.of<ListPageBloc>(context);
    return BlocListener<ListPageBloc, ListPageState>(
      bloc: _pageBloc,
      listener: (context, state) {
        if (state is Saved) Navigator.pop(context);
      },
      child: ListPage(
        list: this.widget.list,
        onSave: onSave,
      ),
    );
  }

  void onSave(RandomList list) {
    _pageBloc.add(UpdateList(list: list));
  }
}
