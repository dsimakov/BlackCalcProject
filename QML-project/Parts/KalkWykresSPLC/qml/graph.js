
//points on "Canvas"
var pointzeroX
var pointzeroY


var pointsArray =[]

//maths
function sin(x)
{
    return Math.sin(x)
}

function cos(x)
{
    return Math.cos(x)
}

function tan(x)
{
    return Math .tan(x)
}

function cot(x)
{
    return 1/Math.tan(x)
}

function log(x)
{
    return Math.log(x)
}

function testDrawSin()
{
    objectToDrawInto.functionToDraw="sin(x)"


}


function drawGraph(objectToDrawInto,minXtoCount,maxXtoCount) {
    var entryPixelLeftX=diagonalLine.axisSizeToPixelX(minXtoCount);
    var endPixelRightX=diagonalLine.axisSizeToPixelX(maxXtoCount);
    diagonalLine.setMinMaxToCalc(minXtoCount,maxXtoCount);
    for(var i=entryPixelLeftX;i<endPixelRightX;++i)
    {
        var x=diagonalLine.pixelToAxisSizeX(i);
        var result=eval(diagonalLine.functionToDraw);
        var y=diagonalLine.axisSizeToPixelY(result);
        diagonalLine.addPoint(i,y);
    }
}
