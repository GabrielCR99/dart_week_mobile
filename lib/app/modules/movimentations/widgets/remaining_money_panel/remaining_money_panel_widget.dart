import 'package:dart_week_mobile/app/modules/movimentations/widgets/remaining_money_panel/remaining_money_panel_controller.dart';
import 'package:dart_week_mobile/app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  @override
  Widget build(BuildContext context) {
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
        return _buildContent();
      },
    );
  }

  Widget _buildContent() {
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
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
              Text(
                'Janeiro/2020',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: <Widget>[
              Text('Saldo'),
              Text(
                'R\$ 3000,00',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
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
                                'R\$ 200',
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
                                'R\$ 200',
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
              )

            ],
          ),
        ],
      ),
    );
  }
}
