import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/start_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.selectAnswers, super.key});

  final List<String> selectAnswers;

  @override
  Widget build(BuildContext context) {
    // สมมติว่า "correctAnswers" คือคำตอบที่ถูกต้อง
    List<String> correctAnswers = [
      "'Widgets",
      "By combining widgets in code",
      "'StatelessWidget",
      "The UI is not updated",
      "Update UI as data changes",
      "By calling setState()"
    ]; // ตัวอย่างคำตอบที่ถูกต้อง

    // คำนวณจำนวนคำตอบที่ถูกต้อง
    int correctCount = 0;
    for (int i = 0; i < selectAnswers.length; i++) {
      if (selectAnswers[i] == correctAnswers[i]) {
        correctCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Results"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 4, 16, 255), // สีน้ำเงินเข้ม
              Color.fromARGB(255, 75, 248, 230), // สีฟ้า
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // แสดงผลลัพธ์การทำแบบทดสอบ
              Text(
                "You answered $correctCount out of ${correctAnswers.length} questions correctly!",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // ใช้สีขาวเพื่อให้ข้อความมองเห็นชัด
                ),
              ),
              const SizedBox(height: 20), // เพิ่มระยะห่างระหว่างข้อความและปุ่ม
              // ปุ่ม Restart Quiz
              ElevatedButton.icon(
                onPressed: () {
                  // เมื่อกดปุ่มให้กลับไปยังหน้าจอเริ่มต้น (StartScreen)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
                icon: const Icon(Icons.restart_alt), // ไอคอนสำหรับการรีสตาร์ท
                label: const Text("Restart Quiz"), // ข้อความบนปุ่ม
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
