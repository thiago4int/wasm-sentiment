# Stage 1: Compile WASM module using Emscripten
FROM trzeci/emscripten:latest as wasm-builder

# Copy the C++ source code
WORKDIR /src
COPY wasm/wasm-model.cpp .

# Compile the C++ code into WASM and JavaScript glue code
RUN em++ wasm-model.cpp -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s "EXTRA_EXPORTED_RUNTIME_METHODS=['cwrap', 'ccall']" -o wasm-model.js

# Stage 2: Set up the web server with Nginx to serve the webapp and WASM module
FROM nginx:alpine

# Copy the web application files
COPY webapp/ /usr/share/nginx/html/

# Copy the compiled WASM and JavaScript files from the previous stage
COPY --from=wasm-builder /src/wasm-model.wasm /usr/share/nginx/html/
COPY --from=wasm-builder /src/wasm-model.js /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx and serve the content
CMD ["nginx", "-g", "daemon off;"]



