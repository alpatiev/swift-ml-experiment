import numpy as np
import coremltools
from sklearn.linear_model import LinearRegression

# Generate some example data
X = np.array([[i] for i in range(100)])
y = 2 * X + 3

# Train the model
model = LinearRegression()
model.fit(X, y)

# Convert to Core ML model
coreml_model = coremltools.converters.sklearn.convert(model, ["input"], "output")
coreml_model.save("Models/LinearRegression.mlmodel")