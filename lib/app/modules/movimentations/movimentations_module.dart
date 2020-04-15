import 'package:dart_week_mobile/app/modules/movimentations/widgets/remaining_money_panel/remaining_money_panel_controller.dart';
import 'package:dart_week_mobile/app/modules/movimentations/movimentations_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_mobile/app/modules/movimentations/movimentations_page.dart';

class MovimentationsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RemainingMoneyPanelController()),
        Bind((i) => MovimentationsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MovimentationsPage()),
      ];

  static Inject get to => Inject<MovimentationsModule>.of();
}
