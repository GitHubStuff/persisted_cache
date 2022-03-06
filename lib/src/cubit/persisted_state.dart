part of 'persisted_cubit.dart';

@immutable
abstract class PersistedState {}

class PersistedStateInitial extends PersistedState {}

class PersistedStateJustCollectInput extends PersistedState {}

class PersistedStateEditComplete extends PersistedState {}

class PersistedStateNewItem extends PersistedState {
  final String newText;
  PersistedStateNewItem(this.newText);
}

class PersistedStateShowRecalledItem extends PersistedState {
  final String recalledText;
  PersistedStateShowRecalledItem(this.recalledText);
}
