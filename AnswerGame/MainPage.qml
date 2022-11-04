/*******************************************************************************
**
** Copyright (C) 2022 Open Mobile Platform LLC.
** Contact: https://community.omprussia.ru/open-source
**
** This file is part of the Aurora OS Application Template project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id:page
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property variant field: [0, 1, 1, 0, 1, 1, 0, 0] // 0 = down, 1 = right
    property int field_iterator: 0

    property int num1: 0
    property int num2: 0
    property int ans_num1: 0
    property int ans_num2: 0
    property int answer: 0

    property int real_answer: 0

    property int cnt_wins: 0
     property int cnt_for_win: 8
    property int lifes: 3

    property string win_los: ""

    property string entrance_txt: "Вход"
    property string exit_txt: "Выход"


    Component.onCompleted: {
        header.visible = false;
        body.visible = false;
        footer.visible = false;
        page.stopTimer();
    }

    function restartTimer() {
        header.restart();
    }

    function stopTimer() {
        header.stop();
    }

    function showRestart() {
        moveMinotavr();
        timer2.start();
        //body.show();
        //page.win_los = "Заново"
    }

    Timer {
        id: timer2
        interval: 3500; running: false; repeat: false;
        onTriggered: {
            body.show();
            page.win_los = "Заново"
        }
    }

    function showWin() {
        body.show();
        page.win_los = "Победа"
    }

    function moveR() {
        if(cnt_wins != page.cnt_for_win-1) {
            body.moveRight();
        }
    }
    function moveD() {
        if(page.cnt_wins != page.cnt_for_win-1) {
            body.moveDown();
        }
    }
    function moveMinotavr() {
        body.moveMinotavr();
    }

    Image {
        id: back_img
        ParallelAnimation {
            id: animation_start
            running: false
            NumberAnimation { target: back_img; property: "width"; to: back_img.width+100; duration: 1500 }
            NumberAnimation { target: back_img; property: "height"; to: parent.height+100; duration: 1500 }
            PropertyAnimation {
                targets: [header, body, footer]
                property: "visible"
                to: true
                duration: 1600
            }
            /*PropertyAnimation {
                target: back_img
                property: "source"
                to: "https://i.pinimg.com/originals/e8/05/e7/e805e748d12cd9d79a521ae56a70bdeb.jpg"
                duration: 1500
            }*/
            onRunningChanged: {
                if(animation_start.running == false) {
                    //back_img.anchors.top = header.bottom
                    //back_img.anchors.bottom = footer.top
                    //back_img.width = parent.width
                    //back_img.source = "https://i.pinimg.com/originals/e8/05/e7/e805e748d12cd9d79a521ae56a70bdeb.jpg"
                }
            }
        }

        height: parent.height
        source: "https://krot.info/uploads/posts/2020-10/1603957540_12-p-fon-labirint-15.jpg";
    }

    /*Button {
        id: play_btn
        anchors.centerIn: parent;
        Image {
            source: "https://www.pngarts.com/files/3/Play-Now-Button-Transparent-Background-PNG.png"
        }

        onClicked: {
            play_btn.visible = false;
            animation_start.running = true;
            page.restartTimer();
        }
    }*/

    Rectangle {
        id: play_btn
        anchors.centerIn: parent
        width: parent.width/2
        height: parent.height/12
        color: "#3D300B"
        border.color: "white"
        border.width: 5
        radius: 50

        Button {
            anchors.centerIn: parent;
            Text {
                anchors.centerIn: parent
                text: "Start"
                font.pointSize: 50
                color: "white"
            }

            //border.color: "black"

            onClicked: {
                play_btn.visible = false;
                animation_start.running = true;
                page.restartTimer();
            }
        }
    }

    Item {
        id: header
        height: parent.height/7
        width: parent.width

        function restart() {
            header_right.restart2();
        }
        function stop() {
            header_right.stop2();
        }

        Rectangle {
            id: header_left
            Image {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 25
                id: img_heart
                width: parent.width/2
                height: parent.height/2
                source: "https://ie.wampi.ru/2022/11/03/heart.png"
            }

            Text {
                anchors.left: img_heart.right
                anchors.verticalCenter: parent.verticalCenter
                text: page.lifes
                color: "white"
                font.pointSize: 40
                font.family: "Helvetica"
            }

            width: parent.width/3
            height: parent.height
            color: "#3D300B"
            border.color: "black"
            border.width: 5
            radius: 10
        }
        Rectangle {
            id: header_right

            function restart2() {
                header_right.time = 10
                timer.stop();
                timer.start();
            }
            function stop2() {
                header_right.time = 10
                timer.stop();
            }

            Component.onCompleted: {
                timer.start();
            }
            property int time: 10
            Text {
                id: text
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Осталось времени"
                color: "white"
                font.pointSize: 40
                font.family: "Helvetica"
            }

            Text {
                id: timer_text
                anchors.top: text.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: header_right.time
                color: "white"
                font.pointSize: 40
                font.family: "Helvetica"
            }

            Timer {
                id: timer
                interval: 1000; running: false; repeat: true;
                onTriggered: {
                    if(header_right.time == 10) {
                        var num_1_ = Math.floor(Math.random() * 10) + 1;
                        page.num1 = num_1_;
                        var num_2_ = Math.floor(Math.random() * 10) + 1;
                        page.num2 = num_2_;

                        var sum = num_1_+num_2_;
                        num_1_ = sum - Math.floor(Math.random() * 4) + 1;
                        num_2_ = sum + Math.floor(Math.random() * 4) + 1;

                        if(num_1_ == num_2_) {
                            num_2_ = num_1_ + (sum - num_1_);
                        }

                        //console.log(num_1_, num_2_, sum)

                        page.real_answer = sum;

                        var cell = 0;// Math.floor(Math.random() * 3);
                        switch(cell) {
                        case 0:
                            page.answer = sum
                            page.ans_num1 = num_1_;
                            page.ans_num2 = num_2_;
                            break;
                        case 1:
                            page.answer = num_1_
                            page.ans_num1 = sum;
                            page.ans_num2 = num_2_;
                            break;
                        case 2:
                            page.answer = num_1_
                            page.ans_num1 = num_2_;
                            page.ans_num2 = sum;
                            break;
                        }
                    }
                    header_right.time--;

                    if(header_right.time == 0) {
                        header_right.time = 10;
                        page.restartTimer();
                        if(page.lifes > 0)
                            page.lifes--;
                        if(page.lifes == 0) {
                            console.log("Looser");
                            page.stopTimer();
                            page.showRestart()
                        }
                    }
                }
            }

            anchors.left: header_left.right

            width: parent.width*2/3
            height: parent.height
            color: "#3D300B"
            border.color: "black"
            border.width: 5
            radius: 10
        }
    }

    Item {
        onVisibleChanged: {
            //page.entrance_txt = "Вход"
            //page.exit_txt = "Выход"
        }

        id: body
        anchors.top: header.bottom
        width: parent.width
        height: parent.height - footer.height - header.height

        function show() {
            body_rect.show2();
        }

        function moveRight() {
            body_rect.moveRight2();
        }
        function moveDown() {
            body_rect.moveDown2();
        }
        function moveMinotavr() {
            body_rect.moveMinotavr2();
        }

        Rectangle {
            id: body_rect

            function show2() {
                rect_restart.visible = true;
                mycanvas.visible = false;
            }

            function moveRight2() {
                sequence.jumpTo("right");
                sequence.running = true;
                anim_x.running = true;
            }
            function moveDown2() {
                sequence.jumpTo("down");
                sequence.running = true;
                anim_y.running = true;
            }
            function moveMinotavr2() {
                sequence2.jumpTo("up");
                sequence2.running = true;
                min_anim_x.running = true;
                min_anim_y.running = true;
            }

            Rectangle {
                id: rect_restart
                visible: false;
                anchors.centerIn: parent
                width: parent.width/2
                height: parent.height/3
                color: "#3D300B"
                border.color: "black"
                border.width: 5
                radius: 10

                Button {
                    anchors.centerIn: parent;
                    text: page.win_los
                    color: "white"
                    border.color: "black"

                    onVisibleChanged: {
                        sequence.visible = false;
                        sequence2.visible = false;
                        page.entrance_txt = ""
                        page.exit_txt = ""
                    }

                    onClicked: {
                        rect_restart.visible = false;
                        mycanvas.visible = true;
                        page.lifes = 3;
                        page.restartTimer()
                        page.field_iterator = 0;

                        sequence.visible = true;
                        sequence.running = false
                        sequence.x = 50;
                        sequence.y = 20;
                        sequence.x_copy = 50;
                        sequence.y_copy = 20;

                        sequence2.visible = true;
                        sequence2.running = false;
                        sequence2.x = 20;
                        sequence2.y = 140*4-50;
                        sequence2.x_copy = 50;
                        sequence2.y_copy = 20;

                        page.cnt_wins = 0;

                        page.entrance_txt = "Вход"
                        page.exit_txt = "Выход"
                    }
                }
            }

            Canvas {
                id: mycanvas
                width: parent.width
                height: parent.height
                onPaint: {
                    var shift = 140;
                    var ctx = getContext("2d");
                    ctx.fillStyle = "black";

                    for(var i = 0; i < 13; i++) {
                        ctx.fillRect(0, shift, width, 5);
                        shift+=140;
                    }
                    shift = 144;
                    for(var j = 0; j < 13; j++) {
                        ctx.fillRect(shift, 0, 5, height);
                        shift+=140;
                    }

                    ctx.fillStyle = "#78652B";

                    ctx.fillRect(140+10, 140*4, width/5-10, 9);
                    ctx.fillRect(10, 140*2, width/5-10, 9);
                    ctx.fillRect(10, 140, width/5-10, 9);
                    ctx.fillRect(140+10, 140*2, width/5-10, 9);
                    ctx.fillRect(140+10, 140, width/5-10, 9);
                    ctx.fillRect(10, 140*4, width/5-10, 9);
                    ctx.fillRect(140*2+10, 140, width/5-10, 9);
                    ctx.fillRect(140*3+10, 140, width/5-10, 9);
                    ctx.fillRect(140*4+10, 140, width/5-10, 9);
                    ctx.fillRect(140*4+10, 140*3, width/5-10, 9);
                    ctx.fillRect(140*4+10, 140*4, width/5-10, 9);
                    ctx.fillRect(140*3+10, 140*4, width/5-10, 9);
                    ctx.fillRect(140*2+10, 140*3, width/5-10, 9);
                    ctx.fillRect(140*2+10, 140*2, width/5-10, 9);

                    ctx.fillRect(140, 140*3+5, 9, height/5-8);
                    ctx.fillRect(140, 140+5, 9, height/5-8);
                    ctx.fillRect(140*2, 140*4+5, 9, height/5-8);
                    ctx.fillRect(140*2, 140*3+5, 9, height/5-8);
                    ctx.fillRect(140, 140+5, 9, height/5-8);
                    ctx.fillRect(140*2, 140+5, 9, height/5-8);
                    ctx.fillRect(140*3, 5, 9, height/5-8);
                    ctx.fillRect(140*4, 5, 9, height/5-8);
                    ctx.fillRect(140*4, 140*2+5, 9, height/5-8);
                    ctx.fillRect(140*4, 140*3+5, 9, height/5-8);
                    ctx.fillRect(140*3, 140*2+5, 9, height/5-8);

                }
                //color: "#78652B"
            }

            Text {
                id: text_1
                x: 30;
                y: 20;
                text: entrance_txt
                color: "white"
                font.pointSize: 30
                font.family: "Helvetica"
            }

            Text {
                id: text_2
                x: 140*4+15;
                y: 140*4+50;
                text: exit_txt
                color: "white"
                font.pointSize: 30
                font.family: "Helvetica"
            }

            Image {
                x:70;
                y:70;
                id: image1;
                source: "https://art.pixilart.com/66094e826e621be.png";
                visible: false
            }

            Image {
                x:70;
                y:70;
                id: minotavr;
                source: "https://forum.evanotend.com/uploads/monthly_2017_03/58d24a9b1816e_attack(2).png.ea825b83d6771a2bd8d306ed57b59500.png";
                visible: false
            }

            SpriteSequence {
                x: 20;
                y: 140*4-50;
                z: 1
                //anchors.centerIn: parent
                id: sequence2;
                width: 100;
                height: 180;
                //interpolate: false;
                running: false;

                property int x_copy: 50
                property int y_copy: 20

                onXChanged: {
                    if(x == x_copy+140) {
                        sequence.running = false;
                        x_copy = x;
                    }
                }

                onYChanged: {
                    if(y == y_copy+140) {
                        sequence.running = false;
                        y_copy = y;
                    }
                }

                sprites: [
                    Sprite {
                        name: "stay";
                        source: minotavr.source;
                        frameCount: 1;
                        frameWidth: minotavr.width/9;
                        frameHeight: minotavr.height/8;
                        frameRate: 1;
                    },
                    Sprite {
                        name: "up";
                        source: minotavr.source;
                        frameCount: 9;
                        frameWidth: minotavr.width/9;
                        frameHeight: minotavr.height/8;
                        frameRate: 5;
                    }
                ]
            }

            NumberAnimation {
                id: min_anim_x;
                target: sequence2
                properties: "x"
                duration: 1500
                to: sequence.x-30
                running: false;
            }

            NumberAnimation {
                id: min_anim_y;
                target: sequence2
                properties: "y"
                duration: 1500
                to: sequence.y-20
                running: false;
            }

             NumberAnimation {
                 id: anim_x;
                 target: sequence
                 properties: "x"
                 duration: 1500
                 to: sequence.x+140
                 running: false;
             }

             NumberAnimation {
                 id: anim_y;
                 target: sequence
                 properties: "y"
                 duration: 1500
                 to: sequence.y+140
                 running: false;
             }

             SpriteSequence {
                 x:50;
                 y:20;
                 z: 0
                 //anchors.centerIn: parent
                 id: sequence;
                 width: 50;
                 height: 100;
                 //interpolate: false;
                 running: false;

                 property int x_copy: 50
                 property int y_copy: 20

                 onXChanged: {
                     if(x == x_copy+140) {
                         sequence.running = false;
                         x_copy = x;
                     }
                 }

                 onYChanged: {
                     if(y == y_copy+140) {
                         sequence.running = false;
                         y_copy = y;
                     }
                 }

                 sprites: [
                     Sprite {
                         name: "down";
                         source: image1.source;
                         frameCount: 4;
                         frameWidth: image1.width/4;
                         frameHeight: image1.height/4;
                         frameRate: 10;
                     },
                     Sprite {
                         name: "right";
                         source: image1.source;
                         frameCount: 4;
                         frameY: image1.height/4*3;
                         frameWidth: image1.width/4;
                         frameHeight: image1.height/4;
                         frameRate: 10;
                     }
                 ]
             }
            //focus: true;

            width: parent.width
            height: parent.height
            color: "#78652B"
            border.color: "black"
            border.width: 10
        }
    }

    Item {
        id: footer
        anchors.top: body.bottom
        width: parent.width
        height: parent.height/3.3

        Rectangle {
            id: footer_rect1

            width: parent.width
            height: parent.height/3
            color: "#3D300B"
            border.color: "black"
            border.width: 5
            radius: 10

            Text {
                id: text_footer_rect1
                anchors.top: parent.top
                anchors.topMargin: 20
                //anchors.horizontalCenter: parent.horizontalCenter
                anchors.centerIn: parent
                text: page.num1 + " + " + page.num2 + " = "
                color: "white"
                font.pointSize: 40
                font.family: "Helvetica"
            }
        }
        Rectangle {
            id: footer_rect

            Text {
                id: text_footer
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Выберите вариант:"
                color: "white"
                font.pointSize: 40
                font.family: "Helvetica"
            }

            Rectangle {
                id: rect1
                //anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: text_footer.bottom
                anchors.topMargin: 10

                width: parent.width/4
                height: parent.height/2
                color: "#625328"
                border.color: "black"
                border.width: 5
                radius: 10

                property int btn_text: 0

                Button {
                    width: parent.width
                    height: parent.height
                    text: page.answer
                    color: "white"
                    backgroundColor: "transparent"

                    onClicked: {
                        if(page.answer === page.real_answer) {
                            if(page.field[page.field_iterator] === 0) {
                                page.moveD();
                            }
                            else {
                                page.moveR();
                            }
                            field_iterator++;

                            page.restartTimer();
                            page.cnt_wins++;
                            if(cnt_wins == page.cnt_for_win) {
                                console.log("Winner");
                                page.stopTimer();
                                page.showWin();
                            }
                        }
                        else {
                            page.restartTimer();
                            if(page.lifes > 0)
                                page.lifes--;
                            if(page.lifes == 0) {
                                console.log("Looser");
                                page.stopTimer();
                                page.showRestart()
                            }
                        }
                    }
                }
            }
            Rectangle {
                id: rect2
                //anchors.centerIn: parent
                anchors.top: text_footer.bottom
                anchors.topMargin: 10
                anchors.left: rect1.right
                anchors.leftMargin: 70

                width: parent.width/4
                height: parent.height/2
                color: "#625328"
                border.color: "black"
                border.width: 5
                radius: 10

                property int btn_text: 0

                Button {
                    width: parent.width
                    height: parent.height
                    text: page.ans_num1
                    color: "white"
                    backgroundColor: "transparent"

                    onClicked: {
                        if(page.ans_num1 === page.real_answer) {
                            if(page.field[page.field_iterator] === 0) {
                                page.moveD();
                            }
                            else {
                                page.moveR();
                            }
                            field_iterator++;

                            page.restartTimer();
                            page.cnt_wins++;
                            if(cnt_wins == page.cnt_for_win) {
                                console.log("Winner");
                                page.stopTimer();
                                page.showWin();
                            }
                        }
                        else {
                            page.restartTimer();
                            if(page.lifes > 0)
                                page.lifes--;
                            if(page.lifes == 0) {
                                console.log("Looser");
                                page.stopTimer();
                                page.showRestart()
                            }
                        }
                    }
                }
            }
            Rectangle {
                id: rect3
                //anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.top: text_footer.bottom
                anchors.topMargin: 10

                width: parent.width/4
                height: parent.height/2
                color: "#625328"
                border.color: "black"
                border.width: 5
                radius: 10

                property int btn_text: 0

                Button {
                    width: parent.width
                    height: parent.height
                    text: page.ans_num2
                    color: "white"
                    backgroundColor: "transparent"

                    onClicked: {
                        if(page.ans_num2 === page.real_answer) {
                            if(page.field[page.field_iterator] === 0) {
                                page.moveD();
                            }
                            else {
                                page.moveR();
                            }
                            field_iterator++;

                            page.restartTimer();
                            page.cnt_wins++;
                            if(cnt_wins == page.cnt_for_win) {
                                console.log("Winner");
                                page.stopTimer();
                                page.showWin();
                            }
                        }
                        else {
                            page.restartTimer();
                            if(page.lifes > 0)
                                page.lifes--;
                            if(page.lifes == 0) {
                                console.log("Looser");
                                page.stopTimer();
                                page.showRestart()
                            }
                        }
                    }
                }
            }

            width: parent.width
            height: parent.height-footer_rect1.height
            anchors.top: footer_rect1.bottom
            color: "#3D300B"
            border.color: "black"
            border.width: 5
            radius: 10
        }
    }

}
