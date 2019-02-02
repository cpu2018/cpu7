#include <iostream>
#include <fstream>
#include <cstdlib>

using namespace std;

unsigned int a[20000];

int main(int argc, char* argv[]) {
	if (argc != 4) {
		cout << "usage: ./simulator [binary] [in.bin] [out.ppm]\n" << endl;
		return 0;
	}

	fstream bin;
	fstream ppm;
	bin.open(argv[2], ios::in | ios::binary);
	for (int i = 0; !bin.eof(); i++) bin.read((char*)(a + i), sizeof(unsigned int));
	cout << a[0] << "\n" << a[1] << endl;
	ppm.open(argv[3], ios::out | ios::binary);
	ppm << "test\n";
	ppm << a[1];
	bin.close();
	ppm.close();
}
