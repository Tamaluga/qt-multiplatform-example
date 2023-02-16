#include "Module.hpp"
#include "MockDevice.hpp"

#include "gmock/gmock.h"
#include "gtest/gtest.h"

//===================================================================
// Test Class Implementation
//===================================================================
class ModuleUnitTest : public testing::Test
{
public:
    void SetUp() override
    {
        // Prepare things
    }

    void TearDown() override
    {
        // Tear down things
    }
};

//===================================================================
// Testcases Implementation
//===================================================================

// Demonstrate of how mocks can be used.

TEST_F(ModuleUnitTest, isEnable_shouldReturnFalseAfterCreation)
{
    // Given
    auto mockDevice = std::make_unique<MockDevice>();
    auto mockDeviceRawPtr = mockDevice.get();
    Module module(std::move(mockDevice));

    // Then
    EXPECT_CALL(*mockDeviceRawPtr, enable());
    EXPECT_CALL(*mockDeviceRawPtr, setOutput(100));

    // When
    module.startProcess();
}