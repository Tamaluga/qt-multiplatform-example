/**
  ******************************************************************************
  * @file           : main.cpp
  * @brief          : Main program body
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <iostream>
#include <thread>
#include <chrono>
#include "ConcreteDevice.hpp"
#include <QObject>

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  QObject test;
  std::cout << test.startTimer(100);
  uint32_t count = 0;

  ConcreteDevice concreteDevice;
  concreteDevice.enable();

  /* Infinite loop */
  for (;;)
  {
    std::cout << "Alive-Count: " << count << "\r";
    std::cout.flush();
    count++;
    concreteDevice.setOutput(count);
    
    std::this_thread::sleep_for(std::chrono::seconds(1));
  }
}