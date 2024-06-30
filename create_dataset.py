import pandas as pd

# Define the data
data = {
    'Question1': [1, 2, 3, 4, 5, 1, 2, 3, 4, 5] * 20,
    'Question2': [5, 4, 3, 2, 1, 5, 4, 3, 2, 1] * 20,
    'Question3': [3, 3, 3, 3, 3, 1, 2, 4, 5, 2] * 20,
    'Question4': [4, 5, 1, 2, 3, 4, 5, 1, 2, 3] * 20,
    'Question5': [2, 1, 4, 5, 3, 2, 1, 4, 5, 3] * 20,
    'LearningStyle': ['Visual', 'Auditory', 'Reading/Writing', 'Kinesthetic', 'Visual',
                      'Auditory', 'Reading/Writing', 'Kinesthetic', 'Visual', 'Auditory'] * 20
}

# Create a DataFrame
df = pd.DataFrame(data)

# Save the DataFrame to a CSV file
df.to_csv('learning_styles.csv', index=False)

print("Dataset created successfully")
