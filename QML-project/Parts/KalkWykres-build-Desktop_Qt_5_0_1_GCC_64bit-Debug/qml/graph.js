
//points on "Canvas"
var pointzeroX
var pointzeroY


var pointsArray =[]

//maths
function sin(x)
{
    return Math.sin(x)
}

function recalculateScales(objectToDrawInto,leftX,rightX,upY,downY)
{
    objectToDrawInto.leftX=leftX
    objectToDrawInto.rightX=rightX
    objectToDrawInto.upY=upY
    objectToDrawInto.downY=downY
   // pointzeroY

    //przygotowanie do rysowania osi
    if (!((leftX>0) || (rightX<0)))
    {
        objectToDrawInto.ratioY=Math.abs(upY)/(Math.abs(downY)+Math.abs(upY));

        objectToDrawInto.zeroY=objectToDrawInto.height*objectToDrawInto.ratioY
    }

    if (!((downY>0) || (upY<0)))
    {
        objectToDrawInto.ratioX=Math.abs(leftX)/(Math.abs(leftX)+Math.abs(rightX));
        objectToDrawInto.zeroX=objectToDrawInto.width*objectToDrawInto.ratioX
    }

    //SKALOWANIE
    //jeśli różne znaki
    objectToDrawInto.scaleX=(Math.abs(leftX)+Math.abs(rightX))/objectToDrawInto.width
    objectToDrawInto.scaleY=-objectToDrawInto.height/(Math.abs(upY)+Math.abs(downY)) //minus z powodu, że na górze osi Y jest zero a na dole full
    //jeśli takie same
//TODO


}


function testDrawSin(objectToDrawInto)
{
    objectToDrawInto.functionToDraw="sin(x)"


}

function drawGraph(objectToDrawInto) {

    //check if axises are visible
    var component = Qt.createComponent("Line.qml");
    if (!((objectToDrawInto.leftX>0) || (objectToDrawInto.rightX<0)))
    {
        //draw axis


    var axisX = component.createObject(objectToDrawInto);
    axisX.x1=0
    axisX.y1=objectToDrawInto.zeroY+1
    axisX.x2=objectToDrawInto.width
    axisX.y2=objectToDrawInto.zeroY
    axisX.color= "black"

    var axisY = component.createObject(objectToDrawInto);
    axisY.x1=objectToDrawInto.zeroX+1
    axisY.y1=0
    axisY.x2=objectToDrawInto.zeroX
    axisY.y2=objectToDrawInto.height
    axisY.color= "black"
    }

    //draw function

    var previousy = 0
    var x=0
    var y=0
           for (var i=0; i<objectToDrawInto.width; i++) {
               x =  objectToDrawInto.leftX+(i*objectToDrawInto.scaleX);
               //minus przy sinusie z powodu że wartości na osi Y są na odwrót
               y = (eval(objectToDrawInto.functionToDraw)*objectToDrawInto.scaleY)+objectToDrawInto.zeroY
               var object = component.createObject(objectToDrawInto);
               object.x1=i-1
               object.y1=previousy
               object.x2=i
               object.y2=y
               object.color="black"
               pointsArray.push(object)
               previousy = y
           }

}
