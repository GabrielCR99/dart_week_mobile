import 'package:dart_week_mobile/app/mixins/loader_mixin.dart';
import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, LoaderMixin {
  final UserRepository userRepository;

  _HomeControllerBase(this.userRepository);

  Future<void> checkLogin() async {
    showLoader();
    if (await userRepository.isUserLogged()) {
      Get.offAllNamed('/movimentations');
    } else {
      hiderLoader();
      Get.offAllNamed('/login');
    }
  }
}
