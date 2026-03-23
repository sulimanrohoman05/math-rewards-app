import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: LoadingPage(),
      debugShowCheckedModeBanner: false,
    ));

// Global Style Decoration (Based on your screenshots)
final cardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(25),
  border: Border.all(color: Color(0xFF1B5E20), width: 2), // Dark Green Border
);

final customInput = (String hint) => InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF1B5E20)),
        borderRadius: BorderRadius.circular(15),
      ),
    );

// 1. Loading Page
class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet, size: 80, color: Color(0xFF1B5E20)),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Color(0xFF1B5E20)),
            SizedBox(height: 20),
            Text('Loading Experience...', 
              style: TextStyle(color: Color(0xFF1B5E20), fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

// 2. Login Page
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(30),
          decoration: cardDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Login', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
              Text('Enter your details to continue', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 25),
              TextField(decoration: customInput('Email Address')),
              SizedBox(height: 15),
              TextField(decoration: customInput('Password'), obscureText: true),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1B5E20),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())),
                child: Text('Create a new account', style: TextStyle(color: Color(0xFF1B5E20))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 3. Sign Up Page
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(25),
            decoration: cardDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Sign Up', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
                SizedBox(height: 20),
                TextField(decoration: customInput('Username')),
                SizedBox(height: 12),
                TextField(decoration: customInput('Email Address')),
                SizedBox(height: 12),
                TextField(decoration: customInput('Password (8 digits)')),
                SizedBox(height: 12),
                TextField(decoration: customInput('Confirm Password')),
                SizedBox(height: 12),
                TextField(decoration: customInput('Refer Code (Optional)')),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneVerifyPage())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1B5E20),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 4. Phone Verify Page
class PhoneVerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(30),
          decoration: cardDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Phone Verify', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
              Text('Provide your active phone number', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 30),
              TextField(decoration: customInput('+880 1XXXXXXXXX'), keyboardType: TextInputType.phone),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerifyPage())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1B5E20),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Send OTP', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 5. OTP Verify Page
class OTPVerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(30),
          decoration: cardDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Verify OTP', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
              Text('Verification code sent to your number', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
              SizedBox(height: 30),
              TextField(
                decoration: customInput('6-Digit OTP Code'),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {}, // Next step will lead to Home Page
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1B5E20),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Verify & Finish', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Change Number', style: TextStyle(color: Color(0xFF1B5E20))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}