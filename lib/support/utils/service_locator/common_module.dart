import '../localize.dart';
import 'app_module.dart';
import 'service_locator.dart';

class CommonsModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerSingleton<LocalizeProtocol>(Localize.instance);
  }
}
