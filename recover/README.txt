- The program will accept exactly one command-line argument, the name of a forensic image from which to recover JPEGs.
- If the program is not executed with exactly one command-line argument, it will remind the user of correct usage, and main will return 1.
- If the forensic image cannot be opened for reading, the program will inform the user as much, and main will return 1.
- The files it generates will each be named ###.jpg, where ### is a three-digit decimal number, starting with 000 for the first image and counting up.

Usage:
cd recover
recover/ $ make recover
recover/ $ ./recover card.raw
