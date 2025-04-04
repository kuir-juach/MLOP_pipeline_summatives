import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About EduGuard Predictor',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://via.placeholder.com/400x200?text=Education',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Our mission is to identify students at risk of dropping out early, '
                    'allowing institutions to intervene and provide necessary support. '
                    'Using advanced machine learning models, we analyze various factors '
                    'that contribute to student attrition and provide actionable insights.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Key Features',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _buildFeatureItem(Icons.analytics, 'Accurate Predictions'),
          _buildFeatureItem(Icons.trending_up, 'Early Intervention'),
          _buildFeatureItem(Icons.school, 'Student Support'),
          _buildFeatureItem(Icons.autorenew, 'Continuous Learning'),
        ],
      ),
    );
  }

  Padding _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
