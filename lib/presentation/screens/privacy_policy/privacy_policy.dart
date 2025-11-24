import 'package:flutter/material.dart';

void main() {
  runApp(const PrivacyPolicyApp());
}

class PrivacyPolicyApp extends StatelessWidget {
  const PrivacyPolicyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youppie - Privacy Policy',
      home: PrivacyPolicyScreen(),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF5A908A);
    const Color bgColor = Color(0xFFFFF8E1);
    const Color textColor = Color(0xFF333333);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor, size: 28),
          onPressed: () {
            Navigator.of(
              context,
            ).pop(); // This will return to the previous page (SettingsScreen)
          },
        ),

        centerTitle: true,
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Last Updated: October 26, 2023",
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome to Youppie! This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this privacy policy carefully. If you do not agree with the terms of this privacy policy, please do not access the application.",
                style: TextStyle(color: textColor, fontSize: 15, height: 1.5),
              ),
              SectionTitle("Information We Collect"),
              Text(
                "We may collect information about you in a variety of ways. The information we may collect via the Application includes:",
                style: TextStyle(color: textColor, fontSize: 15, height: 1.5),
              ),
              BulletList([
                "Personal Data: Personally identifiable information, such as your name, shipping address, email address, and telephone number, and demographic information, such as your age, gender, hometown, and interests, that you voluntarily give to us when you register with the Application.",
                "Location Data: We may request access or permission to and track location-based information from your mobile device to provide location-based services like finding nearby vets.",
              ]),
              SectionTitle("How We Use Your Information"),
              Text(
                "Having accurate information about you permits us to provide you with a smooth, efficient, and customized experience. Specifically, we may use information collected about you via the Application to connect you with services, improve the app, and facilitate community features like adoption or lost pet posts.",
                style: TextStyle(color: textColor, fontSize: 15, height: 1.5),
              ),
              SectionTitle("Contact Us"),
              Text(
                "If you have questions or comments about this Privacy Policy, please contact us at:",
                style: TextStyle(color: textColor, fontSize: 15, height: 1.5),
              ),
              SizedBox(height: 8),
              Text(
                "support@youppie.dz",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white.withOpacity(0.9),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        onTap: (_) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: "Vets",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF5A908A),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> items;
  const BulletList(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "• ",
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
