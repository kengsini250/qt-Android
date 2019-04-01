#include "network.h"

network::network(QObject *parent) : QObject(parent)
{
    tcpClient= new QTcpSocket(this);

    connect(tcpClient,&QTcpSocket::readyRead,
            [=]()
    {
        QByteArray temp = tcpClient->readAll();
        serverData=temp;
        emit sendData(temp);
    });
}

void network::sendIpToClient(QString str)
{
    ip=str;
}

void network::sendPortToClient(QString str)
{
    port=str.toUShort();
}

void network::setIpAndPort()
{
    tcpClient->connectToHost(ip,port,QTcpSocket::ReadWrite);
    tcpClient->write("\nhahahahaha");
}

void network::qmlToCXX(QString str)
{
    qmlData=str;
    sendDataToServer();
}

void network::sendDataToServer()
{
    tcpClient->write(qmlData.toUtf8());
}

QString network::getDatafromServer()
{
    return serverData;
}

