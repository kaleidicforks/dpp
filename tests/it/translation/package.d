/**
   Ease-of-use imports for writing integration tests for translation
 */
module it.translation;

public import unit_threaded;
public import clang: TranslationUnit, Cursor;

struct In {
    string value;
}

struct Out {
    string value;
}

struct TranslationSandbox {

    alias sandbox this;

    Sandbox sandbox;

    static auto opCall() @safe {
        TranslationSandbox ret;
        ret.sandbox = Sandbox();
        return ret;
    }

    void expand(in Out out_, in In in_, in string[] inLines, in string file = __FILE__, in size_t line = __LINE__)
        @safe const
    {
        import std.array: join;
        expand(out_, in_, inLines.join("\n"), file, line);
    }

    void expand(in Out out_, in In in_, in string inText, in string file = __FILE__, in size_t line = __LINE__)
        @safe const
    {
        import include.expansion: realExpand = expand;
        const outFileName = inSandboxPath(out_.value);
        const inFileName = inSandboxPath(in_.value);
        writeFile(inFileName, inText);
        writeFile(outFileName, realExpand(inFileName, file, line));
    }

    void shouldCompileAndRun(in string[] srcFiles...) @safe const {
        import std.algorithm: map;
        import std.array: join;
        import std.file: readText;

        try
            shouldExecuteOk(["dmd", "-run"] ~ srcFiles);
        catch(Exception e) {
            e.msg = e.msg ~ "\n\n" ~ srcFiles
                .map!(a => a ~ ":\n----------\n" ~ readText(sandbox.inSandboxPath(a)))
                .join("\n\n");
            throw e;
        }
    }
}