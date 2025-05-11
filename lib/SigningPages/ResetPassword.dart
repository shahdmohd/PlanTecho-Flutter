import 'package:flutter/material.dart';

class ResetPasswordWidget extends StatefulWidget {
  final String email;
  final String verificationCode;

  const ResetPasswordWidget({
    super.key,
    required this.email,
    required this.verificationCode,
  });

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  // Controllers for the password fields
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  
  // Focus nodes
  FocusNode? passwordFocusNode;
  FocusNode? confirmPasswordFocusNode;
  
  // Password visibility
  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    passwordFocusNode?.dispose();
    confirmPasswordFocusNode?.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Here you would typically send the new password to your backend
    // along with the verification code to confirm identity
    
    // For demonstration, we'll just show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset successfully!'),
        backgroundColor: Color(0xFF0AAD0A),
        duration: Duration(seconds: 3),
      ),
    );
    
    // Navigate back to login screen after successful password reset
    Future.delayed(const Duration(seconds: 2), () {
      // Pop to login screen (adjust navigation as needed for your app structure)
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xCCD5CFCF),
                borderRadius: BorderRadius.circular(24),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(-1, -1),
                child: IconButton(
                  icon: const Icon(
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
          alignment: const AlignmentDirectional(0, -1),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 570,
              ),
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                            fontFamily: 'Enriqueta',
                            color: Color(0xFF026500),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                        child: Text(
                          'Create a new password for ${widget.email}',
                          style: const TextStyle(
                            fontFamily: 'Enriqueta',
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      
                      // Password Field
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: TextFormField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            labelStyle: const TextStyle(
                              fontFamily: 'Enriqueta',
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Enter your new password...',
                            hintStyle: const TextStyle(
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
                              borderSide: const BorderSide(
                                color: Color(0xFF0AAD0A),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey,
                                size: 22,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Enriqueta',
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          cursorColor: const Color(0xFF0AAD0A),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            // Check for at least one uppercase letter
                            if (!value.contains(RegExp(r'[A-Z]'))) {
                              return 'Password must contain at least one uppercase letter';
                            }
                            // Check for at least one number
                            if (!value.contains(RegExp(r'[0-9]'))) {
                              return 'Password must contain at least one number';
                            }
                            // Check for at least one special character
                            if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              return 'Password must contain at least one special character';
                            }
                            return null;
                          },
                        ),
                      ),
                      
                      // Confirm Password Field
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: TextFormField(
                          controller: confirmPasswordController,
                          focusNode: confirmPasswordFocusNode,
                          obscureText: !confirmPasswordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(
                              fontFamily: 'Enriqueta',
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Confirm your new password...',
                            hintStyle: const TextStyle(
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
                              borderSide: const BorderSide(
                                color: Color(0xFF0AAD0A),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => confirmPasswordVisibility = !confirmPasswordVisibility,
                              ),
                              child: Icon(
                                confirmPasswordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey,
                                size: 22,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Enriqueta',
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          cursorColor: const Color(0xFF0AAD0A),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != passwordController!.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      
                      // Password requirements info
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Password must:',
                              style: TextStyle(
                                fontFamily: 'Enriqueta',
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '• Be at least 8 characters',
                              style: TextStyle(
                                fontFamily: 'Enriqueta',
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '• Include at least one uppercase letter (A-Z)',
                              style: TextStyle(
                                fontFamily: 'Enriqueta',
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '• Include at least one number (0-9)',
                              style: TextStyle(
                                fontFamily: 'Enriqueta',
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '• Include at least one special character (!@#\$%^&*)',
                              style: TextStyle(
                                fontFamily: 'Enriqueta',
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Reset Password Button
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                          child: ElevatedButton(
                            onPressed: _resetPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0AAD0A),
                              minimumSize: const Size(double.infinity, 50),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Reset Password',
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
        ),
      ),
    );
  }
}