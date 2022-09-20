#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>

#include <QRect>
#include <QVBoxLayout>
#include <QPushButton>
#include <QTextEdit>
#include <QPropertyAnimation>
#include <QSequentialAnimationGroup>
#include <QGraphicsOpacityEffect>

#include <QDebug>
#include <QEvent>
#include <QKeyEvent>

class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = nullptr);
    ~Widget();

private:
    QRect* rect;
    QVBoxLayout* bLay;

    QWidget* Frame;

    QWidget* secondaryFrame;
    QWidget* tFrame;
    QPushButton* submitButton;
    QTextEdit* loginTE;
    QTextEdit* passwdTE;
    QSequentialAnimationGroup* animationFail;
    QSequentialAnimationGroup* animationSuccess;

private slots:
    void logining(bool);

protected:
    void resizeEvent ( QResizeEvent * e );

    bool eventFilter(QObject *obj, QEvent *event);

};
#endif // WIDGET_H
