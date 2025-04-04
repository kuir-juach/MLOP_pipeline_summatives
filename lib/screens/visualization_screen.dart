import 'package:flutter/material.dart';

class VisualizationScreen extends StatelessWidget {
  const VisualizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Visualizations'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildVisualizationCard(
            title: 'Dropout Risk Distribution',
            imageUrl: 'https://i.imgur.com/JQzF1wP.png', // Pie chart
            description:
                'Distribution of students across different risk levels',
          ),
          const SizedBox(height: 20),
          _buildVisualizationCard(
            title: 'Academic Performance Trends',
            imageUrl: 'https://i.imgur.com/vKZQwWm.png', // Line chart
            description: 'Performance trends correlated with dropout risk',
          ),
          const SizedBox(height: 20),
          _buildVisualizationCard(
            title: 'Key Predictive Factors',
            imageUrl: 'https://i.imgur.com/pLQxWzX.png', // Bar chart
            description: 'Features with highest impact on dropout prediction',
          ),
        ],
      ),
    );
  }

  Widget _buildVisualizationCard({
    required String title,
    required String imageUrl,
    required String description,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 220,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
