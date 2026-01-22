#include "dialog.h"

Dialog::Dialog() {
	pBttn1 = new QPushButton("Button 1");
	pBttn2 = new QPushButton("Button 2");
	pBttn3 = new QPushButton("Button 3");

	pLayout = new QHBoxLayout;

	pLayout->addWidget ( pBttn1 );
	pLayout->addWidget ( pBttn2 );
	pLayout->addWidget ( pBttn3 );

	setLayout( pLayout );

	connect(
		pBttn1,
		SIGNAL( clicked() ),
		this,
		SLOT( onBttn1Clicked() )
	);
	connect(
		pBttn2,
		SIGNAL( clicked() ),
		this,
		SLOT( onBttn2Clicked() )
	);
	connect(
		pBttn3,
		SIGNAL( clicked() ),
		this,
		SLOT( onBttn3Clicked() )
	);
}

void Dialog::onBttn1Clicked() {
	qDebug() << "Button 1 clicked ...";
}

void Dialog::onBttn2Clicked() {
	qDebug() << "Button 2 clicked ...";
}
void Dialog::onBttn3Clicked() {
	qDebug() << "Button 3 clicked ...";
}
