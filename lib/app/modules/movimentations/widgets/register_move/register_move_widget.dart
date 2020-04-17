import 'package:combos/combos.dart';
import 'package:dart_week_mobile/app/modules/movimentations/widgets/register_move/register_move_controller.dart';
import 'package:dart_week_mobile/app/utils/size_utils.dart';
import 'package:dart_week_mobile/app/widgets/controle_ja_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterMoveWidget extends StatelessWidget {
  final controller = Modular.get<RegisterMoveController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Form(
          key: controller.formKey,
          child: Container(
            width: SizeUtils.screenWidth * .7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: SizeUtils.screenWidth,
                  color: Colors.grey[300],
                  child: Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          controller.setIncludedDate(date);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(controller.includedDate == null
                                ? 'Selecionar data'
                                : DateFormat('d/MM/y')
                                    .format(controller.includedDate)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(Icons.calendar_today),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: !controller.isCategoryValid
                      ? BoxDecoration()
                      : BoxDecoration(),
                  child: ListCombo(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(controller.category?.name ?? 'Categoria'),
                    ),
                    getList: () => controller.categories,
                    itemBuilder: (context, parameters, item) =>
                        ListTile(title: Text(item.name)),
                    onItemTapped: (description) {
                      controller.changeCategory(description);
                    },
                  ),
                ),
                Visibility(
                  visible: !controller.isCategoryValid,
                  child: Container(
                    width: SizeUtils.screenWidth,
                    padding: const EdgeInsets.only(top: 8.0, left: 14.0),
                    child: Text(
                      'Selecione uma categoria',
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ControleJaTextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: controller.changeDescription,
                  label: 'Descrição',
                  borderRadius: 5,
                  fontSize: 15,
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 15.0,
                    bottom: 15.0,
                  ),
                  validator: (desc) {
                    if (desc.isEmpty || desc == null) {
                      return 'Descrição obrigatória!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ControleJaTextFormField(
                  keyboardType: TextInputType.number,
                  label: 'Valor',
                  borderRadius: 5,
                  controller: controller.moneyController,
                  fontSize: 15,
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 15,
                    bottom: 15,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Valor obrigatóro!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
