#!/bin/bash

cd /wasm_sources/repo/src/build
ls -la ./
/emsdk/emscripten/1.38.21/emcmake cmake -DCMAKE\_BUILD\_TYPE=Release -DOpenCV\_DIR=/opencv_wasm ..
