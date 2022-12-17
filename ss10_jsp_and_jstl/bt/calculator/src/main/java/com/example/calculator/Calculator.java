package com.example.calculator;

public class Calculator {
    public static float getCalculate(float firstOperand, float secondOperand, String operator) {
        switch (operator) {
            case "+": {
                return firstOperand + secondOperand;
            }
            case "-": {
                return firstOperand - secondOperand;
            }
            case "*": {
                return firstOperand * secondOperand;
            }
            case "/": {
                if (secondOperand != 0) {
                    return firstOperand / secondOperand;
                } else {
                    throw new RuntimeException("Error");
                }
            }
            default: {
                throw new RuntimeException("error");
            }
        }

    }
}
