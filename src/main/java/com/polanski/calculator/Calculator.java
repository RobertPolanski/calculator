package com.polanski.calculator;

import org.springframework.stereotype.Service;

/**
 * Message
 */
@Service
public class Calculator {

    public int sum(int a, int b) {
        return a + b;
    }
}

