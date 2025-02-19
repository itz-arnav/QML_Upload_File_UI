import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts

Shape {
    id: control

    ShapePath {
        id: shapePath
        strokeColor: "#bfc4ea"
        strokeWidth: 2
        strokeStyle: ShapePath.DashLine
        dashPattern: [4,2]

        fillColor: "#f8f9fe"

        PathRectangle {
            width: control.width
            height: control.height
            radius: 4
            strokeAdjustment: shapePath.strokeWidth
        }
    }
}
