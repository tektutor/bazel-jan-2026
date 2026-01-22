#include <QApplication>
#include "dialog.h"

int main(int argc, char **argv) {

	QApplication theApp(argc,argv);

	Dialog dlg;
	dlg.show();

	return theApp.exec();
}
