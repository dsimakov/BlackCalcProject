
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

function abs(x)
{
    return Math.abs(x)
}

function exp(x)
{
    return Math.exp(x)
}

function pow(x,y)
{
    return Math.pow(x,y)
}

function testDrawSin()
{
    objectToDrawInto.functionToDraw="sin(x)"
}


function prepareFrameList(elementsCount,functionToDraw)
{
    //console.log(functionToDraw)
    var entryPixelLeftX=diagonalLine.axisSizeToPixelX(diagonalLine.getLeftX());
    //diagonalLine.clearCanvas();
    var i=entryPixelLeftX
    var j;
    for(j=0;j<elementsCount;++j)
    {
        var x=diagonalLine.pixelToAxisSizeX(i);
        //tego poniżej tu nie ma. proszę pominąć poniższe 2 linijki w trakcie czytania kodu
        if(x==0)
            x=0.00000000000000000001;
        var result
        try
          {
            result=eval(functionToDraw);
          }
        catch(err)
          {
            errorRect.visible=true;
          }
        var y=diagonalLine.axisSizeToPixelY(result);
        diagonalLine.addRightPoint(y)
        //console.log("add point result:"+result+" x:"+x+" y:"+y)
        i++;
    }
    diagonalLine.updateCanvas()
}

function recalc(functionToDraw,i)
{
    var x=diagonalLine.pixelToAxisSizeX(i);
    //tego poniżej tu nie ma. proszę pominąć poniższe 2 linijki w trakcie czytania kodu
    if(x==0)
        x=0.00000000000000000001;
    var result=eval(functionToDraw);

    var y=diagonalLine.axisSizeToPixelY(result);
    //console.log("add point result:"+result+" x:"+x+" y:"+y+" i:"+i)
    return y;
}
