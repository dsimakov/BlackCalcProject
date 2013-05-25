
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


function drawGraph(objectToDrawInto) {
    var x
    var y
           for (var i=0; i<diagonalLine.width; i++) {
               //console.log(diagonalLine.functionToDraw);
               x =  diagonalLine.fleftX+(i*diagonalLine.fscaleX);
               console.log("fleftX:"+diagonalLine.fleftX+" fcaleX:"+diagonalLine.fscaleX+" x:"+x+" i:"+i);
               y = (eval(diagonalLine.functionToDraw)*diagonalLine.fscaleY)+diagonalLine.fzeroY
               //console.log("fzeroY:"+diagonalLine.fzeroY+" fcaleY:"+diagonalLine.fscaleY+" y:"+y);
               //diagonalLine.addPoint(x,y)
               diagonalLine.addPoint(x,y)
           }

}
