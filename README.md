STUDENT DROPOUT PREDICTION 
=============================

A machine learning API built with FastAPI that predicts student dropout risk based on academic and demographic factors. This system helps educational institutions identify at-risk students early for timely intervention.

KEY FEATURES
------------
- Predictive Analytics: Machine learning model trained on historical student data
- RESTful API: Easy integration with existing systems
- Interactive Docs: Built-in Swagger UI and ReDoc documentation
- Scalable: Designed for educational institutions of all sizes
- Privacy-Focused: Secure data handling practices

QUICK START
-----------

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

API ENDPOINTS
-------------
/predict (POST) - Make dropout predictions
/retrain (POST) - Retrain model with new data
/docs (GET) - Interactive API documentation
/redoc (GET) - Alternative documentation

MODEL DETAILS
-------------
Architecture: Neural Network with 3 hidden layers
Accuracy: 89.2% on test data
Features Used: 35 academic and demographic factors
Training Data: 10,000+ student records

DEVELOPMENT
-----------

Project Structure:
.
├── app/
│   ├── main.py             # FastAPI application
│   ├── model/              # ML model code
│   │   ├── prediction.py   # Prediction logic
│   │   └── retraining.py   # Model training
│   └── saved_models/       # Trained models
├── data/                   # Sample datasets
├── tests/                  # Test cases
└── requirements.txt        # Dependencies

Environment Variables:
Create a .env file with:
DATABASE_URL=your_database_connection_string
MODEL_PATH=app/saved_models/nn_model.h5
DEBUG=True

LINK TO DEMO VIDEO

