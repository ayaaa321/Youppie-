import 'package:flutter/material.dart';

void main() {
  runApp(const TermsOfServiceApp());
}

class TermsOfServiceApp extends StatelessWidget {
  const TermsOfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youppie - Terms of Service',
      home: TermsOfServiceScreen(),
    );
  }
}

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF5B928C);
    const Color bgColor = Color(0xFFFFF8E1);
    const Color textColor = Color(0xFF333333);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor, size: 28),
          onPressed: () {},
        ),
        title: const Text(
          "Terms of Service",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              )
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Introduction
              SectionTitle("1. Introduction"),
              SectionText(
                "Welcome to Youppie. These terms and conditions outline the rules and regulations for the use of Youppie's mobile application, designed for Algerian pet owners. By accessing this app, we assume you accept these terms and conditions. Do not continue to use Youppie if you do not agree to all of the terms and conditions stated on this page.",
              ),

              // 2. User Responsibilities
              SectionTitle("2. User Responsibilities"),
              SectionText(
                "You are responsible for your account and its security. You must provide accurate information and are prohibited from using the app for any illegal or unauthorized purpose. This includes respecting intellectual property rights and not harassing other users.",
              ),

              // 3. Content Ownership
              SectionTitle("3. Content Ownership"),
              SectionText(
                "You retain all ownership rights to the content you post on Youppie, such as adoption listings, community posts, or photos of your pets. However, by posting content, you grant Youppie a worldwide, non-exclusive, royalty-free license to use, reproduce, and display that content in connection with the service.",
              ),
              BulletList([
                "You are responsible for the content you submit.",
                "Do not post content that is illegal, offensive, or infringes on others' rights.",
                "Youppie reserves the right to remove any content that violates these terms.",
              ]),

              // 4. Limitation of Liability
              SectionTitle("4. Limitation of Liability"),
              SectionText(
                "Youppie provides a platform to connect pet owners but is not responsible for the actions of its users, the accuracy of vet listings, or the outcome of adoptions. We are not liable for any direct or indirect damages arising from your use of the app.",
              ),

              // 5. Termination
              SectionTitle("5. Termination"),
              SectionText(
                "We may terminate or suspend your account at any time, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.",
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
        showUnselectedLabels: true,
        currentIndex: 3,
        onTap: (_) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: "Vets"),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// === Reusable Widgets ===

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF5B928C),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;
  const SectionText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF333333),
          fontSize: 15,
          height: 1.5,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "• ",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        e,
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
