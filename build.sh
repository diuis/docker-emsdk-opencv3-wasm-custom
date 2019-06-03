#!/bin/bash

ls -la /home/appuser/vto_wasm_headtracker/
ls -la /home/appuser/vto_wasm_headtracker/src/
cd /home/appuser/vto_wasm_headtracker/src/build/
ls -la ./
/home/appuser/emsdk/emscripten/1.38.31/emcmake cmake -DCMAKE\_BUILD\_TYPE=Release -DOpenCV\_DIR=/home/appuser/opencv_wasm ..
make

