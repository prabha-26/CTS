# Handson6 - Kafka Chat Application

## Objective
Develop a simple chat application using Apache Kafka and Windows Forms.

## Technologies Used
- C#
- Windows Forms
- Apache Kafka 3.7.0
- ZooKeeper
- Confluent.Kafka NuGet Package

## Features
- Send messages using Kafka Producer
- Receive messages using Kafka Consumer
- Display received messages in a RichTextBox
- Real-time communication using Kafka Topic

## Kafka Configuration
Bootstrap Server:
```
localhost:9092
```

Topic:
```
chat-topic
```

## Steps to Run
1. Start ZooKeeper
2. Start Kafka Broker
3. Create topic:
```
kafka-topics.bat --create --topic chat-topic --bootstrap-server localhost:9092
```
4. Run the Windows Forms application.
5. Type a message and click **Send**.

## Output
Messages sent are displayed in the RichTextBox after being consumed from Kafka.