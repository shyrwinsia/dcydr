import 'package:dcydr/bloc/listpage/bloc.dart';
import 'package:dcydr/bloc/listpage/event.dart';
import 'package:dcydr/bloc/listpage/state.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/pages/listpage/listpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
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
        onSave: onSave,
      ),
    );
  }

  void onSave(RandomList list) {
    _pageBloc.add(CreateList(list: list));
  }
}
