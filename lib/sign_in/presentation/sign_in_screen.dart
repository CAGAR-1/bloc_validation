import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign in with Email",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.keyboard_backspace,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            const Text(
              "Error will show up here",
              style: TextStyle(color: Colors.red),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Email Address"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 45,
                child: Center(
                    child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            // ElevatedButton(onPressed: () {}, child: Text("Sign In")),
          ],
        ),
      ),
    );
  }
}
