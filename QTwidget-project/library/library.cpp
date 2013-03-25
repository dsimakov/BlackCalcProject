#include "library.h"
#include "firstwindow.h"
#include "QImage"

FirstWindow *firstWindow;

extern "C"{
/**
 * Method inits and starts choose calc
 */

 void Q_DECL_EXPORT init()
{
     firstWindow=new FirstWindow();
     firstWindow->showMaximized();
}

 /**
  * Method returns info about calc for main stage of BlackCalc
  */
 QString Q_DECL_EXPORT getInfo()
 {
     QString info="Informacje na temat biblioteki, proszę uzupełnić";
    return info;
 }

 /**
  * Method returns icon for main stage of BlackCalc
  */

 QImage Q_DECL_EXPORT getIcon()
 {
     QImage result;
     QPixmap icon=QPixmap( ":/icons/mainIcon.png"); //icon stored in mainResources
     result=icon.toImage();
    return result;
 }

}
