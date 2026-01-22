#include <QDialog>
#include <QPushButton>
#include <QHBoxLayout>

class Dialog : public QDialog {
private:
	QPushButton *pBttn1, *pBttn2, *pBttn3;
	QHBoxLayout *pLayout;
public:
	Dialog();

};
