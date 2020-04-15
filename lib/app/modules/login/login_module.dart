import 'package:dart_week_mobile/app/modules/login/login_controller.dart';
import 'package:dart_week_mobile/app/modules/signup/signup_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_mobile/app/modules/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('/signup', module: SignupModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
