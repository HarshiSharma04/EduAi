import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import RandomForestClassifier
import joblib

# Load the dataset
data = pd.read_csv('learning_styles.csv')

# Encode the target variable
label_encoder = LabelEncoder()
data['LearningStyle'] = label_encoder.fit_transform(data['LearningStyle'])

# Split the dataset into features and target variable
X = data.drop('LearningStyle', axis=1)
y = data['LearningStyle']

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train a RandomForestClassifier
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Save the model and label encoder
joblib.dump(model, 'learning_style_model.pkl')
joblib.dump(label_encoder, 'label_encoder.pkl')

# Evaluate the model (optional)
accuracy = model.score(X_test, y_test)
print(f'Model Accuracy: {accuracy * 100:.2f}%')
