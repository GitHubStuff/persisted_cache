import 'package:flutter_modular/flutter_modular.dart';
import 'package:persisted_cache/persisted_cache.dart';

import 'scaffold_widget.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.factory((i) => PersistedCubit()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ScaffoldWidget(title: 'persisted_cache')),
  ];
}
