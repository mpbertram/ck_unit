TestCase tc[0] @=> CkUnit.testCases;
TestResult tr[0] @=> CkUnit.testResults;

for (int i; i < me.args(); i++) {
    Machine.add(me.arg(i)) => int sId;
    Shred.fromId(sId) @=> Shred s;

    while(!s.done()) 100::ms => now;
    
    // TODO Fetch compile errors and add them to summary
}

CkUnit.run();
CkUnit.summary();

// TODO Exit with corresponding error code
