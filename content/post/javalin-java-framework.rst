javalin the lightweight java framework
======================================

.. tags: java
.. date: 2027-10-01 18:15:11

I'd like to introduce you all to Javalin_. Java is known for being heavy and
bloated, verbose, often flagged as bad choice for cold-start functions, or
simple MVPs or POCs. Often because it's slow, or memory-heavy consumer, which
I could agree with, on some situations.

This is specially interestring if you're coming from languages such as Go or
Typescript and is already familiar with express.js or chi from Golang. The
learning curve for a full Java backend app will be pretty smoth.

.. _Javalin: https://javalin.io/
.. read_more

Let's cut to the chase, no rambling, no time spent. Javalin is simple,
lightweight, interoperable, flexible, supports OpenAPI and runs on
top of Jetty JVM web-server, that includes SSL and HTTP3.

Here's what a Hello World would look like, if you're curious.

.. code:: java

  import io.javalin.Javalin;

  void main() {
    var app = Javalin.create(config -> {
      config.routes.get("/", ctx -> ctx.result("Hello World"));
    }).start(7070);
  }

And that's it! No *annotations* needed, controllers, or any of the boilerplate
that Springs like. As simple as that.

If you're a **maven** person, you can get started in the `maven-setup page`_, but
ify you're a **graddle** person, use the `graddle-setup page`_.

`On their page`_ there's plenty of useful tutorials and code snippets, check it
out. And now if you want to go straight to the code, find their GitHub repo at:
https://github.com/javalin/javalin

Native build
------------

Javalin also supports GraalVM. GraalVM builds are OS-native binaries, compiled
into full executable apps that can run without the JVM. This is super attractive
for Serverless and functions that needs cold-start within seconds. 

Here's an example from their main page: https://javalin.io/2018/09/27/javalin-graalvm-example.html
and if you want something more complete, including tests, Flyway migrations, and more,
you can take a look at this personal project: https://github.com/thermcampos/lin-order-java.

That's all for today. If you have any questions, I'll be happy to answer. Reach out by using
the comment system below or any of the link in the about page.

Thanks for reading.


.. _`maven-setup page`: https://javalin.io/tutorials/maven-setup
.. _`graddle-setup page`: https://javalin.io/tutorials/gradle-setup
.. _`On their page`: https://javalin.io/tutorials/
