var grade_list =[];

function deleteGrade(id)
{
    grade_list.splice(id,1)
}

function clearGradeList()
{
    grade_list.splice(0,grade_list.length)
}

function addGrade(grade,weight)
{
    grade_list.push([grade,weight])
}

function makeList(id){
    var srednia=0.0
    var wagi=0
    id.clear();
    for(var i=0;i<grade_list.length;++i)
    {
        if(grade_list[i][1]>0){
        srednia+=grade_list[i][0]*grade_list[i][1]
        wagi+=grade_list[i][1]}
        id.append({"key":"Ocena: "+grade_list[i][0].toString()+" waga: "+grade_list[i][1].toString()})
    }
    if(wagi==0)
    {
        avgtext.number="Brak"
        avgtext.number_weight=0
    }
    else
    {
        var tmp
        tmp=srednia/wagi
        avgtext.number=tmp.toString(10)
        avgtext.number_weight=wagi
    }
}
