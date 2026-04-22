#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebView/QtWebView>
#include <QFile>
#include <QTextStream>
#include <QQmlContext>
QMap<QString, QString> loadEnv(const QString &path) {
    QMap<QString, QString> env;
    QFile file(path);
    if (!file.open(QIODevice::ReadOnly)) return env;
    QTextStream in(&file);
    while (!in.atEnd()) {
        QString line = in.readLine().trimmed();
        if (line.isEmpty() || line.startsWith('#')) continue;
        int eq = line.indexOf('=');
        if (eq < 0) continue;
        env[line.left(eq).trimmed()] = line.mid(eq + 1).trimmed();
    }
    return env;
}
int main(int argc, char *argv[])
{
     QtWebView::initialize();
    QGuiApplication app(argc, argv);
     auto env = loadEnv("/home/joost/Documents/GitHub/ford_app/.env");

    QQmlApplicationEngine engine;
     engine.rootContext()->setContextProperty("MAPBOX_TOKEN", env.value("MAPBOX_TOKEN", ""));
    engine.addImportPath("/home/joost/Qt/6.11.0/gcc_64/qml");
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("ford_app", "Main");


    return app.exec();
}
