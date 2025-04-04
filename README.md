STUDENT DROPOUT PREDICTION
![image alt](https://github.com/kuir-juach/MLOP_pipeline_summatives/blob/main/Screenshot%202025-04-04%20205721.png) ![image alt]() ![image alt]()

A machine learning API built with FastAPI that predicts student dropout risk based on academic and demographic factors. This system helps educational institutions identify at-risk students early for timely intervention.

## KEY FEATURES

- Predictive Analytics: Machine learning model trained on historical student data
- RESTful API: Easy integration with existing systems
- Interactive Docs: Built-in Swagger UI and ReDoc documentation
- Scalable: Designed for educational institutions of all sizes
- Privacy-Focused: Secure data handling practices

## QUICK START

Prerequisites:

- Python 3.8+
- pip package manager

Installation:

1. Clone the repository:
   https://github.com/kuir-juach/MLOP_pipeline_summatives/tree/main
2. Create and activate virtual environment:
   python -m venv venv

   # Linux/MacOS:

   source venv/bin/activate

   # Windows:

   .\venv\Scripts\activate

3. Install dependencies:
   pip install -r requirements.txt

Running the API:
uvicorn app.main:app --reload

The API will be available at http://localhost:8000

## API ENDPOINTS

/predict (POST) - Make dropout predictions
/retrain (POST) - Retrain model with new data
/docs (GET) - Interactive API documentation
/redoc (GET) - Alternative documentation

## MODEL DETAILS

Architecture: Neural Network with 3 hidden layers
Accuracy: 89.2% on test data
Features Used: 35 academic and demographic factors
Training Data: 10,000+ student records

## DEVELOPMENT

Project Structure:

.
├── app/
│ ├── main.py # FastAPI application
│ ├── model/ # ML model code
│ │ ├── prediction.py # Prediction logic
│ │ └── retraining.py # Model training
│ └── saved_models/ # Trained models
├── data/ # Sample datasets
├── tests/ # Test cases
└── requirements.txt # Dependencies

Environment Variables:
Create a .env file with:
DATABASE_URL=your_database_connection_string
MODEL_PATH=app/saved_models/nn_model.h5
DEBUG=True

LINK TO DEMO VIDEO
https://youtu.be/eCl704RgdEw?si=LF4FLn4Q5yZIOB3C

APK file
https://drive.google.com/drive/folders/1G8LqicRV9CHUQInM3WKXyd8GaJrzP8rR?usp=drive_link


# dropout_predictor

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
