import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Canvas {
        id: root
        width: parent.width; height: parent.height

        property int square_size: 180
        property int green_y: height/2//height/2+square_size+square_size/3
        property int shift: 20
        onPaint: {
            var ctx = getContext("2d")

            ctx.fillStyle = 'green'
            ctx.fillRect(0, height/2, width, height/6)

            ctx.fillStyle = 'blue'
            ctx.fillRect(0, 0, width, height/2)

            ctx.fillStyle = 'yellow'
            ctx.fillRect(width/2-square_size/2, height/2-square_size/2, square_size+30, square_size)

            ctx.fillStyle = 'red'
            ctx.fillRect(width/2+square_size/2, height/2-square_size, square_size/7, square_size/3)

            ctx.fillStyle = 'brown'
            ctx.beginPath();
            ctx.moveTo(width/2+shift, height/2-square_size);
            ctx.lineTo(width/2-square_size+shift, height/2-square_size/2);
            ctx.lineTo(width/2+square_size, height/2-square_size/2);
            ctx.fill();
            ctx.closePath();

        }
    }
}
