#include "widget.h"

Widget::Widget(QWidget *parent)
    : QWidget(parent)
{
    setWindowTitle(tr("Login form"));
    resize(640,480);
    setAttribute(Qt::WA_StyledBackground, true);
    setStyleSheet("background-color: #e5ecef;");

    secondaryFrame = new QWidget(this);
    secondaryFrame->resize(300,250);
    secondaryFrame->move((this->width()-300)/2,(this->height()-250)/2);
    secondaryFrame->setAttribute(Qt::WA_StyledBackground, true);
    secondaryFrame->setStyleSheet("background-color: white;");

    tFrame = new QWidget(secondaryFrame);
    tFrame -> resize(secondaryFrame->width()-64, secondaryFrame->height()-64);
    tFrame -> move(32,32);
    bLay = new QVBoxLayout(tFrame);
    loginTE =new QTextEdit();
    loginTE->setFocusPolicy(Qt::StrongFocus);
    loginTE->installEventFilter(this);
    loginTE->setTabChangesFocus(true);
    loginTE->setPlaceholderText(tr("Логин"));
    passwdTE =new QTextEdit();
    passwdTE->setPlaceholderText(tr("Пароль"));
    passwdTE->setFocusPolicy(Qt::StrongFocus);
    passwdTE->installEventFilter(this);
    passwdTE->setTabChangesFocus(true);

    submitButton = new QPushButton(tr("Вход"));
    submitButton->setFocusPolicy(Qt::StrongFocus);
    submitButton->installEventFilter(this);
    connect(submitButton,&QPushButton::clicked, this, &Widget::logining);
    bLay->setSpacing(32);
    bLay->addWidget(loginTE);
    bLay->addWidget(passwdTE);
    bLay->addWidget(submitButton);

    animationSuccess=new QSequentialAnimationGroup(this);
    QGraphicsOpacityEffect* eff1 = new QGraphicsOpacityEffect(this);
    tFrame->setGraphicsEffect(eff1);
    QPropertyAnimation* anim4 = new QPropertyAnimation(eff1, "opacity");
    anim4->setDuration(400);
    anim4->setStartValue(1);
    anim4->setEndValue(0);
    animationSuccess->addAnimation(anim4);
    QGraphicsOpacityEffect* eff2 = new QGraphicsOpacityEffect(this);
    secondaryFrame->setGraphicsEffect(eff2);
    QPropertyAnimation* anim5 = new QPropertyAnimation(eff2, "opacity");
    anim5->setDuration(600);
    anim5->setStartValue(1);
    anim5->setEndValue(0);
    animationSuccess->addAnimation(anim5);

    animationFail = new QSequentialAnimationGroup(this);
    QPropertyAnimation* anim1 = new QPropertyAnimation(secondaryFrame, "geometry");
    anim1->setDuration(50);
    anim1->setStartValue(secondaryFrame->geometry());
    anim1->setEndValue(secondaryFrame->geometry().translated(-5,0));
    animationFail->addAnimation(anim1);
    QPropertyAnimation* anim2 = new QPropertyAnimation(secondaryFrame, "geometry");
    anim2->setDuration(100);
    anim2->setStartValue(secondaryFrame->geometry());
    anim2->setEndValue(secondaryFrame->geometry().translated(5,0));
    animationFail->addAnimation(anim2);
    QPropertyAnimation* anim3 = new QPropertyAnimation(secondaryFrame, "geometry");
    anim3->setDuration(50);
    anim3->setStartValue(secondaryFrame->geometry());
    anim3->setEndValue(secondaryFrame->geometry().translated(0,0));
    animationFail->addAnimation(anim3);
}

Widget::~Widget()
{
}

void Widget::logining(bool)
{
    if ("login" == loginTE->toPlainText() && "password" == passwdTE->toPlainText())
    {
        animationSuccess->start();

    } else {
        animationFail->start();
    }
}

void Widget::resizeEvent ( QResizeEvent * e )
{    
    secondaryFrame->move((this->width()-300)/2,(this->height()-250)/2);
}

bool Widget::eventFilter(QObject *obj, QEvent *event)
{
    if (obj == loginTE || obj == passwdTE || obj ==submitButton)
    {
        if(event->type() == QEvent::KeyPress){
            QKeyEvent *keyEvent = static_cast<QKeyEvent *>(event);
            if (keyEvent->key() == Qt::Key_Return ||
                keyEvent->key() == Qt::Key_Enter){
                logining(true);
                return true;
            }
        }
    }
    return false;
}


