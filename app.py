from flask import Flask, request, jsonify
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

app = Flask(__name__)

# Load the dataset
df = pd.read_csv('learning_styles.csv')

# Preprocess data and train the model (replace with your model training logic)
X = df.drop('LearningStyle', axis=1)
y = df['LearningStyle']

model = RandomForestClassifier()
model.fit(X, y)

@app.route('/predictLearningStyle', methods=['POST'])
def predict_learning_style():
    data = request.get_json()

    # Example data received from Flutter app
    question_data = pd.DataFrame(data, index=[0])

    # Make prediction
    prediction = model.predict(question_data)

    # Respond with predicted learning style
    return jsonify({'learningStyle': prediction[0]})

if __name__ == '__main__':
    app.run(debug=True)
