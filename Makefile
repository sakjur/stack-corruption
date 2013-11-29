both: original modified

modified: original.S
	cp original.S modified.S
	sed -i 's/-52(/-20(/' modified.S
	sed -i 's/-48(/-52(/' modified.S
	gcc modified.S -o modified

original: original.S
	gcc original.S -o original

original.S:
	gcc -S source.c -o original.S	

clear:
	rm original modified original.S modified.S

