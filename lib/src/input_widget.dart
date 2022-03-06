import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:log/log.dart';
import 'package:persisted_cache/src/cubit/persisted_cubit.dart';

const double _iconSize = 56.0;

class InputWidget extends StatefulWidget {
  final bool enableAutoCorrect;

  InputWidget({this.enableAutoCorrect = false});
  _InputWidget createState() => _InputWidget();
}

class _InputWidget extends ObservingStatefulWidget<InputWidget> {
  late FocusNode _focusNode;
  late TextEditingController _textEditingController;
  late PersistedCubit _persistedCubit;

  @override
  void initState() {
    super.initState();
    _persistedCubit = Modular.get<PersistedCubit>();
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
  }

  @override
  dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: _textField()),
          buttons(),
        ],
      ).padding(left: 4.0, bottom: 4),
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
        if (state is PersistedStateShowRecalledItem) {
          _textEditingController.text = state.recalledText;
          _textEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: _textEditingController.text.length),
          );
        }
        return TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 4,
          minLines: 4,
          autocorrect: widget.enableAutoCorrect,
          focusNode: _focusNode,
          controller: _textEditingController,
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
            _persistedCubit.inputResult(newContent);
          },
          onTap: () {
            debugPrint('OnTap');
            //_persistedCubit.reset();
          },
        );
      },
    );
  }

  Widget buttons() {
    return BlocBuilder<PersistedCubit, PersistedState>(
        bloc: _persistedCubit,
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: _iconSize,
                    icon: Icon(Icons.arrow_circle_up_sharp),
                    onPressed: _persistedCubit.hasPreviousValue ? () => _persistedCubit.recallFromUpTheList() : null,
                  ),
                  IconButton(
                    iconSize: _iconSize,
                    icon: Icon(Icons.arrow_circle_down_sharp),
                    onPressed: _persistedCubit.hasNextValue ? () => _persistedCubit.recallFromDownTheList() : null,
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    _persistedCubit.inputResult(_textEditingController.text);
                  },
                  child: Text('Save').padding(left: 22, right: 22)),
            ],
          );
        });
  }
}
