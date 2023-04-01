import core.stdc.stdio;

extern (C):

__gshared bool[8191] flags;

int main()
{
	int count;

	printf("10 iterations\n");
	foreach (iter; 1 .. 11) {
		count = 0;
		flags[] = true;
		foreach (i; 0 .. flags.length) {
			if (flags[i]) {
				const prime = i + i + 3;
				auto k = i + prime;
				while (k < flags.length) {
					flags[k] = false;
					k += prime;
				}
				count += 1;
			}
		}
	}
	printf("%d primes\n", count);
	return 0;
}
