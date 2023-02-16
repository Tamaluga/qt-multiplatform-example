#pragma once

#include <cinttypes>

class IDevice {

public:
    virtual ~IDevice() = default;

    virtual void enable() = 0;
    virtual void disable() = 0;
    virtual bool isEnabled() const = 0;
    virtual void setOutput(const uint32_t value) = 0;
    virtual uint32_t getOutput() const = 0;
};