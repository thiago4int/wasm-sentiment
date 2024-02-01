# IMDb Sentiment Analysis with TensorFlow Lite and WebAssembly

This project demonstrates how to deploy a sentiment analysis model trained on the IMDb dataset using TensorFlow Lite and WebAssembly (WASM), served through a simple web interface. It leverages the power of WebAssembly to run TensorFlow Lite models directly in the browser, offering an efficient, scalable, and serverless approach to machine learning inference.

## Project Structure
```
wasm-sentiment/
├── Dockerfile                # Docker configuration file
├── model.tflite              # TensorFlow Lite model file
├── webapp/                   # Directory for web application files
│   ├── index.html            # HTML file for the web interface
│   ├── script.js             # JavaScript file for model inference
│   └── style.css             # CSS file for styling the web interface
└── wasm/                     # Directory for WASM-related C++ source code
    └── wasm-model.cpp        # C++ source file for model inference
```

## How to Use

1. **Build the Docker Image:**

```bash
docker build -t sentiment-analysis-wasm .
```

2. **Run the Docker Container:**

```
docker run -p 8080:80 sentiment-analysis-wasm
```

3. **Access the Web Interface:**

The application is containerized and ready for deployment to Google Cloud Run or any other container-orchestrated environment that supports Docker.

