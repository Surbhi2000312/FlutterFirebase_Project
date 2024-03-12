

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/otp_screen.dart';


class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: phoneController,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Phone number",
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                )
              ),
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: () async {
            await FirebaseAuth.instance.verifyPhoneNumber(

              verificationCompleted: (PhoneAuthCredential phoneAuthCredential){},
              verificationFailed: (FirebaseAuthException ex){},
              codeSent: (String verificationId, int? resendToken){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> OTPScreen(verificationId: verificationId,)));
              },
              codeAutoRetrievalTimeout: (String verificationId) {  },
              phoneNumber: phoneController.text.toString(),
            );
            print("radha");
          }, child: Text('Verify Phone Number')),
        ],
      ),
    );
  }
}
