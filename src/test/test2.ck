/* test2.ck */

class TwoPlusTwoEqualsFour extends TestFunction {
    fun string desc() {
        return "Two plus two equals four";
    }

    fun int ex() {
        return 2 + 2 == 4;
    }
}

class Test2 extends TestCase {
    fun void testTwoPlusTwoEqualsFour() {
        TwoPlusTwoEqualsFour f;
        CkUnit.test(f);
    }
    
    fun void run() {
        testTwoPlusTwoEqualsFour();
    }
}

Test2 t2;
CkUnit.register(t2);
