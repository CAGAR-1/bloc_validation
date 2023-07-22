import 'package:bloc_validation/sign_in/bloc/signin_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController EmailController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();
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
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.Errormessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else
                  return Container();
              },
            ),
            TextField(
              controller: EmailController,
              onChanged: (val) {
                print(EmailController.text);
                BlocProvider.of<SigninBloc>(context).add(SignInTextEvent(
                    EmailController.text, PasswordController.text));
              },
              decoration: InputDecoration(hintText: "Email Address"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: PasswordController,
              onChanged: (val) {
                print(EmailController.text);
                BlocProvider.of<SigninBloc>(context).add(SignInTextEvent(
                    EmailController.text, PasswordController.text));
              },
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                if (state is SigninLoadingState) {
                  return CircularProgressIndicator();
                } else {
                  return Center(
                    child: InkWell(
                        onTap: () {
                          BlocProvider.of<SigninBloc>(context).add(
                              SignInSubmittedEvent(EmailController.text,
                                  PasswordController.text));
                        },
                        child: Container(
                          height: 45,
                          child: Center(
                              child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                              color: (state is SignInValidState
                                  ? Colors.green
                                  : Colors.red),
                              borderRadius: BorderRadius.circular(5)),
                        )),
                  );
                }
              },
            ),
            // ElevatedButton(onPressed: () {}, child: Text("Sign In")),
          ],
        ),
      ),
    );
  }
}
