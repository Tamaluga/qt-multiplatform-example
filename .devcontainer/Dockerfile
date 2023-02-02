FROM ubuntu:20.04 AS vscodeenv

ENV DEBIAN_FRONTEND=noninteractive
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID
#Install specific devtools
RUN apt-get update && apt-get install --no-install-recommends -y \
    vim \
    wget \
    build-essential \
    sudo \
    git-core \
    ssh \
    cmake \
    ninja-build \
    llvm \
    mesa-common-dev \
    libgl1-mesa-dev \
    gcovr \
    socat \
    # QT
    qt5-default \
    qtbase5-dev \
    qtbase5-dev-tools \
    qttools5-dev \
    qtdeclarative5-dev \
    libqt5svg5-dev  \
    libqt5serialport5-dev \
    libqt5opengl5 \
    qml-module-qtquick2 \
    qml-module-qttest \
    qml-module-qtquick-dialogs \
    qml-module-qtquick-controls \
    qml-module-qtquick-controls2 \
    qml-module-qtquick-window2 \
    qml-module-qtmultimedia \
    qml-module-qtqml-models2 \
    qml-module-qt-labs-folderlistmodel
# Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME 
# Add sudo support for the non-root user
RUN apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME 
# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog