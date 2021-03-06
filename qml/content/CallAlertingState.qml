import Qt 4.7
import "../ofonohelper.js" as Helper

Item {
    id: container
    width: 240
    height: 320
    property string callId: ""

    Connections {
        target: OfonoContext

        onAlertingCall: {
            txtNumber.text = Helper.getCallerNumber(id);
            callId = id;
            console.log("CallWaitingView onAlertingCall" + id);
        }

    }

    Text {
        id: numberCaption
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height / 4
        text: "Number: "
        color: "#FFFFFF"
        style: Text.Raised; styleColor: "black"
        font.pixelSize: 16

    }

    Text {
        id: txtNumber
        anchors.top: numberCaption.bottom
        anchors.horizontalCenter: numberCaption.horizontalCenter
        color: "#FFFFFF"
        style: Text.Raised; styleColor: "black"
        font.pixelSize: 16

    }

    Loading {
        id: loader
        anchors.top: txtNumber.bottom
        anchors.horizontalCenter: txtNumber.horizontalCenter

    }

    AppIcon {
        id: btnCancel
        anchors.top: loader.bottom
        anchors.horizontalCenter: loader.horizontalCenter
        width: 48
        height: 48
        iconSource: "images/gpl/Gnome-call-stop_48.png"
        onClicked: OfonoContext.hangupCall(callId)
    }


}
