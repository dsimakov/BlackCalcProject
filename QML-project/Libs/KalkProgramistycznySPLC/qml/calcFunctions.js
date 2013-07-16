var curVal = 0
 var lastOp = ""
var currentSystem= "DEC"

 function disabled(op) {
     if (op == "CLEAR") {
         return false;
     } else if (((op >="2" &&  op<="9") ||(op >="A" &&  op<="F")) && (currentSystem=="BIN") && (op!="DEC")) {
         return true
     }else if (((op >="A" &&  op<="F")) && (currentSystem=="DEC") && (op!="BIN")) {
         return true
     } else if (((op >="8" &&  op<="9") ||(op >="A" &&  op<="F")) && (currentSystem=="OCT") && (op!="DEC") && (op!="BIN")) {
         return true
     }else {
         return false
     }
 }

function disableButtons(){
    bin.color='green';
    oct.color=bin.color;
    dec.color=bin.color;
    hex.color=bin.color;
}

function setSystem(op)
{

    if(op=='BIN'){
        parseInt()
        if(currentSystem=='OCT')
        {
        display.text = (parseInt(display.text,8)).toString(2)
        }
        if(currentSystem=='DEC')
        {
        display.text = (parseInt(display.text,10)).toString(2)
        }
        if(currentSystem=='HEX')
        {
        display.text = (parseInt(display.text,16)).toString(2)
        }
        bin.color='orange';
        two.color="gray"
        three.color="gray"
        four.color="gray"
        five.color="gray"
        six.color="gray"
        seven.color="gray"
        eight.color="gray"
        nine.color="gray"
        a.color="gray"
        b.color="gray"
        c.color="gray"
        d.color="gray"
        e.color="gray"
        f.color="gray"
    }
    if(op=='OCT'){
        if(currentSystem=='BIN')
        {
        display.text = (parseInt(display.text,2)).toString(8)
        }
        if(currentSystem=='DEC')
        {
        display.text = (parseInt(display.text,10)).toString(8)
        }
        if(currentSystem=='HEX')
        {
        display.text = (parseInt(display.text,16)).toString(8)
        }
        oct.color='orange';
        two.color="blue"
        three.color="blue"
        four.color="blue"
        five.color="blue"
        six.color="blue"
        seven.color="blue"
        eight.color="gray"
        nine.color="gray"
        a.color="gray"
        b.color="gray"
        c.color="gray"
        d.color="gray"
        e.color="gray"
        f.color="gray"
    }
    if(op=='DEC'){
        if(currentSystem=='OCT')
        {
        display.text = (parseInt(display.text,8)).toString(10)
        }
        if(currentSystem=='BIN')
        {
        display.text = (parseInt(display.text,2)).toString(10)
        }
        if(currentSystem=='HEX')
        {
        display.text = (parseInt(display.text,16)).toString(10)
        }
        dec.color='orange';
        two.color="blue"
        three.color="blue"
        four.color="blue"
        five.color="blue"
        six.color="blue"
        seven.color="blue"
        eight.color="blue"
        nine.color="blue"
        a.color="gray"
        b.color="gray"
        c.color="gray"
        d.color="gray"
        e.color="gray"
        f.color="gray"
    }
    if(op=='HEX'){
        if(currentSystem=='OCT')
        {
        display.text = (parseInt(display.text,8)).toString(16)
        }
        if(currentSystem=='DEC')
        {
        display.text = (parseInt(display.text,10)).toString(16)
        }
        if(currentSystem=='BIN')
        {
        display.text = (parseInt(display.text,2)).toString(16)
        }
        hex.color='orange';
        two.color="blue"
        three.color="blue"
        four.color="blue"
        five.color="blue"
        six.color="blue"
        seven.color="blue"
        eight.color="blue"
        nine.color="blue"
        a.color="blue"
        b.color="blue"
        c.color="blue"
        d.color="blue"
        e.color="blue"
        f.color="blue"
    }
    currentSystem=op;
}

