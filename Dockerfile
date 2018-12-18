FROM diuis/docker-emsdk-opencv3-wasm_eigen:v1.0.0

# RUN  cd ~ \
#         && wget https://github.com/Kitware/CMake/releases/download/v3.12.4/cmake-3.12.4.tar.gz \
#         && tar -xzf cmake-3.12.4.tar.gz \
#         && cd cmake-3.12.4 \
#         && mkdir build \
#         && cd build \
#         && ../bootstrap -- -DCMAKE_BUILD_TYPE:STRING=Release \
#         && make -j2 \
#         && make install \
#         && cd ~ \
#         && rm -rf cmake-3.12.4 \
#         && rm cmake-3.12.4.tar.gz
USER root
RUN apt-get update && apt-get install --no-install-recommends -y git && \
    apt-get autoremove && apt-get clean && \
    ln -s /usr/local/include/eigen3 /usr/include/eigen3
USER appuser
ADD ./build_opencv_emscripten.py /home/appuser/
SHELL ["/bin/bash", "-c"]
RUN source /home/appuser/emsdk/emsdk_env.sh && \
    mkdir /home/appuser/opencv/build_emscripten && \
    mkdir /home/appuser/opencv_wasm_lux && \
    python /home/appuser/build_opencv_emscripten.py --opencv_dir /home/appuser/opencv --install_dir /home/appuser/opencv_wasm_lux --emscripten_dir /home/appuser/emsdk/emscripten/1.38.21 /home/appuser/opencv/build_emscripten

ADD ./build.sh /home/appuser/
SHELL ["/bin/bash", "-c"]