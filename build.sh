#!/bin/bash

ls -la /vto_wasm_headtracker/
ls -la /vto_wasm_headtracker/src/
cd /vto_wasm_headtracker/src/build/
ls -la ./
/home/appuser/emsdk/emscripten/1.38.21/emcmake cmake -DCMAKE\_BUILD\_TYPE=Release -DOpenCV\_DIR=/home/appuser/opencv_wasm ..
make

