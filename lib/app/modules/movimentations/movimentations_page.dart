import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/mixins/loader_mixin.dart';
import 'package:dart_week_mobile/app/modules/movimentations/widgets/movimentation_item.dart';
import 'package:dart_week_mobile/app/modules/movimentations/widgets/register_move/register_move_controller.dart';
import 'package:dart_week_mobile/app/modules/movimentations/widgets/register_move/register_move_widget.dart';
import 'package:dart_week_mobile/app/modules/movimentations/widgets/remaining_money_panel/remaining_money_panel_widget.dart';
import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:dart_week_mobile/app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'movimentations_controller.dart';

class MovimentationsPage extends StatefulWidget {
  final String title;

  const MovimentationsPage({Key key, this.title = "Movimentations"})
      : super(key: key);

  @override
  _MovimentationsPageState createState() => _MovimentationsPageState();
}

class _MovimentationsPageState
    extends ModularState<MovimentationsPage, MovimentationsController>
    with LoaderMixin {
  List<ReactionDisposer> disposers;
  RegisterMoveController registerMoveController =
      Modular.get<RegisterMoveController>();

  @override
  void initState() {
    super.initState();
    disposers ??= [
      reaction((_) => controller.remainingMoneyController.date,
          (_) => controller.searchMovimentation()),
      reaction((_) => registerMoveController.saveMovimentationStatus, (_) {
        switch (_) {
          case StoreState.loading:
            showLoader();
            break;
          case StoreState.error:
            hiderLoader();
            Get.snackbar('Erro', 'Erro ao salvar movimentação');
            break;
          case StoreState.loaded:
            hiderLoader();
            Get.back();
            controller.searchMovimentation();
            controller.remainingMoneyController.searchTotalMonth();
            break;
        }
      }),
      reaction((_) => registerMoveController.categoriesStatus,
          (categoryStatus) {
        switch (categoryStatus) {
          case StoreState.loading:
            showLoader();
            break;
          case StoreState.loaded:
            hiderLoader();
            _showInsertModal();
            break;
        }
      }),
    ];
    controller.searchMovimentation();
  }

  @override
  void dispose() {
    super.dispose();
    disposers.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: Icon(Icons.add),
          onSelected: (item) {
            registerMoveController.searchCategories(item);
          },
          itemBuilder: (_) {
            return [
              PopupMenuItem(
                child: Text('Receita'),
                value: 'recipe',
              ),
              PopupMenuItem(
                child: Text('Despesa'),
                value: 'expense',
              ),
            ];
          },
        ),
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Modular.get<UserRepository>().signOut();
            Get.offAllNamed('/');
          },
        ),
      ],
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: SizeUtils.screenHeight,
        child: Stack(
          children: <Widget>[
            Observer(
              builder: (_) {
                switch (controller.moveState) {
                  case StoreState.initial:
                  case StoreState.loading:
                    return Container(
                      height: SizeUtils.screenHeight,
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case StoreState.loaded:
                    return _buildContent();
                  case StoreState.error:
                    Get.snackbar(
                        'Ero ao buscar dados', controller.errorMessage);
                    return Container();
                }
              },
            ),
            _buildContent(),
            RemainingMoneyPanelWidget(
              appBarHeight: appBar.preferredSize.height,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) =>
                MovimentationItem(item: controller.moves[index]),
            separatorBuilder: (_, index) => Divider(color: Colors.black),
            itemCount: controller.moves?.length ?? 0,
          ),
        ),
        SizedBox(
          height: SizeUtils.screenHeight * .08,
        ),
      ],
    );
  }

  _showInsertModal() {
    registerMoveController.resetForm();

    Get.dialog(AlertDialog(
      content: RegisterMoveWidget(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      title: Text('Adicionar'),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Get.back(),
          child: Text('Cancelar'),
        ),
        FlatButton(
          onPressed: () => registerMoveController.saveMove(),
          child: Text('Salvar'),
        ),
      ],
    ));
  }
}
