---
layout: post
title: "TensorFlow Notes"
date: 2023-12-18
last_modified_at: 2023-12-18
categories: [deep-learning, tensorflow]
---

A collection of TensorFlow study notes covering basics, neural networks, CNNs, and deployment.

---

## Installing TensorFlow on Mac M1

```bash
brew install miniforge

mkdir tensorflow
cd tensorflow
conda activate env
conda install -c apple tensorflow-deps
python -m pip install tensorflow
python -m pip install tensorflow-metal

conda install jupyter pandas numpy matplotlib scikit-learn
```

---

## TensorFlow Basics
*December 18, 2023*

### Tensor Properties

```python
import tensorflow as tf
import numpy as np

# 1. Axis / ndim
# 2. Shape / .shape
# 3. Type / .dtype
```

### Data Shapes

- **Vector data** — Rank-2 tensors of shape `(samples, features)`, where each sample is a vector of numerical attributes ("features")
- **Timeseries data or sequence data** — Rank-3 tensors of shape `(samples, timesteps, features)`, where each sample is a sequence (of length `timesteps`) of feature vectors
- **Images** — Rank-4 tensors of shape `(samples, height, width, channels)`, where each sample is a 2D grid of pixels, and each pixel is represented by a vector of values ("channels")
- **Video** — Rank-5 tensors of shape `(samples, frames, height, width, channels)`, where each sample is a sequence (of length `frames`) of images

### Dense Layer

```python
keras.layers.Dense(512, activation="relu")
```

```python
import numpy as np

z = x + y
z = np.maximum(z, 0.)
```

### Broadcasting in TensorFlow

Two steps:
1. Broadcast axis is added to smaller tensor to match ndim of larger tensor.
2. Then the smaller tensor is repeated with new axis.

### Tensor Product / Dot Product

### Tensor Reshaping

```python
.reshape
```

### tf.data

```python
data1 = tf.constant([[1, 2, 3], [1, 2, 3]])
print(data1.shape)
# (2, 3)

data2 = tf.constant([1])
print(data2.shape)
# (1,)
```

#### `tf.data.Dataset.from_tensors()` or `tf.data.Dataset.from_tensor_slices()`

```python
tf.data.Dataset.from_tensors([1, 2, 3])
tf.data.Dataset.from_tensor_slices(([1, 2, 3], [1]))  # error: axis not same
```

