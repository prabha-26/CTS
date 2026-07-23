using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Confluent.Kafka;  

namespace Handson6_KafkaChatApplication
{
    public partial class Form1 : Form
    {
        private readonly string bootstrapServers = "localhost:9092";
        private readonly string topic = "chat-topic";
        public Form1()
        {
            InitializeComponent();

            StartConsumer();
        }

        private async void btnSend_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtMessage.Text))
                return;

            var config = new ProducerConfig
            {
                BootstrapServers = bootstrapServers
            };

            using (var producer = new ProducerBuilder<Null, string>(config).Build())
            {
                await producer.ProduceAsync(topic,
                    new Message<Null, string>
                    {
                        Value = txtMessage.Text
                    });
            }

            txtMessage.Clear();
        }
        private void StartConsumer()
        {
            Task.Run(() =>
            {
                try
                {
                    var config = new ConsumerConfig
                    {
                        BootstrapServers = bootstrapServers,
                        GroupId = Guid.NewGuid().ToString(),
                        AutoOffsetReset = AutoOffsetReset.Earliest
                    };

                    using (var consumer = new ConsumerBuilder<Ignore, string>(config).Build())
                    {
                        consumer.Subscribe(topic);

                        while (true)
                        {
                            var result = consumer.Consume();

                            Invoke(new Action(() =>
                            {
                                rtbMessages.AppendText(result.Message.Value + Environment.NewLine);
                            }));
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            });
        }
    }
}
