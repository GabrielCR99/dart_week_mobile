import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/mixins/loader_mixin.dart';
import 'package:dart_week_mobile/app/utils/size_utils.dart';
import 'package:dart_week_mobile/app/utils/theme_utils.dart';
import 'package:dart_week_mobile/app/widgets/controle_ja_button.dart';
import 'package:dart_week_mobile/app/widgets/controle_ja_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController>
    with LoaderMixin {
  List<ReactionDisposer> _disposer;

  @override
  void initState() {
    super.initState();
    _disposer ??= [
      // chamou o login, mas não foi feito com sucesso
      reaction((_) => controller.state, (StoreState state) {
        if (state == StoreState.loading) {
          showLoader();
        } else if (state == StoreState.loaded) {
          hiderLoader();
        }
      }),
      //Chamada de serviço mas login e senha errados
      reaction((_) => controller.isLoginSuccess, (success) {
        if (success != null) {
          if (success) {
            Get.offAllNamed('/movimentations');
          } else {
            Get.snackbar('Erro ao realizar login!', 'Login ou senha inválidos!',
                backgroundColor: Colors.white);
          }
        }
      }),
      //erro na requisição
      reaction((_) => controller.errorMessage, (String errorMessage) {
        if (errorMessage.isNotEmpty) {
          Get.snackbar('Erro ao realizar login!', errorMessage,
              backgroundColor: Colors.white);
        }
      })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeader(),
            SizedBox(
              height: 30,
            ),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: controller.globalKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            ControleJaTextFormField(
              label: 'Login',
              onChanged: controller.changeLogin,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Login obrigatório!';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            ControleJaTextFormField(
              label: 'Senha',
              onChanged: controller.changePasswod,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Senha obrigatória!';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            ControleJaButton(
              label: 'Entrar',
              onPressed: () {
                controller.requestLogin();
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
      height: SizeUtils.screenHeight * .5,
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

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
  }
}
