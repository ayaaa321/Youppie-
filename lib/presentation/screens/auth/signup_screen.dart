import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';


class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  String? _selectedCity;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuCDUgH6i2zaT060Z71rOvZrSktikB0pPER0ziCeW9VVpMmdubvXlYOcyyJctSyhbxZHXyLm5OBInKmnTy2iyS79ADhy9LQxIJikXS_ksbjr3bly4A-UQCF8e0GCnkZw5iQa6dwCQxie9mofpMGAoNi-y8KHb3IeiIR7Y5UANR0HuDM23b_be00z9lnm3HCbjpX5CP9HSG_m0iFJJoO1KGtJYCkh6aqU0j2prY_CtbXxRtwh62ksKj74IqDC-KujlFmGFsD4JvlJCGM",
                ),
              ),
              const SizedBox(height: 30),

              // Title
              Text(
                'Create Account',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 30),

              // Username / Email
              _buildLabel("Username/Email"),
              _buildTextField(
                controller: _emailController,
                hintText: "Enter your username or email",
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // Password
              _buildLabel("Password"),
              _buildPasswordField(
                controller: _passwordController,
                hintText: "Enter your password",
                visible: _passwordVisible,
                onVisibilityToggle: () =>
                    setState(() => _passwordVisible = !_passwordVisible),
              ),

              const SizedBox(height: 20),

              // Confirm Password
              _buildLabel("Confirm Password"),
              _buildPasswordField(
                controller: _confirmPasswordController,
                hintText: "Confirm your password",
                visible: _confirmPasswordVisible,
                onVisibilityToggle: () => setState(
                  () => _confirmPasswordVisible = !_confirmPasswordVisible,
                ),
              ),

              const SizedBox(height: 20),

              // City
              _buildLabel("City"),
              _buildCityDropdown(),

              const SizedBox(height: 30),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Divider
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Or sign up with",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 20),

              // Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/facebook.png",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    "assets/images/google.png",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: AppColors.black),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.white,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.green, width: 2),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool visible,
    required VoidCallback onVisibilityToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: !visible,
      style: TextStyle(color: AppColors.black),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.white,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.green, width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            visible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.grey,
          ),
          onPressed: onVisibilityToggle,
        ),
      ),
    );
  }

  Widget _buildCityDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.lightGreen),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCity,
          hint: const Text("Select your city"),
          isExpanded: true,
          onChanged: (value) => setState(() => _selectedCity = value),
          items: const [
            DropdownMenuItem(value: "Algiers", child: Text("Algiers")),
            DropdownMenuItem(value: "Oran", child: Text("Oran")),
            DropdownMenuItem(value: "Constantine", child: Text("Constantine")),
            DropdownMenuItem(value: "Annaba", child: Text("Annaba")),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String imageUrl) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(child: Image.network(imageUrl, height: 28, width: 28)),
      ),
    );
  }
}
