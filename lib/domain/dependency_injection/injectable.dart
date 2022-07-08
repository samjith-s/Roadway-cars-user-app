import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:roadway/domain/dependency_injection/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(
    getIt,
    environment: Environment.prod,
  );

}













