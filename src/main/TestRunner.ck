[
    me.sourceDir() + "/TestCase.ck",
    me.sourceDir() + "/TestFunction.ck",
    me.sourceDir() + "/TestResult.ck",
    me.sourceDir() + "/CkUnit.ck"
] @=> string sources[];

for (0 => int i; i < sources.cap(); ++i) {
    sources[i] => string source;
    
    Machine.add(source) => int sId;
    Shred.fromId(sId) @=> Shred s;

    while(!s.done()) 100::ms => now;
}

"" => string runArgs;
for (int i; i < me.args(); i++) {
    runArgs + ":" + me.arg(i) => runArgs;
}

Machine.add(me.sourceDir() + "/Run.ck" + runArgs);
