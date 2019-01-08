FROM diuis/docker-emsdk-opencv3-wasm_eigen:v1.0.1

USER root
RUN apt-get update && apt-get install --no-install-recommends -y git && \
    apt-get autoremove && apt-get clean && \
    ln -s /usr/include/eigen3 /usr/local/include/eigen3
USER appuser
ADD ./build_opencv_emscripten.py /home/appuser/
ADD ./build.sh /home/appuser/
SHELL ["/bin/bash", "-c"]
RUN source /home/appuser/emsdk/emsdk_env.sh && \
    mkdir /home/appuser/opencv/build_emscripten && \
    mkdir /home/appuser/opencv_wasm_lux && \
    mkdir /home/appuser/vto_wasm_headtracker && \
    python /home/appuser/build_opencv_emscripten.py --opencv_dir /home/appuser/opencv --install_dir /home/appuser/opencv_wasm_lux --emscripten_dir /home/appuser/emsdk/emscripten/1.38.21 /home/appuser/opencv/build_emscripten