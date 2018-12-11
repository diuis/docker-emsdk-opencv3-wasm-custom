#!/bin/bash

cd /vto_wasm_headtracker/src/build/
ls -la ./
/emsdk/emscripten/1.38.21/emcmake cmake -DCMAKE\_BUILD\_TYPE=Release -DOpenCV\_DIR=/opencv_wasm ..
