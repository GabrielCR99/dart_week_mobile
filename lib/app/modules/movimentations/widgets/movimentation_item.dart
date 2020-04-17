import 'package:dart_week_mobile/app/models/movimentation_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovimentationItem extends StatelessWidget {
  final MovimentationModel item;
  MovimentationItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat('###.00', 'pt-BR');
    var dateFormat = DateFormat('dd/MM/yyyy');
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dateFormat.format(item.moveDate),
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor:
                item.category.categoryType == 'CategoryType.expense'
                    ? Colors.red
                    : Colors.blue,
            child: Icon(
              item.category.categoryType == 'CategoryType.expense'
                  ? Icons.money_off
                  : Icons.monetization_on,
              color: Colors.white,
            ),
          ),
          title: Text(item.description),
          subtitle: Text(item.category.name),
          trailing: Container(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              'R\$ ${numberFormat.format(item.value)}',
              style: TextStyle(
                color: item.category.categoryType == 'CategoryType.expense'
                    ? Colors.red
                    : Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
