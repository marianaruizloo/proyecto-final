//Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Project
import 'package:my_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isButtonEnable = false;
  String email = "mariana@gmail.com";
  String password = "123";

  String inputEmail = "";
  String inputPassword = "";

  void route() {
    if (email == inputEmail && password == inputPassword) {
      final route = MaterialPageRoute(builder: (_) {
        return HomePage();
      });
      Navigator.push(context, route);
    }
  }

  @override
  void initState() {
    isButtonEnable = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xff3b5ba6),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Image.asset("assets/poke-logo.jpg"),
                    ),
                    Container(
                      width: 320,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1E6FF),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextField(
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            CupertinoIcons.person,
                            color: Color(0xFF6F35A5),
                          ),
                          labelText: "Correo",
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                        ),
                        onChanged: (String texto) {
                          inputEmail = texto;
                          if (inputEmail.length > 0) {
                            isButtonEnable = true;
                            setState(() {});
                          } else {
                            isButtonEnable = false;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 320,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1E6FF),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextField(
                        autocorrect: false,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            CupertinoIcons.lock,
                            color: Color(0xFF6F35A5),
                          ),
                          labelText: "Contraseña",
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                        ),
                        onChanged: (texto) {
                          inputPassword = texto;
                          if (inputPassword.length > 0) {
                            isButtonEnable = true;
                            setState(() {});
                          } else {
                            isButtonEnable = false;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Text(
                            isButtonEnable ? "Ir a Pokedex" : "Deshabilitado",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color(0xFFffcb05),
                          onPressed: isButtonEnable ? route : null,
                          disabledColor: Colors.yellowAccent.withOpacity(0.5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "¿Olvidaste tu contraseña?",
                      style: TextStyle(
                        color: Color(0xFFffcb05),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
