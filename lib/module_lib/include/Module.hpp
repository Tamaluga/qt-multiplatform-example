#pragma once

#include "IDevice.hpp"
#include <memory>

class Module {

public:
    Module(std::unique_ptr<IDevice> device);
    virtual ~Module() = default;

    void startProcess();

private:
    std::unique_ptr<IDevice> m_Device;
};