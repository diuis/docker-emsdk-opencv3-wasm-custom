#!/bin/bash

ls -la /vto_wasm_headtracker/
ls -la /vto_wasm_headtracker/src/
mkdir /vto_wasm_headtracker/src/build/
cd /vto_wasm_headtracker/src/build/
ls -la ./
/emsdk/emscripten/1.38.21/emcmake cmake -DCMAKE\_BUILD\_TYPE=Release -DOpenCV\_DIR=/opencv_wasm ..
