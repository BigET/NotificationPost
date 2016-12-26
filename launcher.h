#ifndef LAUNCER_H
#define LAUNCER_H

#include <QProcess>
#include <QVariant>

class Launcher : public QProcess
{
    Q_OBJECT

public:
    Launcher(QObject *parent = 0) : QProcess(parent) { }

    Q_INVOKABLE void start(const QString &program, const QVariantList &arguments) {
        QStringList args;

        // convert QVariantList from QML to QStringList for QProcess

        for (int i = 0; i < arguments.length(); i++)
            args << arguments[i].toString();

        QProcess::start(program, args);
    }
    Q_INVOKABLE void start(int mode) {
        QProcess::start((QIODevice::OpenMode)mode);
    }

    bool isRunning() const {
        return NotRunning != state();
    }

    Q_PROPERTY(QString programName READ program WRITE setProgram)
    Q_PROPERTY(QStringList arguments READ arguments WRITE setArguments)
    Q_PROPERTY(bool isRunning READ isRunning)

    Q_INVOKABLE QByteArray readAll() {
        return QProcess::readAll();
    }
};

#endif // LAUNCER_H
