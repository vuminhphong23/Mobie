import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showError = false;
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    showError = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10), child: Image.asset("images/login.png",width: 300, height: 300,)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F9FD),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF475269).withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 27,
                      color: Color(0xFF475269),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter UserName",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F9FD),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF475269).withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 27,
                      color: Color(0xFF475269),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter PassWord",
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFF475269),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget PassWord",
                    style: TextStyle(
                      color: Color(0XFF475269),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  String username = usernameController.text;
                  String password = passwordController.text;

                  if (username == "admin" && password == "admin") {
                    Navigator.pushReplacementNamed(context, "homePage");
                  } else {
                    setState(() {
                      showError = true;
                    });

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        showError = false;
                      });
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid username or password!!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0XFF475269),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0XFF475269).withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Account? -",
                    style: TextStyle(
                      color: Color(0XFF475269).withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0XFF475269),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
