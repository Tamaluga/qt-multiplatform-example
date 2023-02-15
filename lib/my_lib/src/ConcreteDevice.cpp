
#include "ConcreteDevice.hpp"

ConcreteDevice::ConcreteDevice():
  m_isEnabled(false){}

void ConcreteDevice::enable()
{
  m_isEnabled = true;
}

void ConcreteDevice::disable()
{
  m_isEnabled = false;
}

bool ConcreteDevice::isEnabled() const
{
  return m_isEnabled;
}

void ConcreteDevice::setOutput(const uint32_t value)
{
  m_outputValue = value;
}

uint32_t ConcreteDevice::getOutput() const
{
  return m_outputValue;
}
