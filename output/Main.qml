import QtQuick 2.4
import Ubuntu.Components 1.3
import Launcher 1.0
import Ubuntu.Components.Themes.Ambiance 1.0

MainView {
    id: mainView
    property var toSend: []
    function resend() {
        if (!dispacher.isRunning && toSend.length) {
            dispacher.arguments = toSend[0]
            toSend.shift();
            dispacher.start(0);
        }
    }
    width: units.gu(100)
    height: units.gu(75)
    applicationName:"com.edi.npost_npost"
    Launcher{
        id: dispacher
        programName: "./notify.sh"
        arguments: [titluPost.text, ""]
        onFinished: resend()
    }
    Page {
        id: onlyPage
        header : PageHeader {
            id: pHeader
            title: "Send post notifications"
            trailingActionBar.actions: [
                Action {
                    text: i18n.tr("Apply")
                    iconName: "message"
                    onTriggered: {
                        var lines = bodyPost.text.split("\n");
                        for (var i = 0; i < lines.length; ++i) {
                            var toAdd = lines[i].split(",");
                            for (var j = 0; j < toAdd.length; ++j) {
                                mainView.toSend.push([titluPost.text, toAdd[j]]);
                            }
                        }
                        mainView.resend();
                    }

                }
            ]
        }
        TextField {
            id: titluPost
            width: parent.width - units.gu(4)
            placeholderText: i18n.tr("1. Write some title...")
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: pHeader.bottom
                margins: units.gu(2)
            }
        }
        TextArea {
            id: bodyPost
            width: parent.width - units.gu(4)
            inputMethodHints: Qt.ImhNoPredictiveText
            placeholderText: i18n.tr("2. Write some comma separated and line separated items...\n3. Hit the message button on top right...")
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: titluPost.bottom
                bottom: parent.bottom
            }
        }

    }
}
