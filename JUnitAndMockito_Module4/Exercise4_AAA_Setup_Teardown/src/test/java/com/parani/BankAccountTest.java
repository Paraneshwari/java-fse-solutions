package com.parani;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class BankAccountTest {

    private BankAccount account;

    @Before
    public void setUp() {
        account = new BankAccount();
        System.out.println("Setup executed");
    }

    @Test
    public void testDeposit() {

        // Arrange
        double balance = 1000;
        double amount = 500;

        // Act
        double result = account.deposit(balance, amount);

        // Assert
        assertEquals(1500, result, 0.001);
    }

    @After
    public void tearDown() {
        account = null;
        System.out.println("Teardown executed");
    }
}