function convertToSystem()
{
    if(currentSystem=='BIN')
    {
    display.text = Number(Number(display.text.valueOf()).toString(10)).toString(2)
    }
    if(currentSystem=='OCT')
    {
    display.text = Number(Number(display.text.valueOf()).toString(10)).toString(8)
    }
    if(currentSystem=='DEC')
    {
    display.text = Number(Number(display.text.valueOf()).toString(10)).toString(10)
    }
    if(currentSystem=='HEX')
    {
    display.text = Number(Number(display.text.valueOf()).toString(10)).toString(16)
    }
}

function operationOnValue(op)
{
    var value

    if(currentSystem=='BIN')
    {
    value = parseInt(display.text,2)
    }
    if(currentSystem=='OCT')
    {
    value = parseInt(display.text,8)
    }
    if(currentSystem=='DEC')
    {
    value = parseInt(display.text,10)
    }
    if(currentSystem=='HEX')
    {
    value = parseInt(display.text,16)
    }

    if(op=='SHL')
    {
        value=value<<1;
    }
    if(op=='SHR')
    {
        value=value>>1;
    }
    if(op==not)
    {
        var tmp=value.toString(2)
        var tmpToDisplay="";
        var n=0;
        for (n=0;n<tmp.length;++n)
        {
            if(tmp[n]=='0')
                tmpToDisplay=tmpToDisplay+'1'
            else
                tmpToDisplay=tmpToDisplay+'0'
        }

        value=parseInt(tmpToDisplay,2);
    }

    if(op==and)
    {
        value=value&curVal
    }
    if(op==or)
    {
        value=value|curVal
    }
    if(op==xor)
    {
        value=value^curVal
    }
    if(op=="+")
    {
        value=value+curVal
    }
    if(op=="-")
    {
        value=value-curVal
    }
    if(op==multiplication)
    {
        value=value*curVal
    }

    display.text="";

    if(currentSystem=='BIN')
    {
        display.text = parseInt(value.toString(),10).toString(2)
    }
    if(currentSystem=='OCT')
    {
        display.text = parseInt(value.toString(),10).toString(8)
    }
    if(currentSystem=='DEC')
    {
        display.text = parseInt(value.toString(),10).toString(10)
    }
    if(currentSystem=='HEX')
    {
        display.text = parseInt(value.toString(),10).toString(16)
    }

}



 function doOperation(op) {
     if (disabled(op)) {
         return
     }

     if (op.toString().length==1 && ((op >= "0" && op <= "9") || (op >= "A" && op <= "F")) ) {
         if (display.text.toString().length >= 14)
             return; // No arbitrary length numbers
         if (lastOp.toString().length == 1 && ((lastOp >= "0" && lastOp <= "9") ) ) {
             display.text = display.text + op.toString()
         } else {
             display.text = op
         }
         lastOp = op
         //convertToSystem()
         return
     }
     else if(op=="BIN" ||op=="OCT" ||op=="DEC" ||op=="HEX" )
     {
         disableButtons();
         setSystem(op);
         return
     }

     lastOp = op

     if (display.currentOperation.text == "+") {
         operationOnValue("+");
     } else if (display.currentOperation.text == "-") {
         operationOnValue("-")
     } else if (display.currentOperation.text == multiplication) {
         operationOnValue(multiplication)
     } else if (display.currentOperation.text == or) {
         operationOnValue(or);
     } else if (display.currentOperation.text == and) {
         operationOnValue(and);
     } else if (display.currentOperation.text == xor) {
         operationOnValue(xor);
     }  else if (display.currentOperation.text == "=") {
     }

     if (op == "+" || op == "-" || op == multiplication ||op==and ||op== or  ||op==xor) {
         display.currentOperation.text = op

         if(currentSystem=='BIN')
         {
         curVal = parseInt(display.text,2)
         }
         if(currentSystem=='OCT')
         {
         curVal = parseInt(display.text,8)
         }
         if(currentSystem=='DEC')
         {
         curVal = parseInt(display.text,10)
         }
         if(currentSystem=='HEX')
         {
         curVal = parseInt(display.text,16)
         }
         return
     }

     curVal = 0
     display.currentOperation.text = ""

     if (op == "CLEAR") {
         curVal = 0
         lastOp = ""
         display.text ="0"
    } else if (op =="SHR" || op=="SHL"||op==not)
    {
        operationOnValue(op)
        return
    }
 }
