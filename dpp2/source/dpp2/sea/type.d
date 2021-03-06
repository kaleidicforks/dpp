module dpp2.sea.type;


import dpp.from;


alias Type = from!"sumtype".SumType!(
    Void, NullPointerT,
    Bool,
    UnsignedChar, SignedChar, Char, Wchar, Char16, Char32,
    Short, UnsignedShort, Int, UnsignedInt, Long, UnsignedLong, LongLong, UnsignedLongLong, Int128, UnsignedInt128,
    Half, Float, Double, LongDouble,
    Pointer,
    ConstantArray,
    UserDefinedType,
);


struct Void {}
struct NullPointerT {}

struct Bool {}

struct UnsignedChar {}
struct SignedChar {}
struct Char {}
struct Wchar {}
struct Char16 {}
struct Char32 {}

struct Short {}
struct UnsignedShort {}
struct Int {}
struct UnsignedInt {}
struct Long {}
struct UnsignedLong {}
struct LongLong {}
struct UnsignedLongLong {}
struct Int128 {}
struct UnsignedInt128 {}

struct Half {}
struct Float {}
struct Double {}
struct LongDouble {}


struct Pointer {
    // has to be a pointer in order to have a recursive type
    Type* pointeeType;
}


struct ConstantArray {
    // has to be a pointer in order to have a recursive type
    Type* elementType;
    int length;
}

struct UserDefinedType {
    string spelling;
}
