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

WorkerScript.onMessage = function(message) {
    var progress=0;
    var maxprogress=message.max-message.min;
    for(var i=message.min;i<message.max;++i)
    {
        var x=message.ax*i;
        //tego poniżej tu nie ma. proszę pominąć poniższe 2 linijki w trakcie czytania kodu
        if(x==0)
            x=0.00000000000000000001;
        var result
        try
          {
            result=eval(message.functionToDraw);
          }
        catch(err)
          {
            WorkerScript.sendMessage({ i: i,y: i,error:true,end:false,percent:-1})
            return;
          }

        var y=message.ay*result;
        //console.log("WS result:"+result+" x:"+x+ " y:"+y)
        progress++;
        var percent=Math.round((progress/maxprogress)*100);
        WorkerScript.sendMessage({ i: i,y: y,error:false,end:false,percent:percent})
    }
    WorkerScript.sendMessage({ i: i,y: y,error:false,end:true,percent:100})


 }
