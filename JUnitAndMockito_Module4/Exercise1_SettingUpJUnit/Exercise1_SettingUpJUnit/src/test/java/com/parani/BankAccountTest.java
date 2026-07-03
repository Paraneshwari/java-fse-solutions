package com.parani;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class BankAccountTest {

    @Test
    public void testDeposit() {

        BankAccount account = new BankAccount();

        double result = account.deposit(1000, 500);

        assertEquals(1500, result, 0.001);
    }
}