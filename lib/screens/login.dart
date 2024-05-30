import 'package:flutter/material.dart';
import 'package:movies_app/screens/create_user.dart';
import 'package:movies_app/service/user_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                'assets/logo.svg',
                    semanticsLabel: 'Be Connect Logo',
                ),
                Positioned(
                  left: 8.5,
                  top: 8.5,
                  child: Image.asset(
                    'assets/beeconnect.png',
                    width: 19.65,
                    height: 22.4,
                  ),
                )
              ],
            )
          ],
        )
      ),
      backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 45.0, left: 45.0, bottom: 10.0),
              child: Text(
                'Você Voltou!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 45.0, left: 45.0, bottom: 60.0),
              child: Text(
                'Sentimos sua falta enquanto você\n esteve fora',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 45.0, left: 45.0, bottom: 25.0),
              child: TextField(
                style: const TextStyle(color: Color.fromRGBO(110, 110, 110, 1)),
                keyboardType: TextInputType.name,
                controller: _user,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(44, 44, 44, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide.none
                  ),
                  hintText: 'Digite seu Login',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(110, 110, 110, 1)
                  ),
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    color: Color.fromRGBO(110, 110, 110, 1),
                    size: 30.0
                  ), 
                  contentPadding: EdgeInsets.only(left: 15.0, top: 20.0, bottom: 10.0, right: 15.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 45.0, left: 45.0, bottom: 25.0),
              child: TextField(
                style: const TextStyle(color: Color.fromRGBO(110, 110, 110, 1)),
                keyboardType: TextInputType.text,
                obscureText: true,
                obscuringCharacter: '*',
                controller: _password,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(44, 44, 44, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide.none
                  ),
                  hintText: 'Digite sua Senha',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(110, 110, 110, 1)
                  ),
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Color.fromRGBO(110, 110, 110, 1),
                    size: 30.0
                  ),
                  contentPadding: EdgeInsets.only(left: 15.0, top: 20.0, bottom: 10.0, right: 15.0),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () => makeLogin(_user.text, _password.text, context),
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Color.fromRGBO(255, 191, 21, 1)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Container()
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não tem login? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateUser())),
                      child: const Text(
                        'Clique aqui!',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 191, 21, 1),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromRGBO(255, 191, 21, 1)
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}