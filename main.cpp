#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "network.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<network>("Network.module",1,0,"Network");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));    
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
