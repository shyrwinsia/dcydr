import 'package:dcydr/bloc/pickpage/bloc.dart';
import 'package:dcydr/bloc/pickpage/event.dart';
import 'package:dcydr/bloc/pickpage/state.dart';
import 'package:dcydr/bloc/router/bloc.dart';
import 'package:dcydr/bloc/router/event.dart';
import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/custombutton.dart';
import 'package:dcydr/components/fade.dart';
import 'package:dcydr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_text/gradient_text.dart';

class PickPage extends StatefulWidget {
  final RandomList list;
  PickPage({this.list});
  @override
  _PickPageState createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  PickPageBloc _pageBloc;
  RouterBloc _routerBloc;

  @override
  Widget build(BuildContext context) {
    _pageBloc = BlocProvider.of<PickPageBloc>(context);
    _routerBloc = BlocProvider.of<RouterBloc>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.list.name,
        hasBackButton: true,
        actions: <Widget>[
          IconButton(
            iconSize: 16,
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            icon: Icon(
              FlatIcons.more_1,
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) =>
                  _buildActionsDialog(this.widget.list),
            ),
          ),
        ],
      ),
      body: BlocListener<PickPageBloc, PickPageState>(
        bloc: _pageBloc,
        listener: (context, state) {
          if (state is Saved) Navigator.pop(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FadeIn(
                child: InkWell(
                  onTap: () => _pageBloc.add(
                    PickItem(list: this.widget.list),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: _blocBuilder(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _blocBuilder(BuildContext context) =>
      BlocBuilder<PickPageBloc, PickPageState>(
        bloc: _pageBloc,
        builder: (context, state) {
          if (state is Uninitialized) {
            return Text(
              'Tap anywhere to pick',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: const Color(0x66000000),
              ),
            );
          } else if (state is TooFewItemsState) {
            return _buildErrorMessage(
              '🤷‍♂️',
              "Nothing to pick!",
              "Put least two items and tap again.",
              CustomFlatIconButton(
                icon: FlatIcons.edit,
                label: 'Edit this list',
                callback: () =>
                    _routerBloc.add(MoveToEditPage(list: this.widget.list)),
              ),
            );
          } else if (state is TooManyToggledState) {
            return _buildErrorMessage(
              '😒',
              "Too few items.",
              "Activate at least two items and tap again.",
              CustomFlatIconButton(
                icon: FlatIcons.switch_5,
                label: 'Toggle items',
                callback: () =>
                    _routerBloc.add(MoveToTogglePage(list: this.widget.list)),
              ),
            );
          } else if (state is PickedItemState) {
            return GradientText(state.pick,
                gradient: LinearGradient(
                    colors: [const Color(0xff13b6cb), const Color(0xff2a86cb)]),
                style: TextStyle(fontSize: 42),
                textAlign: TextAlign.center);
          } else {
            return Container();
          }
        },
      );

  Widget _buildActionsDialog(RandomList list) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Icon(FlatIcons.switch_5),
                title: Text('Toggle items'),
                onTap: () {
                  _routerBloc.add(MoveToTogglePage(list: list));
                  // get out of the dialog box
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(FlatIcons.edit),
                title: Text('Edit this list'),
                onTap: () {
                  _routerBloc.add(MoveToEditPage(list: list));
                  // get out of the dialog box
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(FlatIcons.trash),
                title: Text('Delete this list'),
                onTap: () {
                  _pageBloc.add(DeleteList(list: list));
                  // get out of the dialog box
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );

  Widget _buildErrorMessage(
      String emoji, String title, String subtitle, Widget button) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          emoji,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            color: const Color(0x66000000),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            color: const Color(0x66000000),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: const Color(0x66000000),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: button,
        ),
      ],
    );
  }
}
