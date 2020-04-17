import 'package:dart_week_mobile/app/modules/movimentations/widgets/register_move/register_move_controller.dart';
import 'package:dart_week_mobile/app/modules/login/login_module.dart';
import 'package:dart_week_mobile/app/modules/movimentations/widgets/remaining_money_panel/remaining_money_panel_controller.dart';
import 'package:dart_week_mobile/app/modules/movimentations/movimentations_controller.dart';
import 'package:dart_week_mobile/app/repositories/categories_repository.dart';
import 'package:dart_week_mobile/app/repositories/move_repositories.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_mobile/app/modules/movimentations/movimentations_page.dart';

class MovimentationsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterMoveController()),
        Bind((i) => RemainingMoneyPanelController(i.get<MoveRepositories>())),
        Bind((i) => MoveRepositories()),
        Bind((i) => CategoryRepository()),
        Bind((i) => MovimentationsController(
            i.get<MoveRepositories>(), i.get<RemainingMoneyPanelController>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MovimentationsPage()),
      ];

  static Inject get to => Inject<MovimentationsModule>.of();
}
