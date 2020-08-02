#include <iostream>

using namespace std;

extern "C" int Question(int a);

int main() {
    cout << "Digite um número :";
    int numero;
    cin >> numero;

    if (Question(numero) == 0){
	    cout << "É par" << endl;
    } else {
	    cout << "É impar" << endl;
    }
    return 0;
}
