import 'package:dart_week_mobile/app/modules/movimentations/widgets/movimentation_item.dart';
import 'package:dart_week_mobile/app/modules/movimentations/widgets/remaining_money_panel/remaining_money_panel_widget.dart';
import 'package:dart_week_mobile/app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'movimentations_controller.dart';

class MovimentationsPage extends StatefulWidget {
  final String title;
  const MovimentationsPage({Key key, this.title = "Movimentations"})
      : super(key: key);

  @override
  _MovimentationsPageState createState() => _MovimentationsPageState();
}

class _MovimentationsPageState
    extends ModularState<MovimentationsPage, MovimentationsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: Icon(Icons.add),
          itemBuilder: (_) {
            return [
              PopupMenuItem(
                child: Text('Receita'),
                value: 'receita',
              ),
              PopupMenuItem(
                child: Text('Despesa'),
                value: 'despesa',
              ),
            ];
          },
        ),
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {}),
      ],
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: SizeUtils.screenHeight,
        child: Stack(
          children: <Widget>[
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
            itemBuilder: (_, index) => MovimentationItem(),
            separatorBuilder: (_, index) => Divider(
              color: Colors.black,
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
