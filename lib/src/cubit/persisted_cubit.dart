import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'persisted_state.dart';

class PersistedCubit extends Cubit<PersistedState> {
  PersistedCubit() : super(PersistedStateInitial());

  void justCollectInput() => emit(PersistedStateJustCollectInput());

  void editingComplete() => emit(PersistedStateEditComplete());

  void reset() => emit(PersistedStateInitial());
}
