#include <QGuiApplication>
//#include <QQmlApplicationEngine>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    view.setFlags(Qt::FramelessWindowHint); // she zhi wu bian kuang
    view.setColor(QColor(Qt::transparent)); // she zhi tou ming
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));

    view.show();
//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
