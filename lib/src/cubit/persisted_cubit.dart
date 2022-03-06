import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:persisted_cache/src/hive/persisted_hive.dart';

part 'persisted_state.dart';

class PersistedCubit extends Cubit<PersistedState> {
  final PersistedHive persistedHive = PersistedHive.reload() ?? PersistedHive();

  PersistedCubit() : super(PersistedStateInitial());

  void justCollectInput() => emit(PersistedStateJustCollectInput());

  void editingComplete() => emit(PersistedStateEditComplete());

  void reset() => emit(PersistedStateInitial());

  bool get hasNextValue => persistedHive.hasNext;

  bool get hasPreviousValue => persistedHive.hasPrevious;

  void inputResult(String newInput) {
    persistedHive.update(newInput);
    emit(PersistedStateNewItem(newInput));
  }

  void recallFromDownTheList() {
    final String nextString = persistedHive.recallNext();
    emit(PersistedStateShowRecalledItem(nextString));
  }

  void recallFromUpTheList() {
    final String previousString = persistedHive.recallPrevious();
    emit(PersistedStateShowRecalledItem(previousString));
  }
}
