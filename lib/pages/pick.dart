import 'package:dcydr/bloc/pickpage/bloc.dart';
import 'package:dcydr/bloc/pickpage/event.dart';
import 'package:dcydr/bloc/pickpage/state.dart';
import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/fade.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/pages/toggle.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_text/gradient_text.dart';

class PickPage extends StatefulWidget {
  final RandomList _list;
  PickPage(this._list);
  @override
  _PickPageState createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  PickPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = PickPageBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget._list.name,
        hasBackButton: true,
        actions: <Widget>[
          IconButton(
            iconSize: 18,
            icon: Icon(
              FlatIcons.settings_5,
            ),
            onPressed: () => _bloc.add(ToggleList()),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FadeIn(
              child: _pageRouter(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageRouter(BuildContext context) =>
      BlocListener<PickPageBloc, PickPageState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is MoveToToggleListPage) {
            Navigator.of(context)
                .push(
                  MaterialPageRoute<void>(
                    builder: (context) => TogglePage(list: widget._list),
                  ),
                )
                .then((c) => _bloc.add(Reinitialize()));
          }
        },
        child: InkWell(
          onTap: () => _bloc.add(
            PickItem(items: this.widget._list.items),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: _blocBuilder(context),
            ),
          ),
        ),
      );

  Widget _blocBuilder(BuildContext context) {
    return BlocBuilder<PickPageBloc, PickPageState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is PickedItemState) {
          return _buildText(text: state.pick);
        } else if (state is Uninitialized) {
          return _buildText();
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildText({String text}) {
    return text == null
        ? Text(
            'Tap anywhere to pick',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: const Color(0x66000000),
            ),
          )
        : GradientText(text,
            gradient: LinearGradient(
                colors: [const Color(0xff13b6cb), const Color(0xff2a86cb)]),
            style: TextStyle(fontSize: 42),
            textAlign: TextAlign.center);
  }
}

// class Actions {
//   static const String EDIT = 'Edit';
//   static const String DELETE = 'Delete';
//   static const List<String> choices = <String>[EDIT, DELETE];
// }
// Widget _buildDeleteConfirmDialog() => AlertDialog(
//       contentPadding: EdgeInsets.fromLTRB(24, 32, 24, 16),
//       content: Text('Delete this list?'),
//       actions: <Widget>[
//         FlatButton(
//           child: Text('Cancel'),
//           onPressed: () {
//             _bloc.add(DeleteCancelled());
//           },
//         ),
//         FlatButton(
//           child: Text(
//             'Delete',
//             style: TextStyle(color: Colors.red),
//           ),
//           onPressed: () {
//             _bloc.add(DeleteConfirmed());
//           },
//         ),
//       ],
//     );
// void choiceAction(String choice) {
//   if (choice == Actions.EDIT) {
//     _bloc.add(EditAction());
//   } else if (choice == Actions.DELETE) {
//     _bloc.add(DeleteAction());
//   }
// }
