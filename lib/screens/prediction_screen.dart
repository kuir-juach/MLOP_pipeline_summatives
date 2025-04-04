import 'package:flutter/material.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _currentGrade = 0;
  double _familyIncome = 0;
  int _disciplinaryRecords = 0;
  double _attendanceRate = 0;
  int _failedCourses = 0;
  String? _predictionResult;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Student Dropout Prediction',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter student details to predict dropout risk:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Current Grade (0-100)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: _validateGrade,
              onSaved: (value) => _currentGrade = double.parse(value!),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Family Income Level (0-10)',
                border: OutlineInputBorder(),
                helperText: '0 = Lowest, 10 = Highest',
              ),
              keyboardType: TextInputType.number,
              validator: _validateIncome,
              onSaved: (value) => _familyIncome = double.parse(value!),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Number of Disciplinary Records',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: _validateRecords,
              onSaved: (value) => _disciplinaryRecords = int.parse(value!),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Attendance Rate (0-100)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: _validateAttendance,
              onSaved: (value) => _attendanceRate = double.parse(value!),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Number of Failed Courses',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: _validateFailedCourses,
              onSaved: (value) => _failedCourses = int.parse(value!),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _predictDropout,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('PREDICT DROPOUT RISK'),
            ),
            const SizedBox(height: 30),
            if (_predictionResult != null)
              Card(
                color: _predictionResult!.contains('High')
                    ? Colors.red[100]
                    : _predictionResult!.contains('Medium')
                        ? Colors.orange[100]
                        : Colors.green[100],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _predictionResult!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String? _validateGrade(String? value) {
    if (value == null || value.isEmpty) return 'Please enter current grade';
    final grade = double.tryParse(value);
    if (grade == null || grade < 0 || grade > 100) {
      return 'Please enter a valid grade (0-100)';
    }
    return null;
  }

  String? _validateIncome(String? value) {
    if (value == null || value.isEmpty) return 'Please enter income level';
    final income = double.tryParse(value);
    if (income == null || income < 0 || income > 10) {
      return 'Please enter a valid income level (0-10)';
    }
    return null;
  }

  String? _validateRecords(String? value) {
    if (value == null || value.isEmpty) return 'Please enter number of records';
    final records = int.tryParse(value);
    if (records == null || records < 0) return 'Please enter a valid number';
    return null;
  }

  String? _validateAttendance(String? value) {
    if (value == null || value.isEmpty) return 'Please enter attendance rate';
    final rate = double.tryParse(value);
    if (rate == null || rate < 0 || rate > 100) {
      return 'Please enter a valid rate (0-100)';
    }
    return null;
  }

  String? _validateFailedCourses(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter number of failed courses';
    }
    final failed = int.tryParse(value);
    if (failed == null || failed < 0) return 'Please enter a valid number';
    return null;
  }

  void _predictDropout() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final riskScore = _calculateRiskScore();
      setState(() {
        _predictionResult = _getRiskMessage(riskScore);
      });
    }
  }

  double _calculateRiskScore() {
    double score = 0;
    score += (100 - _currentGrade) * 0.3;
    score += (10 - _familyIncome) * 4;
    score += _disciplinaryRecords * 5;
    score += (100 - _attendanceRate) * 0.4;
    score += _failedCourses * 8;
    return score.clamp(0, 100);
  }

  String _getRiskMessage(double score) {
    if (score > 70) {
      return 'High Risk of Dropout (${score.toStringAsFixed(1)}%)';
    }
    if (score > 40) {
      return 'Medium Risk of Dropout (${score.toStringAsFixed(1)}%)';
    }
    return 'Low Risk of Dropout (${score.toStringAsFixed(1)}%)';
  }
}
