package com.polanski.calculator;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

/**
 * Calculator test.d
 */
public class CalculatorTest {

    private Calculator calculator = new Calculator();

    @Test
    public void testSum() {
        assertEquals(6, calculator.sum(3, 3));
    }
}

