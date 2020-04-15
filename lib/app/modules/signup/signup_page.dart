import 'package:dart_week_mobile/app/utils/size_utils.dart';
import 'package:dart_week_mobile/app/utils/theme_utils.dart';
import 'package:dart_week_mobile/app/widgets/controle_ja_button.dart';
import 'package:dart_week_mobile/app/widgets/controle_ja_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({Key key, this.title = "Signup"}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  //use 'controller' variable to access controller

  AppBar appBar = AppBar(
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          _buildHeader(),
          SizedBox(
            height: 30,
          ),
          _buildForm(),
        ],
      ),
    );
  }

  Form _buildForm() {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            ControleJaTextFormField(
              label: 'Login',
            ),
            SizedBox(
              height: 30,
            ),
            ControleJaTextFormField(
              label: 'Senha',
            ),
            SizedBox(
              height: 30,
            ),
            ControleJaTextFormField(
              label: 'Confirmar senha',
            ),
            SizedBox(
              height: 30,
            ),
            ControleJaButton(
              label: 'Cadastrar',
              onPressed: () {},
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: ThemeUtils.primaryColor,
      height: SizeUtils.screenHeight * .5 -
          (SizeUtils.statusBarHeight + appBar.preferredSize.height),
      width: SizeUtils.screenWidth,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            height: 290,
            child: Image.asset('assets/images/img-box.png'),
          )
        ],
      ),
    );
  }
}
