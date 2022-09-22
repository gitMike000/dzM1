import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: primaryFrame
    width: 640
    height: 480
    visible: true
    title: qsTr("Площадь треугольника")
    color: "#e5ecef"

    function lenght(x1, y1, x2, y2) {
        var t=Math.sqrt(Math.pow((x1-x2),2)+Math.pow((y1-y2),2))
        return t
    }

    function calculate() {
        var a = lenght(parseFloat(a1Field.text), parseFloat(a2Field.text),
                       parseFloat(b1Field.text), parseFloat(b2Field.text))
        console.log("a=",a)
        var b = lenght(parseFloat(b1Field.text), parseFloat(b2Field.text),
                       parseFloat(c1Field.text), parseFloat(c2Field.text))
        console.log("b=",b)
        var c = lenght(parseFloat(c1Field.text), parseFloat(c2Field.text),
                       parseFloat(a1Field.text), parseFloat(a2Field.text))
        console.log("c=",c)
        var p = (a+b+c)/2
        var S = Math.sqrt(p*(p - a)*(p - b)*(p - c))
        if (isNaN(S) ) {
            calc.text = "Ошибка введите координаты вершин"
        } else {
            calc.text = S.toFixed(1)
        }
    }

    GridLayout {
        anchors.fill: parent

        columns: 2
        rows: 5

            Rectangle {
                TextField {
                     id: a1Field
                     anchors.horizontalCenter: parent.horizontalCenter
                     placeholderText: qsTr("a1")
                     validator: RegExpValidator { regExp: /(?:.+-)?(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                     color: "black"
                     width: 100
                     height: 40
                }
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.row: 0
                Layout.rowSpan: 1
                width: 110
                height: 50
             }

            Rectangle {
                TextField {
                     id: a2Field
                     anchors.horizontalCenter: parent.horizontalCenter
                     placeholderText: qsTr("a2")
                     validator: RegExpValidator { regExp: /(?:.+-)?(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                     //validator: RegExpValidator { regExp: /^(?=.+)(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                     color: "black"
                     width: 100
                     height: 40
                }
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.column: 1
                Layout.columnSpan: 1
                Layout.row: 0
                Layout.rowSpan: 1
                width: 110
                height: 50
             }

            Rectangle {
                TextField {
                    id: b1Field
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("b1")
                    validator: RegExpValidator { regExp: /(?:.+-)?(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                    color: "black"
                    width: 100
                    height: 40
                }
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.row: 1
                Layout.rowSpan: 1
                width: 110
                height: 50
             }

            Rectangle {
                TextField {
                    id: b2Field
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("b2")
                    validator: RegExpValidator { regExp: /(?:.+-)?(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                    color: "black"
                    width: 100
                    height: 40
                }
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.column: 1
                Layout.columnSpan: 1
                Layout.row: 1
                Layout.rowSpan: 1
                width: 110
                height: 50
             }

            Rectangle {
                TextField {
                     id: c1Field
                     anchors.horizontalCenter: parent.horizontalCenter
                     placeholderText: qsTr("c1")
                     validator: RegExpValidator { regExp: /(?:.+-)?(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                     color: "black"
                     width: 100
                     height: 40
                }
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.row: 2
                Layout.rowSpan: 1
                width: 110
                height: 50
             }

            Rectangle {
                TextField {
                     id: c2Field
                     anchors.horizontalCenter: parent.horizontalCenter
                     placeholderText: qsTr("c2")
                     validator: RegExpValidator { regExp: /(?:.+-)?(?:[1-9]\d*|0)?(?:\.\d+)?$/ }
                     color: "black"
                     width: 100
                     height: 40
                }
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.column: 1
                Layout.columnSpan: 1
                Layout.row: 2
                Layout.rowSpan: 1
                width: 110
                height: 50
             }

             Rectangle {
                Label {
                     id: calc
                     anchors.horizontalCenter: parent.horizontalCenter
                     text: "Введите координаты вершин"
                     width: 200
                     height: 40
                }
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.column: 0
                Layout.columnSpan: 2
                Layout.row: 3
                Layout.rowSpan: 1
                width: 220
                height: 50
             }

             Rectangle {
                Button {
                   id: calcButton
                    width: 200
                    height: 40
                    background: Rectangle {
                         color: parent.down ? "#bbbbbb" :
                                 (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                         }
                    text: qsTr("Рассчитать")
                    anchors.horizontalCenter: parent.horizontalCenter

                    onClicked: calculate()
                }
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.column: 0
                Layout.columnSpan: 2
                Layout.row: 4
                Layout.rowSpan: 1
                width: 220
                height: 50
             }
         }
}
