/*=====================================================================

 QGroundControl Open Source Ground Control Station

 (c) 2009 - 2015 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>

 This file is part of the QGROUNDCONTROL project

 QGROUNDCONTROL is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 QGROUNDCONTROL is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with QGROUNDCONTROL. If not, see <http://www.gnu.org/licenses/>.

 ======================================================================*/

import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

import QGroundControl.Palette 1.0
import QGroundControl.ScreenTools 1.0

Rectangle {
    property var __qgcPal: QGCPalette { colorGroupEnabled: enabled }
    property ScreenTools screenTools: ScreenTools { }

    // Indicates whether calibration is valid for this control
    property bool calValid: false

    // Indicates whether the control is currently being calibrated
    property bool calInProgress: false

    // Image source
    property var imageSource: ""

    width:  200
    height: 200
    color:  calInProgress ? "yellow" : (calValid ? "green" : "red")

    Rectangle {
        readonly property int inset: 5
        property string calText: calInProgress ? "Hold Still" : (calValid ? "Completed" : "Incomplete")

        x:      inset
        y:      inset
        width:  parent.width - (inset * 2)
        height: parent.height - (inset * 2)
        color: qgcPal.windowShade

        Image {
            width:      parent.width
            height:     parent.height
            source:     imageSource
            fillMode:   Image.PreserveAspectFit
            smooth: true
        }

        Label {
            width:                  parent.width
            height:                 parent.height
            horizontalAlignment:    Text.AlignHCenter
            verticalAlignment:      Text.AlignBottom
            font.pointSize:         screenTools.dpiAdjustedPointSize(25);
            font.bold:              true
            color:                  "black"

            text: parent.calText
        }
        Label {
            width:                  parent.width
            height:                 parent.height
            horizontalAlignment:    Text.AlignHCenter
            verticalAlignment:      Text.AlignBottom
            font.pointSize:         screenTools.dpiAdjustedPointSize(25);
            color:                  calInProgress ? "yellow" : "white"

            text: parent.calText
        }
    }
}
