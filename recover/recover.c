#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

const int jpegblocks = 512;

int main(int argc, char *argv[])
{
    //Check input usage
    if (argc != 2)
    {
        printf("Usage: ./recover FILE\n");
        return 1;
    }

    // Open the memory card
    char *file = argv[1];
    FILE *rawfile = fopen(file, "r");
    if (rawfile == NULL)
    {
        printf("Could not open %s.\n", file);
        return 1;
    }

    bool found_jpeg = false;
    int jpeg_count = 0;
    uint8_t buffer[jpegblocks];
    char jpeg_name[8];
    FILE *outptr = NULL;

    // While there's still data left to read from the memory card
    while (fread(buffer, jpegblocks, 1, rawfile) == 1)
    {
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            if (found_jpeg)
            {
                fclose(outptr);
            }
            else
            {
                found_jpeg = true;
            }

        sprintf(jpeg_name, "%03i.jpg", jpeg_count);
        outptr = fopen(jpeg_name, "w");

        if (outptr == NULL)
        {
            fclose (rawfile);
            printf("Could not create %s. \n", jpeg_name);
            return 3;
        }
        jpeg_count ++;
        }

        if (found_jpeg)
        {
            fwrite(buffer, jpegblocks, 1, outptr);
        }
    }
    fclose(rawfile);

    if (found_jpeg)
    {
        fclose(outptr);
    }
    return 0;
}
