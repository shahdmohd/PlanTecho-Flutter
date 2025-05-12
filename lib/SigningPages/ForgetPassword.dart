import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'lib/SigningPages/ResetPasswordWidget.dart';
 import 'ResetPassword.dart' ;
class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  // Controller and focus node for the email text field
  TextEditingController? emailAddressTextController;
  FocusNode? emailAddressFocusNode;
  
  // Controller for verification code
  TextEditingController? verificationCodeController;
  
  // Focus node to unfocus when tapping outside
  final unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailAddressTextController = TextEditingController();
    emailAddressFocusNode = FocusNode();
    verificationCodeController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
    verificationCodeController?.dispose();
    super.dispose();
  }

  // Responsive visibility helper
  bool responsiveVisibility({
    required BuildContext context,
    bool phone = true,
    bool tablet = true,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (!phone && screenWidth < 600) return false;
    if (!tablet && screenWidth >= 600 && screenWidth < 1200) return false;
    return true;
  }

  // Show verification code dialog
  void _showVerificationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter Verification Code',
            style: TextStyle(
              fontFamily: 'Enriqueta',
              color: Color(0xFF026500),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'We sent a 6-digit code to ${emailAddressTextController!.text}. Please enter it below.',
                style: TextStyle(
                  fontFamily: 'Enriqueta',
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: verificationCodeController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  labelText: 'Verification Code',
                  labelStyle: TextStyle(
                    fontFamily: 'Enriqueta',
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xFF0AAD0A),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Resend code logic would go here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('New code sent to your email')),
                );
              },
              child: Text(
                'Resend Code',
                style: TextStyle(
                  fontFamily: 'Enriqueta',
                  color: Color(0xFF0AAD0A),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (verificationCodeController!.text.isEmpty || 
                    verificationCodeController!.text.length != 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid 6-digit code')),
                  );
                  return;
                }
                
                Navigator.of(context).pop();
                _verifyCode(verificationCodeController!.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0AAD0A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Verify',
                style: TextStyle(
                  fontFamily: 'Enriqueta',
                  color: Colors.white,
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }

  // Method to verify the code
  // Method to verify the code
// In the _ForgetPasswordWidgetState class
// Update the _verifyCode method to navigate to the Reset Password page

void _verifyCode(String code) {
  // Here you would typically verify the code with your backend
  // For demonstration, we'll show a success message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Verification successful! Please reset your password.'),
      duration: Duration(seconds: 2),
    ),
  );

  // Navigate to the Reset Password page
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ResetPasswordWidget(
        email: emailAddressTextController!.text,
        verificationCode: code,
      ),
    ),
  );
}

// Make sure to import the ResetPasswordWidget at the top of your file
// Add this import statement at the top of the ForgetPasswordWidget file:
// import 'reset_password_widget.dart';  // Adjust path if necessary

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xCCD5CFCF),
              borderRadius: BorderRadius.circular(24),
              shape: BoxShape.rectangle,
            ),
            child: Align(
              alignment: AlignmentDirectional(-1, -1),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Align(
        alignment: AlignmentDirectional(0, -1),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 570,
            ),
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // This row exists for when the "app bar" is hidden on desktop
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                'Back',
                                style: TextStyle(
                                  fontFamily: 'Enriqueta',
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontFamily: 'Enriqueta',
                        color: Color(0xFF026500),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                    child: Text(
                      'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
                      style: TextStyle(
                        fontFamily: 'Enriqueta',
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: emailAddressTextController,
                        focusNode: emailAddressFocusNode,
                        autofillHints: [AutofillHints.email],
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Your email address...',
                          labelStyle: TextStyle(
                            fontFamily: 'Enriqueta',
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          hintText: 'Enter your email...',
                          hintStyle: TextStyle(
                            fontFamily: 'Enriqueta',
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF0AAD0A),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                        ),
                        style: TextStyle(
                          fontFamily: 'Enriqueta',
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Color(0xFF0AAD0A),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailAddressTextController!.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Email required!'),
                              ),
                            );
                            return;
                          }
                          // Show verification dialog
                          _showVerificationDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0AAD0A),
                          minimumSize: Size(double.infinity, 50),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Send Link',
                          style: TextStyle(
                            fontFamily: 'Enriqueta',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}