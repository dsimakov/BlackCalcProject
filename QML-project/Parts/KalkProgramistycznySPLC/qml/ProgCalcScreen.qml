import QtQuick 1.0
import "calcFunctions.js" as CalcEngine
/*
 * Screen including ListView with selectable items.
 *
 */
Screen {
    id: screen

    property string multiplication : "\u00d7"


    //logic
    property string xor : "\u2295"
    property string or : "\u2228"
    property string not : "\u00AC"
    property string and : "\u2227"

    function doOp(operation) { CalcEngine.doOperation(operation) }

    Gradient {
        id: normal
        GradientStop { position: 0.5; color: "#7690B3" }
        GradientStop { position: 0.7; color: "#4A6C9B" }
        GradientStop { position: 1.0; color: "#4A6C9B" }
    }

    Gradient{
        id: functions
        GradientStop { position: 0.5; color: "#cda4c9" }
        GradientStop { position: 0.7; color: "#9b4a94" }
        GradientStop { position: 1.0; color: "#9b4a94" }
    }

    Gradient{
        id: operations
        GradientStop { position: 0.5; color: "#a8cda4" }
        GradientStop { position: 0.7; color: "#549b4a" }
        GradientStop { position: 1.0; color: "#549b4a" }
    }


    Column {
                id: box; spacing: 8
                anchors.top: topBarBottom
                        width:parent.width
                        height: parent.height- (parent.height / 11)
                Display {
                    id: display
                    width: parent.width
                    height: parent.height/5

                }

                Column {
                    id: column; spacing: 6

                    property real h: ((box.height - 72) / 6) - ((spacing * (6 - 1)) / 6)
                    property real w: (box.width / 7) - ((spacing * (7 - 1)) / 7)
                    property real wsys: (box.width / 4) - ((spacing * (4 - 1)) / 4)
                    property real hfun: ((box.height - (3*h)-display.height) / 2) - ((spacing * (4 - 1)) / 6)

                    Row {
                        spacing: 6
                        Button { width: column.w; height: column.h; color: 'purple'; operation: and}
                        Button { width: column.w; height: column.h; color: 'purple'; operation: or }
                        Button { width: column.w; height: column.h; color: 'purple'; operation: xor }
                        Button { width: column.w; height: column.h; color: 'purple'; operation: not }
                        Button { width: column.w; height: column.h; color: 'purple'; operation: "SHL" }
                        Button { width: column.w; height: column.h; color: 'purple'; operation: "SHR" }
                        Button { width: column.w; height: column.h; color: 'purple'; operation: "CLEAR" }
                    }

                    Row {
                        spacing: 6
                        property real w: (box.width / 4) - ((spacing * (4 - 1)) / 4)

                        Button {id: bin; width: column.wsys; height: column.h; color: 'green'; operation: "BIN" }
                        Button {id: oct; width: column.wsys; height: column.h; color: 'green'; operation: "OCT" }
                        Button {id: dec; width: column.wsys; height: column.h; color: 'orange'; operation: "DEC" }
                        Button {id: hex; width: column.wsys; height: column.h; color: 'green'; operation: "HEX" }
                    }

                    Column {
                        id: column2; spacing: 6
                        width: 3*parent.width/4;

                    Grid {
                        id: grid; rows: 2; columns: 8; spacing: 6

                        property real w: (column2.width / columns) - ((spacing * (columns - 1)) / columns)

                        Button {id:zero; width: grid.w; height: column.hfun; operation: "0"; color: 'blue' }
                        Button {id:one; width: grid.w; height: column.hfun; operation: "1"; color: 'blue' }
                        Button {id:two; width: grid.w; height: column.hfun; operation: "2"; color: 'blue' }
                        Button {id:three; width: grid.w; height: column.hfun; operation: "3"; color: 'blue' }
                        Button {id:four; width: grid.w; height: column.hfun; operation: "4"; color: 'blue' }
                        Button {id:five; width: grid.w; height: column.hfun; operation: "5"; color: 'blue' }
                        Button {id:six; width: grid.w; height: column.hfun; operation: "6"; color: 'blue' }
                        Button {id:seven; width: grid.w; height: column.hfun; operation: "7"; color: 'blue' }
                        Button {id:eight; width: grid.w; height: column.hfun; operation: "8"; color: 'blue' }
                        Button {id:nine; width: grid.w; height: column.hfun; operation: "9"; color: 'blue' }
                        Button {id:a; width: grid.w; height: column.hfun; operation: "A"; color: 'gray' }
                        Button {id:b; width: grid.w; height: column.hfun; operation: "B"; color: 'gray' }
                        Button {id:c; width: grid.w; height: column.hfun; operation: "C"; color: 'gray' }
                        Button {id:d; width: grid.w; height: column.hfun; operation: "D"; color: 'gray' }
                        Button {id:e; width: grid.w; height: column.hfun; operation: "E"; color: 'gray' }
                        Button {id:f; width: grid.w; height: column.hfun; operation: "F"; color: 'gray' }
                    }
                    }

                    Column {
                        id: column3; spacing: 6
                        width: parent.width/4;
                        anchors.left: column2.right
                        anchors.top: column2.top
                        Grid {
                            id: grid2; rows: 2; columns: 2; spacing: 6

                            property real w: (column3.width / columns) - ((spacing * (columns - 1)) / columns)

                            Button { width: grid2.w; height: column.hfun; operation: "+"; color: 'blue' }
                            Button { width: grid2.w; height: column.hfun; operation: "-"; color: 'blue' }
                            Button { width: grid2.w; height: column.hfun; operation: multiplication; color: 'blue' }
                            Button { width: grid2.w; height: column.hfun; operation: "="; color: 'red' }

                        }
                }
            }
        }
}
