# Stack Corruption demonstration

So, this is not originally my source - it comes from @0xabad1dea originally [A tale of two compilers](http://www.veracode.com/blog/2013/11/a-tale-of-two-compilers/). Note that my source is not a hundred percent the same as the blogpost code, but AFAIK, I just have an older version of the very same code - where I've replaced 0xABAD1DEA with 0xADA5F00D for the fun of it.

Sue me.

All credits belongs to Melissa - I simply wanted to make it a bit more obvious how little the difference between the two versions may be. What I noticed GCC did for me was that it put the variables in a way so that the string will have a little space for overflow. This behaviour is probably quite nice to the programmer, but by simply moving around where in memory the variables are stores, you can get a buffer overflow where you edit one of the 0xADA5F00D to 0xADA5F000.

This is due to the least significant byte (originally 0D) being replaced by a NUL-character to notify the end of the string, but as the string is filling up it's entire memory - you'll push the NUL-character to the first byte of the following variable - and then due to the little endian format of x86-assembly, you'll replace the least significant byte with 0.

Please note that my variables are of correct length even in the modified version, but as the C language doesn't actually care that much if you make minor overflows, both the assembly-files are correct representations of the C code.
