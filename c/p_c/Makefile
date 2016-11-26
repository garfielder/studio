runconsumer: runproducer consumer
	sudo ./consumer
runproducer:  producer
	sudo ./producer
producer: producer.c
	gcc producer.c -g -o producer -lrt
consumer: consumer.c
	gcc consumer.c -g -o consumer -lrt
clean:
	rm producer consumer  > /dev/null 2>&1
	
	
