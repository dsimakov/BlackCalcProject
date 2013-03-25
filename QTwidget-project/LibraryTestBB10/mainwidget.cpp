#include "mainwidget.h"
#include "ui_mainwidget.h"
#include <QLibrary>
#include <QThread>

MainWidget::MainWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::MainWidget)
{
    ui->setupUi(this);
}

MainWidget::~MainWidget()
{
    delete ui;
}


void MainWidget::on_pushButton_clicked()
{
    typedef void (*initFunction)(void);

    QString pathToLibrary=ui->pathEdit->toPlainText();



    initFunction init =
            (initFunction) QLibrary::resolve(pathToLibrary, "init");
    init();
}

void MainWidget::on_GetInfoButton_clicked()
{

    typedef QString (*getInfoFunction)(void);
    typedef QImage (*getIconFunction)(void);

    QImage image;
    QString pathToLibrary=ui->pathEdit->toPlainText();

    getInfoFunction getInfo=(getInfoFunction) QLibrary::resolve(pathToLibrary, "getInfo");

    getIconFunction getIcon=(getIconFunction) QLibrary::resolve(pathToLibrary, "getIcon");

    image=getIcon();
    ui->iconLabel->setPixmap(QPixmap::fromImage(image));

    QString info=getInfo();
    ui->infoText->append(info);



}
