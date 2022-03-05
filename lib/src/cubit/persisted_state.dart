part of 'persisted_cubit.dart';

@immutable
abstract class PersistedState {}

class PersistedStateInitial extends PersistedState {}

class PersistedStateJustCollectInput extends PersistedState {}

class PersistedStateEditComplete extends PersistedState {}
