import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_frontend_view_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class CardStyle extends StatelessWidget {
  const CardStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.indigo.shade900,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //Navigator.pushNamed(context, "/frontend_view");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Frontend_View_ofproduct();
          }));
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        //iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          ElevatedButton.icon(
              onPressed: null,
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text(''))
        ],
      ),
      body: Center(
        child: Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.teal,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.left / 10,
              left: 10,
              right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Card(
                elevation: 0,
                color: Colors.transparent,
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text('Evyan Shop',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900, fontSize: 40)),
                  ),
                ),
              ),
              SizedBox(
                height: 155.0,
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbmcLABkbNcPjim948pQgHHJroUCUS2-OK2A&usqp=CAU",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 45.0,
              ),
              emailField,
              const SizedBox(height: 25.0),
              passwordField,
              const SizedBox(
                height: 45.0,
                width: 55.0,
              ),
              loginButton,
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
