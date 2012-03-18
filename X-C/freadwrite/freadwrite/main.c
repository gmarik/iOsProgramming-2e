//
//  main.c
//  freadwrite
//
//  Created by Marjan Hratson on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main (int argc, const char * argv[])
{

    // IT WAS SO LONG TIME AGO!!!
    unsigned long COUNT=100;
    
    FILE *inFile = fopen("infile.txt", "rt");
    char *buffer = malloc(COUNT);
    
    fread(buffer, COUNT, 1, inFile);
    FILE *outfile = fopen("outfile.txt", "w");
    fwrite(buffer, COUNT, 1, outfile);
    
    puts(buffer);
    
    return 0;
}

