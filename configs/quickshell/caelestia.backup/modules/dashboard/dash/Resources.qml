import QtQuick
import QtQuick.Layouts
import Caelestia.Config
import Caelestia.Services
import qs.components
import qs.components.controls
import qs.services

Item {
    id: root

    anchors.top: parent.top
    anchors.bottom: parent.bottom

    implicitWidth: layout.implicitWidth + layout.anchors.margins * 2

    ServiceRef {
        service: Cpu
    }

    ServiceRef {
        service: Memory
    }

    ServiceRef {
        service: Storage
    }

    ColumnLayout {
        id: layout

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: Tokens.padding.large
        spacing: Tokens.spacing.medium

        Resource {
            icon: "memory"
            label: "CPU"
            value: Cpu.percentage
        }

        Resource {
            icon: "memory_alt"
            label: "RAM"
            value: Memory.percentage
            fgColour: Colours.palette.m3tertiary
        }

        Resource {
            icon: "hard_disk"
            label: "SSD"
            value: Storage.percentage
            fgColour: Colours.palette.m3secondary
        }
    }

    component Resource: CircularProgress {
        id: res

        required property string icon
        required property string label

        Layout.fillHeight: true
        implicitSize: height
        strokeWidth: Tokens.sizes.dashboard.resourceProgressThickness

        Behavior on clampedVal {
            Anim {}
        }

        Column {
            anchors.centerIn: parent
            spacing: 0

            MaterialIcon {
                anchors.horizontalCenter: parent.horizontalCenter
                text: res.icon
                font: Tokens.font.icon.medium
                color: res.fgColour
            }

            StyledText {
                anchors.horizontalCenter: parent.horizontalCenter
                text: isNaN(res.value) ? "..." : Math.round(res.value * 100) + "%"
                font: Tokens.font.label.small
                color: res.fgColour
            }

            StyledText {
                anchors.horizontalCenter: parent.horizontalCenter
                text: res.label
                font: Tokens.font.label.small
                color: res.fgColour
                opacity: 0.7
            }
        }
    }
}