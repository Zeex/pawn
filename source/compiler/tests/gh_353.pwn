#include <console>
#include <string>

forward test_too_different();
public test_too_different()
{
	const abcd = 1;			// the compiler shouldn't suggest any name for this error
	printf("%d\n", abcxyz);	// since "abcxyz" and "abcd" differ by more than 2 symbols
	#pragma unused abcd
}

forward test_e017();
public test_e017()
{
	// error 017: undefined symbol "val"; did you mean "var"?
	new var = 1;
	printf("%d\n", val);
	#pragma unused var

	// error 017: undefined symbol "celmax"; did you mean "cellmax"?
	printf("%d\n", celmax);

	// error 017: undefined symbol "strcaf"; did you mean "strcat"?
	new str[4] = "a";
	return strcaf(str, "b");
}

forward test_e019();
public test_e019()
{
	// error 019: not a label: "lb"; did you mean "lbl"?
lbl:
	goto lb;
}

forward test_e020();
public test_e020()
{
	// error 020: invalid symbol name "assert"; did you mean "asset"?
	new asset = 0;
	printf("%d\n", defined assert);
	#pragma unused asset
}

forward test_e080();
public test_e080()
{
	// error 080: unknown symbol, or not a constant symbol (symbol "idx"); did you mean "id"?
	new values[1];
	new idx = 0;
	const id = 0;
	printf("%d\n", sizeof values[idx]);
	#pragma unused values, idx, id
}

stock func1()<automaton_1:STATE_1>{}
stock func2()<automaton_2:BEING_1>{}

forward test_e086();
public test_e086()
{
	// error 086: unknown automaton "automaton1"; did you mean "automaton_1"?
	state automaton1:STATE_1;
}

forward test_e087();
public test_e087()
{
	// error 087: unknown state BEING1" for automaton "automaton_2"; did you mean "BEING_1"?
	state automaton_2:BEING1;

	// error 087: unknown state "STATE_1" for automaton "automaton_2"; did you mean "automaton_1:STATE_1"?
	state automaton_2:STATE_1;
}
