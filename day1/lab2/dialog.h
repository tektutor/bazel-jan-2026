#include <QDialog>
#include <QPushButton>
#include <QHBoxLayout>
#include <QDebug>

class Dialog : public QDialog {
Q_OBJECT
private:
	QPushButton *pBttn1, *pBttn2, *pBttn3;
	QHBoxLayout *pLayout;
public:
	Dialog();

private slots: //event handler functions
	void onBttn1Clicked();
	void onBttn2Clicked();
	void onBttn3Clicked();
};
