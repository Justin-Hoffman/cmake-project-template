import QtQuick 2.0
import QtQuick.Controls 2.12
ApplicationWindow {
    visible: true
    width: 900
    height: 600
    title: qsTr("Example Qt5 QML Application")

    StackView {
        id: stackView
        anchors.fill: parent

        TabBar {
            id: tabBar
            anchors.top: parent.top
            width: parent.width
            currentIndex: swipeView.currentIndex

            TabButton {
                id: rifleTabButton
                text: qsTr("Tab 1")
            }

            TabButton {
                id: loadTabButton
                text: qsTr("Tab 2")
            }

            TabButton {
                id: targetTabButton
                text: qsTr("Tab 3")
            }

            TabButton {
                id: solutionTabButton
                text: qsTr("Tab 4")
            }

            TabButton {
                id: tableTabButton
                text: qsTr("Tab 5")
            }
        }

        SwipeView {
            id: swipeView
            anchors.top: tabBar.bottom
            currentIndex: tabBar.currentIndex
            width: parent.width
            height: parent.height

            Pane {
                id: firstPage
                Text { text: qsTr("Hello World ") }
            }
            Pane {
                id: secondPane
                Text { text: qsTr("Hello Again") }
            }
            Pane {
                id: thirdPane
                Text { text: qsTr("and Again") }
            }
            Pane {
                id: fourthPane
                Text { text: qsTr("and Again!") }
            }
            Pane {
                id: fifthPage
                Text { text: qsTr("and Again!!") }
            }
        }
    }
}
