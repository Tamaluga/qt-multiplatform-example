#pragma once

#include "gmock/gmock.h"

#include "IDevice.hpp"

class MockDevice : public IDevice {

public:
    MOCK_METHOD(void, enable, (), (override));
    MOCK_METHOD(void, disable, (), (override));
    MOCK_METHOD(bool, isEnabled, (), (const, override));
    MOCK_METHOD(void, setOutput, (const uint32_t), (override));
    MOCK_METHOD(uint32_t, getOutput, (), (const,override));
};