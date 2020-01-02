public class CkUnit {
    static TestCase @ testCases[];
    static TestResult @ testResults[];
    
    fun static void register(TestCase tc) {
        testCases.cap() => int testCasesCap;
        
        TestCase t[testCasesCap + 1];
        if (testCasesCap > 0) {
            for (0 => int i; i < testCasesCap; ++i) {
                testCases[i] @=> t[i];
            }
        }
        
        tc @=> t[t.cap() - 1];
        
        t @=> testCases;
    }
    
    fun static void addResult(TestResult tr) {
        testResults.cap() => int testResultsCap;
        
        TestResult t[testResultsCap + 1];
        if (testResultsCap > 0) {
            for (0 => int i; i < testResultsCap; ++i) {
                testResults[i] @=> t[i];
            }
        }
        
        tr @=> t[t.cap() - 1];
        
        t @=> testResults;
    }
    
    fun static void test(TestFunction f) {
        TestResult tr;
        f.ex() => tr.status;
        
        if (tr.status == 0) {
            <<< "Test failed: " +  f.desc() >>>;
        }
        
        addResult(tr);
    }
    
    fun static void run() {
        for (int i; i < testCases.cap(); ++i) {
            testCases[i] @=> TestCase tc;
            // TODO Execute tests concurrently (controlled by parameter)
            tc.run();
        }
    }
    
    fun static void summary() {
        0 => int passed;
        0 => int failed;
        for (int i; i < testResults.cap(); ++i) {
            testResults[i] @=> TestResult tr;
            if (tr.status == 0) {
                ++failed;
            } else {
                ++passed;
            }
        }
        
        <<< "FAILED: " + failed >>>;
        <<< "PASSED: " + passed >>>;
    }
}
