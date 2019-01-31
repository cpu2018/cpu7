#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE* fp;
    //int num = 90;
    //int num2 = 80;
    float d = 7.85;
    //char str[] = "xyzxyz";


    fp = fopen( "test.bin", "wb" );
    if( fp == NULL ){
        fputs( "ファイルオープンに失敗しました。\n", stderr );
        exit( EXIT_FAILURE );
    }

    //fwrite( &num, sizeof(num), 1, fp );
    //fwrite(&num2,sizeof(num2),1,fp);
    fwrite( &d, sizeof(d), 1, fp );
    //fwrite( str, sizeof(str[0]), sizeof(str), fp );

    if( fclose( fp ) == EOF ){
        fputs( "ファイルクローズに失敗しました。\n", stderr );
        exit( EXIT_FAILURE );
    }

    return 0;
}
