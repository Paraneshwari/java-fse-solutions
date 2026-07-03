package com.parani;

import org.junit.Test;

import static org.junit.Assert.*;

public class AssertionTest {

    @Test
    public void testAssertions() {

        int sum = 2 + 3;
        assertEquals(5, sum);

        int balance = 1500;
        assertTrue(balance > 1000);

        int age = 25;
        assertFalse(age < 18);

        String customer = null;
        assertNull(customer);

        Object obj = new Object();
        assertNotNull(obj);
    }
}