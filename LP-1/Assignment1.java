// package com.mkyong;

// import java.util.concurrent.Semaphore;

// public class SemaphoreTest {

// 	// max 4 people
// 	static Semaphore semaphore = new Semaphore(4);

// 	static class MyATMThread extends Thread {

// 		String name = "";

// 		MyATMThread(String name) {
// 			this.name = name;
// 		}

// 		public void run() {

// 			try {

				
// 				System.out.println(name + " : acquiring lock...");
// 				System.out.println(name + " : available Semaphore permits now: " 
// 								+ semaphore.availablePermits());
				
// 				semaphore.acquire();
// 				System.out.println(name + " : got the permit!");

// 				try {

// 					for (int i = 1; i <= 5; i++) {

// 						System.out.println(name + " : is performing operation " + i 
// 								+ ", available Semaphore permits : "
// 								+ semaphore.availablePermits());

// 						// sleep 1 second
// 						Thread.sleep(1000);

// 					}

// 				} finally {

// 					// calling release() after a successful acquire()
// 					System.out.println(name + " : releasing lock...");
// 					semaphore.release();
// 					System.out.println(name + " : available Semaphore permits now: " 
// 								+ semaphore.availablePermits());

// 				}

// 			} catch (InterruptedException e) {

// 				e.printStackTrace();

// 			}

// 		}

// 	}

// 	public static void main(String[] args) {

// 		System.out.println("Total available Semaphore permits : " 
// 				+ semaphore.availablePermits());
	
// 		MyATMThread t1 = new MyATMThread("A");
// 		t1.start();

// 		MyATMThread t2 = new MyATMThread("B");
// 		t2.start();

// 		MyATMThread t3 = new MyATMThread("C");
// 		t3.start();

// 		MyATMThread t4 = new MyATMThread("D");
// 		t4.start();

// 		MyATMThread t5 = new MyATMThread("E");
// 		t5.start();

// 		MyATMThread t6 = new MyATMThread("F");
// 		t6.start();

// 	}
// }

// new code my

// package a131;

import java.util.concurrent.Semaphore;

class Semaphore_use {
	int item;
	static Semaphore semConsumer = new Semaphore(0);
	static Semaphore semProducer = new Semaphore(1);
	

	void get()
	{
		try {
			System.out.println(item + " : Aquiring Lock...");
			System.out.println(item + " : Available Semaphore permits now : " + semConsumer.availablePermits());
			semConsumer.acquire();
			System.out.println(item + " : Got the permit!");
			try {
				System.out.println("Consumer item : " + item);
				
				Thread.sleep(1000);
			}
			finally {
				System.out.println(item + " : Releasing lock..");
				semProducer.release();
				System.out.println(item + " : available Semaphore permits now: " 
					+ semProducer.availablePermits());
			}
		}
		catch (InterruptedException e) {
			System.out.println("Exception");
		}

	}
	void put(int item) {
		try {
			System.out.println(item + " : Aquiring Lock...");
			System.out.println(item + " : Available Semaphore permits now : " + semProducer.availablePermits());
			semProducer.acquire();
			System.out.println(item + " : Got the permit!");
			try {
				this.item=item;
				System.out.println("Producer item : " + item);
				Thread.sleep(1000);
			}
			finally {
				System.out.println(item + " : Releasing lock..");
				semConsumer.release();
				System.out.println(item + " : available Semaphore permits now: " 
					+ semConsumer.availablePermits());
			}
			
		}
		catch (InterruptedException e) {
			System.out.println("Exception");
		}
		
		
	}
}

class Producer extends  Thread {
	Semaphore_use q;
	Producer(Semaphore_use q)
	{
		this.q = q;
		new Thread(this, "Producer").start();
	}

	public void run()
	{
			for (int i = 0; i < 5; i++)
				q.put(i);
	}
}

class Consumers implements Runnable{
	Semaphore_use q;
	Consumers(Semaphore_use q)
	{
		this.q = q;
		new Thread(this, "Consumers").start();
	}

	public void run()
	{
		for (int i = 0; i < 5; i++)
			q.get();
	}
}

class Assignment1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("hello");
		Semaphore_use q = new Semaphore_use();
		new Consumers(q);
		new Producer(q);
	}

}





