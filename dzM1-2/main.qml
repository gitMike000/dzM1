import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: primaryFrame
    width: 640
    height: 480
    visible: true
    title: qsTr("Площадь треугольника")
    color: "#e5ecef"

    function calculate() {
        var a = parseFloat(aField.text)
        var b = parseFloat(bField.text)
        var c = parseFloat(cField.text)
        var p = (a+b+c)/2
        var S = Math.sqrt(p*(p - a)*(p - b)*(p - c))
        if (isNaN(S) ) {
            calc.text = "Ошибка введите длины сторон"
        } else {
            calc.text = S.toFixed(1)
        }
    }

    Rectangle {
        id: secondaryFrame
        color: "white"
        anchors.centerIn: parent
        radius: 5
        width: 300
        height: 350
        property string textColor: "#535353"

         Column {
             anchors.fill: parent
             padding: 32
             spacing: 32
             TextField {
                 id: aField
                 anchors.horizontalCenter: parent.horizontalCenter // размещение по центру оси OX колонки
                 placeholderText: qsTr("3")
                 validator: RegExpValidator { regExp: /^(?=.+)(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                 color: secondaryFrame.textColor
             }
             TextField {
                 id: bField
                 anchors.horizontalCenter: parent.horizontalCenter
                 placeholderText: qsTr("4")
                 validator: RegExpValidator { regExp: /^(?=.+)(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                 color: secondaryFrame.textColor
             }
             TextField {
                 id: cField
                 anchors.horizontalCenter: parent.horizontalCenter
                 placeholderText: qsTr("5")
                 validator: RegExpValidator { regExp: /^(?=.+)(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                 color: secondaryFrame.textColor
             }
             Label {
                 id: calc
                 anchors.horizontalCenter: parent.horizontalCenter
                 text: "Введите длины сторон"
             }

             Button {
                 id: calcButton
                 width: 200
                 height: 40
                 background: Rectangle {
                         color: parent.down ? "#bbbbbb" :
                                 (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                 } // разный цвет кнопки при нажатии, наведении курсора и в обычном состоянии
                 text: qsTr("Рассчитать")
                 anchors.horizontalCenter: parent.horizontalCenter

                 onClicked: calculate()
             }
         }
     }
}
