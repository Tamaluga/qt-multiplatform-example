#pragma once

#include "IDevice.hpp"

class ConcreteDevice : public IDevice {

public:
  ConcreteDevice();
  virtual ~ConcreteDevice() = default;

  void enable() override;
  void disable() override;
  bool isEnabled() const override;
  void setOutput(const uint32_t value) override;
  uint32_t getOutput() const override;

private:
  bool m_isEnabled;
  uint32_t m_outputValue;
};