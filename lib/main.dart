import 'package:flutter/material.dart';

void main() {
  runApp(const CamConnect());
}

class CamConnect extends StatelessWidget {
  const CamConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController codeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10131C),
      appBar: AppBar(
        title: const Text("Cam Connect"),
        centerTitle: true,
        backgroundColor: const Color(0xFF161B29),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.videocam,
              size: 90,
              color: Colors.blueAccent,
            ),

            const SizedBox(height: 20),

            const Text(
              "اتصال بالكاميرا",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: codeController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "أدخل رمز الهاتف الآخر",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (codeController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("أدخل رمز الاتصال أولاً"),
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("سيتم تجهيز طلب الاتصال"),
                    ),
                  );
                },
                icon: const Icon(Icons.link),
                label: const Text("اتصال بالهاتف الآخر"),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "يجب موافقة صاحب الهاتف الآخر لبدء البث",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}