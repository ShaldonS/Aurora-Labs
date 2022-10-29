#include <QScopedPointer>
#include <QGuiApplication>
#include <QQuickView>

#include <sailfishapp.h>
#include "counter.h"
#include "list_of_string.h"

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(SailfishApp::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.auroraos"));
    application->setApplicationName(QStringLiteral("Lab_7"));

    QScopedPointer<QQuickView> view(SailfishApp::createView());
    view->setSource(SailfishApp::pathTo(QStringLiteral("qml/Lab_7.qml")));
    view->show();
    qmlRegisterType<MyClass>("harbour.appname.MyModule", 1, 0, "MyClass");
    qmlRegisterType<list_of_string>("harbour.appname.MyModule", 1, 0, "MyList");

    return application->exec();
}
