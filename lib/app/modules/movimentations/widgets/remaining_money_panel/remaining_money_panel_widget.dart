import 'dart:io';

import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/modules/movimentations/widgets/remaining_money_panel/remaining_money_panel_controller.dart';
import 'package:dart_week_mobile/app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class RemainingMoneyPanelWidget extends StatefulWidget {
  final double appBarHeight;

  const RemainingMoneyPanelWidget({Key key, this.appBarHeight})
      : super(key: key);

  @override
  _RemainingMoneyPanelWidgetState createState() =>
      _RemainingMoneyPanelWidgetState();
}

class _RemainingMoneyPanelWidgetState extends ModularState<
    RemainingMoneyPanelWidget, RemainingMoneyPanelController> {
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    super.initState();
    disposers ??= [
      reaction((_) => controller.date, (_) => controller.searchTotalMonth())
    ];
    controller.searchTotalMonth();
  }

  @override
  void dispose() {
    super.dispose();
    disposers.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SlidingSheet(
          elevation: 8,
          cornerRadius: 30,
          snapSpec: SnapSpec(
            snap: true,
            snappings: [.1, .4],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          headerBuilder: (_, state) {
            return Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
          builder: (_, state) {
            return Observer(
              builder: (_) {
                switch (controller.totalState) {
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
                return null;
              },
            );
          },
        );
      },
    );
  }

  Widget _buildContent() {
    var model = controller.totalMoveModel;
    var numberFormat = NumberFormat('###.00', 'pt_BR');

    return Container(
      width: SizeUtils.screenWidth,
      height: SizeUtils.screenHeight * .4 - widget.appBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => controller.previousMonth(),
              ),
              Text(
                DateFormat.yMMM('pt_BR').format(controller.date),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: model.remainingMoney < 0 ? Colors.red : Colors.green,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () => controller.nextMonth(),
              ),
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 60 : 30,
          ),
          Column(
            children: <Widget>[
              Text('Saldo'),
              Text(
                'R\$ ${model.remainingMoney != null && model.remainingMoney != 0.0 ? numberFormat.format(model.remainingMoney) : '-'}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: model.remainingMoney < 0 ? Colors.red : Colors.green,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                margin: EdgeInsets.only(bottom: Platform.isIOS ? 30 : 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF4BCE97),
                            foregroundColor: Colors.white,
                            child: Icon(Icons.arrow_upward),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Receitas',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4BCE97),
                              ),
                            ),
                            Text(
                              'R\$ ${model.recipes.total != null && model.recipes.total != 0.0 ? numberFormat.format(model.recipes.total) : '-'}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4BCE97),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.arrow_downward),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Despesas',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              'R\$ ${model.expenses.total != null && model.expenses.total != 0.0 ? numberFormat.format(model.expenses.total) : '-'}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
