import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loaddash/menu/home.dart';
import 'package:loaddash/simple_ui_controller.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/constants.dart';
import 'package:loaddash/style/style.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String uname = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildLargeScreen(size, simpleUIController);
            } else {
              return _buildSmallScreen(size, simpleUIController);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLargeScreen(Size size, SimpleUIController simpleUIController) {
    return Row(children: [
      Expanded(
        flex: 4,
        child: RotatedBox(
          quarterTurns: 4,
          child: Lottie.asset(
            'images/grid.json',
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(width: size.width * 0.06),
      Expanded(
        flex: 5,
        child: _buildMainBody(
          size,
          simpleUIController,
        ),
      ),
    ]);
  }

  Widget _buildSmallScreen(Size size, SimpleUIController simpleUIController) {
    return Center(
      child: _buildMainBody(
        size,
        simpleUIController,
      ),
    );
  }

  Widget _buildMainBody(Size size, SimpleUIController simpleUIController) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: size.width > 600
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          size.width > 600
              ? Container()
              : Lottie.asset(
                  'images/grid.json',
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Login',
                    style: kLoginTitleStyle(size),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      } else if (value.length < 4) {
                        return 'at least enter 4 characters';
                      } else if (value.length > 13) {
                        return 'maximum character is 13';
                      }
                      uname = value;
                      return uname;
                    }),
                SizedBox(height: size.height * 0.02),
                Obx(() => TextFormField(
                    style: kTextFormFieldStyle(),
                    controller: passwordController,
                    obscureText: simpleUIController.isObscure.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_open),
                      suffixIcon: IconButton(
                        icon: Icon(
                          simpleUIController.isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          simpleUIController.isObscureActive();
                        },
                      ),
                      hintText: 'Password',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 7) {
                        return 'atleast enter 6 characters';
                      } else if (value.length > 13) {
                        return 'maximum character is 13';
                      }
                      return null;
                    })),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                  style: kLoginTermsAndPrivacyStyle(size),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.02),
                loginButton(),
                SizedBox(height: size.height * 0.03),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    nameController.clear();
                    emailController.clear();
                    passwordController.clear();
                    _formKey.currentState?.reset();
                    simpleUIController.isObscure.value = true;
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Dont\'t have an account?',
                        style: kHaveAnAccountStyle(size),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: kLoginOrSignUpTextStyle(size),
                          ),
                        ]),
                  ),
                ),
              ]),
            ),
          ),
        ]);
  }

  Widget loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFFEC7E5D)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          onPressed: () {
            if (nameController.text == 'smitvinod.savla@sjsu.edu') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Home(id: 'Community', view: 'dash')));
            } else if (nameController.text == 'madhur.parakh@sjsu.edu') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Home(id: 'Individual', view: 'House 1')));
            } else if (nameController.text == 'shounak.upadhyay@sjsu.edu') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Home(id: 'Individual', view: 'House 2')));
            } else if (nameController.text == 'wanyu.huang@sjsu.edu') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Home(id: 'Individual', view: 'House 3')));
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Builder(builder: (context) {
                    return const SizedBox(
                      // height: 500,
                      // width: 750,
                      child: Text('Invalid ID or Password'),
                    );
                  }),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: AppColors.primary,
                        padding: const EdgeInsets.all(16.0),
                        child: const PrimaryText(
                          text: 'Close',
                          size: 15,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
