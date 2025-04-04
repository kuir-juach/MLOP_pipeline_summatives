import 'package:flutter/material.dart';

class RetrainScreen extends StatefulWidget {
  const RetrainScreen({super.key});

  @override
  State<RetrainScreen> createState() => _RetrainScreenState();
}

class _RetrainScreenState extends State<RetrainScreen> {
  bool _isTraining = false;
  double _trainingProgress = 0;
  String? _trainingResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Model Retraining',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Upload new data and retrain the prediction model to improve accuracy.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            _buildUploadSection(context),
            const SizedBox(height: 20),
            _buildRetrainSection(),
          ],
        ),
      ),
    );
  }

  Card _buildUploadSection(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upload New Dataset',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Upload a CSV file with updated student data including dropout outcomes.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _uploadDataset(context),
              icon: const Icon(Icons.cloud_upload),
              label: const Text('Select CSV File'),
            ),
          ],
        ),
      ),
    );
  }

  Card _buildRetrainSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Retrain Model',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Retrain the prediction model with the latest data to improve accuracy.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            if (_isTraining)
              Column(
                children: [
                  LinearProgressIndicator(value: _trainingProgress),
                  const SizedBox(height: 10),
                  Text(
                      'Training in progress... ${(_trainingProgress * 100).toStringAsFixed(1)}%'),
                ],
              )
            else
              ElevatedButton.icon(
                onPressed: _retrainModel,
                icon: const Icon(Icons.model_training),
                label: const Text('Start Retraining'),
              ),
            if (_trainingResult != null) ...[
              const SizedBox(height: 20),
              Text(
                _trainingResult!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _uploadDataset(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content:
              Text('Dataset upload functionality will be implemented here')),
    );
  }

  void _retrainModel() async {
    setState(() {
      _isTraining = true;
      _trainingProgress = 0;
      _trainingResult = null;
    });

    // Simulate training process
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        _trainingProgress = (i + 1) / 10;
      });
    }

    setState(() {
      _isTraining = false;
      _trainingResult =
          'Model retrained successfully!\nAccuracy improved to 92.3%';
    });
  }
}
