import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log/log.dart';
import 'package:persisted_cache/src/cubit/persisted_cubit.dart';

const double _iconSize = 48.0;
final PersistedCubit _persistedCubit = PersistedCubit();

class InputWidget extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  final bool enableAutoCorrect;

  InputWidget({this.enableAutoCorrect = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: _textField()),
          buttons(),
        ],
      ).padding(left: 4.0),
    ).borderAll(Colors.blueAccent).paddingAll(3.0);
  }

  Widget _textField() {
    return BlocConsumer<PersistedCubit, PersistedState>(
      bloc: _persistedCubit,
      listener: (context, state) {
        Log.T('Listener-state $state');
      },
      builder: (context, state) {
        Log.T('Builder-state $state');
        if (state is PersistedStateInitial) {
          _focusNode.requestFocus();
        }
        return TextField(
          focusNode: _focusNode,
          controller: _controller,
          onChanged: (newText) {
            debugPrint('NewText: $newText');
            _persistedCubit.justCollectInput();
          },
          onEditingComplete: () {
            // Called BEFORE onSubmitted
            _persistedCubit.editingComplete();
            context.hideKeyboard();
            debugPrint('Enditing complete');
          },
          onSubmitted: (newContent) {
            debugPrint('newContent: $newContent');
          },
          onTap: () {
            debugPrint('OnTap');
            _persistedCubit.reset();
          },
        );
      },
    );
  }

  Widget buttons() => Row(
        children: [
          IconButton(
            iconSize: _iconSize,
            icon: Icon(Icons.arrow_circle_up_sharp),
            onPressed: () {
              // Action
            },
          ),
          IconButton(
            iconSize: _iconSize,
            icon: Icon(Icons.arrow_circle_down_sharp),
            onPressed: () {
              // Action
            },
          )
        ],
      );
}
