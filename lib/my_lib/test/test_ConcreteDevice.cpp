#include <gtest/gtest.h>

#include "ConcreteDevice.hpp"

//===================================================================
// Test Class Implementation
//===================================================================
class ConcreteDeviceUnitTest : public testing::Test
{
public:
    void SetUp() override
    {
        // Mock creation
        // SomeMock_createStrict();
    }

    void TearDown() override
    {
        // Reset mocks
        // pSomeMock.reset();
    }
};

//===================================================================
// Testcases Implementation
//===================================================================
// Demonstrate some basic assertions.

TEST_F(ConcreteDeviceUnitTest, isEnable_shouldReturnFalseAfterCreation) {
  
  // Given
  ConcreteDevice concreteDevice;

  // Then
  EXPECT_FALSE(concreteDevice.isEnabled());
}

TEST_F(ConcreteDeviceUnitTest, isEnable_shouldReturnTrueWhenIsEnabled) {
  
  // Given
  ConcreteDevice concreteDevice;

  // When
  concreteDevice.enable();

  // Then
  EXPECT_TRUE(concreteDevice.isEnabled());
}

class ConcreteDeviceParamUnitTestForValidOutputs : public ConcreteDeviceUnitTest, public testing::WithParamInterface<uint32_t>{};
std::vector<uint32_t> validOutputValues =
{
    0,
    1,
    23837,
    UINT32_MAX-1,
    UINT32_MAX,
};
INSTANTIATE_TEST_SUITE_P(ConcreteDeviceParamUnitTestForValidOutputsSuite, ConcreteDeviceParamUnitTestForValidOutputs, testing::ValuesIn(validOutputValues));

TEST_P(ConcreteDeviceParamUnitTestForValidOutputs, getOutput_shouldReturnValueSetBySetOutput) {
  
  // Given
  ConcreteDevice concreteDevice;
  const uint32_t givenOutputValue = GetParam();

  // When
  concreteDevice.setOutput(givenOutputValue);

  // Then
  EXPECT_EQ(concreteDevice.getOutput(), givenOutputValue);
}