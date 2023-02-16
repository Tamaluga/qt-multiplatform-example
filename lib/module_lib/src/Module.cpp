#include "Module.hpp"

Module::Module(std::unique_ptr<IDevice> device)
    :m_Device(std::move(device))
{}

void Module::startProcess()
{
    m_Device->enable();
    m_Device->setOutput(100);
}