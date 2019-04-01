#ifndef NETWORK_H
#define NETWORK_H

#include <QObject>
#include <QtNetwork/QTcpSocket>
#include <QtNetwork/QHostAddress>
#include <QByteArray>

class network : public QObject
{
    Q_OBJECT

public:
    explicit network(QObject *parent = 0);

    Q_INVOKABLE void sendIpToClient(QString str);
    Q_INVOKABLE void sendPortToClient(QString str);
    Q_INVOKABLE void setIpAndPort();

    Q_INVOKABLE void qmlToCXX(QString str);
    Q_INVOKABLE QString getDatafromServer();
private:
    void sendDataToServer();

    QTcpSocket *tcpClient;
    QString ip;
    unsigned short port;

    QString qmlData;
    QString serverData;
signals:
    void sendData(QString str);
 };

#endif // NETWORK_H