[Coding TensorFlow YouTube Playlist](https://www.youtube.com/playlist?list=PLQY2H8rRoyvwLbzbnKJ59NkZvQAW9wLbx)

---

*Source: [Notion](https://app.notion.com/p/nsr6/2bc1c8d79a65489aa77b2c842d1a0d1b)*

---

## GradientTape & SGD — Hello World Deep Learning
*December 19, 2023*

### GradientTape

```python
import tensorflow as tf

x = tf.Variable(0.)
with tf.GradientTape() as tape:
    y = 2 * x + 3
grad_of_y_wrt_x = tape.gradient(y, x)
```

### Simple Linear Regression

```python
import numpy as np
import tensorflow as tf

xs = np.array([1, 2, 3, 4, 5, 6, 7], dtype=float)
ys = np.array([1.00, 1.50, 2.00, 2.50, 3.00, 3.50, 4.00], dtype=float)
```

#### 1. Build the model

```python
model = tf.keras.Sequential([keras.layers.Dense(units=1, input_shape=[1])])
```

#### 2. Compile the model

```python
model.compile(optimizer="sgd", loss="mean_squared_error")
```

#### 3. Train the model

```python
model.fit(xs, ys, epochs=500)
```

#### 4. Predict

```python
model.predict([10])
```

---

## Tensor & Keras Basics
*December 20, 2023*

1. **Tensor** is like NumPy but also runs on CPU, GPU, TPU.
2. **Keras** is the API.

---

## Layer Shape Rules
*December 21, 2023*

1. The first layer in your network should be the same shape as your data.
2. The number of neurons in the last layer should match the number of classes you are classifying for. In this case it's the digits 0-9, so there are 10 of them, hence you should have 10 neurons in your final layer.

---

## Callbacks & Rule of Thumb
*December 26, 2023*

### Custom Callback

```python
class myCallback(tf.keras.callbacks.Callback):
    def on_epoch_end(self, epoch, logs={}):
        if logs.get('accuracy') >= 0.3:
            print("\nReached 60% accuracy so cancelling training!")
            self.model.stop_training = True

callbacks = myCallback()

fmnist = tf.keras.datasets.fashion_mnist
(training_images, training_labels), (test_images, test_labels) = fmnist.load_data()

training_images = training_images / 255.0
test_images = test_images / 255.0

model = tf.keras.models.Sequential([
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dense(512, activation=tf.nn.relu),
    tf.keras.layers.Dense(10, activation=tf.nn.softmax)
])

model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
model.fit(training_images, training_labels, epochs=5, callbacks=[callbacks])
```

### Rule of Thumb

Increasing number of neurons/units in layers will take more calculations and it doesn't mean always more is better — hits the law of diminishing returns quickly.

---

## CNN & ConvNet
*December 27, 2023*

### Convolutions

Convolutions are used to isolate features and can make training faster.

### Pooling

Pooling reduces the image size while maintaining features. Move over pixels 4 at a time and pick the largest pixel which will reduce the image size.

```python
tf.keras.layers.Dense()
tf.keras.layers.Conv2D()
tf.keras.layers.MaxPooling2D()
```

[Conv2D Documentation](https://www.tensorflow.org/api_docs/python/tf/keras/layers/Conv2D)
[MaxPooling2D Documentation](https://www.tensorflow.org/api_docs/python/tf/keras/layers/MaxPooling2D)

Example: reducing the size of image with 32 filters of 3x3 size

```python
tf.keras.layers.Conv2D(32, (3, 3), activation='relu', input_shape=(28, 28, 1)),
```

And then pooling:

```python
tf.keras.layers.MaxPooling2D(2, 2)
```

(2x2 = 4 means picking 1 pixel from 4)

### CNN Reshape
*December 28, 2023*

```python
reshape(60000, 28, 28, 1)
```

Here `1` means for grayscale and for RGB value is `3`.

---

## Pre-trained Models (Xception, load_img)
*December 29, 2023*

```python
from tensorflow.keras.preprocessing.image import load_img
```

Keras applications pre-trained models: [https://keras.io/api/applications/](https://keras.io/api/applications/)

```python
from tensorflow.keras.applications.xception import preprocess_input
from tensorflow.keras.applications.xception import Xception
from tensorflow.keras.applications.xception import decode_predictions

m = Xception(input_shape=(299, 299, 3))
y = preprocess_input(y)
out = m.predict([y])
decode_predictions(out)
```

---

## Horse or Human Classification
*December 31, 2023*

### ImageDataGenerator API

If images are given with different sizes and poses:

```python
from tensorflow.keras.preprocessing.image import ImageDataGenerator

# All images will be rescaled by 1./255
train_datagen = ImageDataGenerator(rescale=1/255)

# Flow training images in batches of 128 using train_datagen generator
train_generator = train_datagen.flow_from_directory(
    './horse-or-human/',  # This is the source directory for training images
    target_size=(300, 300),  # All images will be resized to 300x300
    batch_size=128,
    # Since we use binary_crossentropy loss, we need binary labels
    class_mode='binary')
```

---

## Train / Validation / Test Data & Metrics
*January 8, 2024*

- Train Data
- Valid Data
- Test Data

### Metrics

```python
errors = forecasts - actual
mse = np.square(errors).mean()
rmse = np.sqrt(mse)
mae = np.abs(errors).mean()
mape = np.abs(errors / x_valid).mean()
```

---

## TFLite
*January 10, 2024*

- [Convert models](https://www.tensorflow.org/lite/models/convert/convert_models)
- [Colab Notebook](https://colab.research.google.com/drive/1NLNgzFCSKcezgzr0MRWPUTNRUbZ83PgY#scrollTo=h2pa90OtyyYJ&uniqifier=1)

---

## Extra Resources

### Keras Image Helper
*January 12, 2024*

[https://github.com/alexeygrigorev/keras-image-helper](https://github.com/alexeygrigorev/keras-image-helper)


[Notion](https://app.notion.com/p/nsr6/2bc1c8d79a65489aa77b2c842d1a0d1b)
