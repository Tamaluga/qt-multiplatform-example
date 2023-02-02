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
#include "calculator.hpp"
#include <QObject>

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  QObject test;
  std::cout << test.startTimer(100);
  Calculator calc;
  uint32_t count = 0;

  /* Infinite loop */
  for (;;)
  {
    std::cout << "Alive-Count: " << count << "\r";
    std::cout.flush();
    count = calc.addition(count, 1);
    std::this_thread::sleep_for(std::chrono::seconds(1));
  }
}