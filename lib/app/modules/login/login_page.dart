import 'package:dart_week_mobile/app/utils/size_utils.dart';
import 'package:dart_week_mobile/app/utils/theme_utils.dart';
import 'package:dart_week_mobile/app/widgets/controle_ja_button.dart';
import 'package:dart_week_mobile/app/widgets/controle_ja_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ControleJaButton(
              label: 'Entrar',
              onPressed: () {
                Get.toNamed('/movimentations');
              },
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/login/signup'),
              child: Text(
                'Cadastre-se!',
                style: TextStyle(
                  color: ThemeUtils.primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: ThemeUtils.primaryColor,
      height: SizeUtils.screenHeight * .5 - SizeUtils.statusBarHeight,
      width: SizeUtils.screenWidth,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 80,
            height: 290,
            child: Image.asset('assets/images/img-box.png'),
          )
        ],
      ),
    );
  }
}
