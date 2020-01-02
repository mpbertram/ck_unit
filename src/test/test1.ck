/* test1.ck */

class OnePlusOneEqualsTwo extends TestFunction {
    fun string desc() {
        return "One plus one equals two";
    }
    
    fun int ex() {
        return 1 + 1 == 2;
    }
}

class Test1 extends TestCase {
    fun void testOnePlusOneEqualsTwo() {
        OnePlusOneEqualsTwo f;
        CkUnit.test(f);
    }
    
    fun void run() {
        testOnePlusOneEqualsTwo();
    }
}

Test1 t1;
CkUnit.register(t1);
