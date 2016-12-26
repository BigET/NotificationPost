#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "launcher.h"
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<Launcher>("Launcher", 1, 0, "Launcher");

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("Main.qml")));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.show();

    return app.exec();
}
