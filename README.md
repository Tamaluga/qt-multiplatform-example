# qt-multiplatform-example
## Project structure

The project folder structure is as follows:

```
.
├── .cmake                  # Helper files for the cmake build system
├── external                # Folder contains external libraries
├── lib                     # Static linked libraries used by the project and integration tests
│   └── exampleLib          # Specific library
│       ├── include         # Contains the public interface / headers of the library
│       ├── src             # Contains the private header and source files
│       └── test            # Contains unit tests and mocks for the library classes
├── projects                # Projects folder
│   ├── firmware            # Project for the firmware. Will be linked against the needed libraries in lib
│   |   └── src             # Contains amongst others the main.cpp file for the firmware
│   └── integrationtests    # Projects for integration tests
│       └── src             # Contains amongst others the main.cpp file for the integration test
├── scripts                 # Tools and utilities
└── README.md
```

## Building

### By script

The `build.sh` script should be used for building the software.

```sh
$ bash build.sh          # build all
$ bash build.sh -c       # clean build
$ bash build.sh -x       # build build all for ARM (cross-compiling)
$ bash build.sh -a       # build app for x86 (native build)
$ bash build.sh -i -x    # build integration tests lib for ARM (cross-compiling)
```

The full range of build commands can be displayed with the help option:

```sh
$ bash build.sh -h
```

### By vs code buttons

The project can be built by the options in the blue menu bar on the bottom of vs code.

1. Choose the cmake-kit. Valid options:
    - x86_64-linux-gcc-toolchain
    - arm-phytec-linux-gnueabi-gcc-toolchain
2. Choose build type. Valid options:
    - Debug
    - Release
3. (Optional) Choose the target to build: default=`[all]`
4. Start build with hitting the `build` button

### By Qt Creator

1. Setup the build kits for the Qt Creator:
    - Execute: `./.qtcreator/setup-qtcreator-kits.sh`
2. Start Qt Creator
3. Go to `File/Open a new File or Project...` and choose the top level `CMakeLists.txt` file.
   The Project loads and is ready to build.

### cross-compiling (ARM toolchain)

When cross-compiling (`-x` option), it is assumed that the ARM toolchain
has been previously activated. Otherwise the script will complain.

[The ARM toolchain](https://download.phytec.de/Software/Linux/BSP-Yocto-i.MX6/BSP-Yocto-i.MX6-PD20.1.0/sdk/yogurt/phytec-yogurt-glibc-x86_64-phytec-qt5demo-image-cortexa9t2hf-neon-toolchain-BSP-Yocto-i.MX6-PD20.1.0.sh)
must be downloaded and installed. Assuming it is installed in `/opt/phytec-yogurt/`.
