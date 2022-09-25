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
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
    }

    /*Item {
        id: task_1
        width: parent.width
        height: parent.height
        TextField {
            width: parent.width
            height: parent.height
            placeholderText: "Enter text"
            color: "black"
        }
    }*/

    /*Item {
        id: task_2
        width: parent.width
        height: parent.height

        Button {
            property string _color: "yellow"
            text: "Push me"
            backgroundColor: _color

            onClicked: _color = "red"
        }
    }*/

    /*Item {
        id: task_3
        width: parent.width
        height: parent.height

        Column {
            id: col_1
            property string cond: "Отпущена"
            property bool was_pressed: false
            Row {
                Button {
                    id: btn_1
                    text: "Push me"

                    onClicked: {
                        if(!col_1.was_pressed) {
                            col_1.cond = "Нажата"
                            col_1.was_pressed = true
                        }
                        else {
                            col_1.cond = "Отпущена"
                            col_1.was_pressed = false
                        }
                    }
                }
            }

            Row {
                Text {
                    id: text_1
                    text: col_1.cond
                }
            }
        }
    }*/

    /*Item {
        id: task_4
        width: parent.width
        height: parent.height

        Column {
            id: col_1
            Row {
                Button {
                    property int count: 0
                    id: btn_1
                    text: "Counter " + count

                    onClicked: {
                        count++;
                    }
                }
            }

            Row {
                Text {
                    id: text_1
                    text: "Counts the number of clicks"
                    color: "gray"
                }
            }
        }
    }*/

    /*Item {
        id: task_5
        width: parent.width
        height: parent.height

        DatePicker {
            date: new Date()
            monthYearVisible: true
            onDateChanged: console.log(date)
        }
    }*/

    /*Item {
        id: task_6
        width: parent.width
        height: parent.height

        TimePicker  {
            hour: 13
            minute: 30
            onTimeChanged: {console.log(timeText)}
        }
    }*/

    /*Item {
        id: task_7
        width: parent.width
        height: parent.height

        ComboBox {
            id: cmb_1
            currentIndex: 1
            width: parent.width/2
            label: "Выбор варианта"
            menu: ContextMenu {
                id: menu
                MenuItem { text: "Вариант 1" }
                MenuItem { text: "Вариант 2" }
                MenuItem { text: "Вариант 3" }
                MenuItem { text: "Вариант 4" }
                MenuItem { text: "Вариант 5" }
            }
            onCurrentIndexChanged: {console.log(value)}
        }
    }*/

    /*Item {
        id: task_7
        width: parent.width
        height: parent.height

        property string cond: "enabled"
        Text {
            id: text_1
            text: "Switcher: " + task_7.cond
        }

        Switch {
            checked: true
            onPressed: {
                if(checked) {
                    task_7.cond = "disabled"
                }
                else {
                    task_7.cond = "enabled"
                }
            }
        }
    }*/

    Item {
        id: task_8
        width: parent.width
        height: parent.height

        Column {
            width: parent.width
            height: parent.height
            spacing: 100
            Row {
                width: parent.width
                height: 40
                Slider {
                    id: slider_1
                    width: parent.width
                    maximumValue: 100.0
                    stepSize: 1.0
                    value: 20

                    onValueChanged: {
                        text_1.val = value
                    }
                }
            }
            Row {
                width: parent.width
                height: 40
                Text {
                    id: text_1
                    property int val: slider_1.value
                    text: "Current value: " + val.toString()
                }
            }
        }


    }
}


/*Column {
    id: col
    width: parent.width
    height: parent.height

    Row {
        id: row1
        width: parent.width
        height: parent.height
    }
}*/
