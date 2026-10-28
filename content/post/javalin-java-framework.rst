Javalin the lightweight java framework
======================================

.. tags: java
.. date: 2026-10-01 18:15:11
.. attachment-image:: javalin-the-lightweight-java-framework-header.png

I'd like to introduce you all to Javalin_. Java is known for being heavy and
bloated, verbose, often flagged as bad choice for cold-start functions, or
simple MVPs or POCs. Often because it's slow, or memory-heavy consumer, which
I could agree with, on some situations.

This is specially interesting if you're coming from languages such as Go or
Typescript and is already familiar with express.js or chi from Golang. The
learning curve for a full Java backend app will be pretty smooth.

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

If you're a **maven** person, you can get started in the `maven-setup page`_,
but if you're a **graddle** person, use the `graddle-setup page`_.

`On their page`_ there's plenty of useful tutorials and code snippets, check it
out. And now if you want to go straight to the code, find their GitHub repo at:
https://github.com/javalin/javalin

Native build
------------

Javalin supports GraalVM. GraalVM builds are OS-native binaries, compiled
into full executable apps that can run without the JVM. This is super attractive
for Serverless and functions that needs cold-start within seconds. 

Here's an example from their main page: 
https://javalin.io/2018/09/27/javalin-graalvm-example.html and if you want
something more complete, including tests, Flyway migrations, and more, you can
take a look at this personal project I'm building:
https://github.com/thermcampos/lin-order-java.

Javalin x Spring Boot
---------------------

I compared bundle size, dependencies, startup time, and JVM memory on both. The
results are very interesting.

Both applications has the same added dependencies, same endpoints, and the same
functions. They have Postgres database support and Flyway migration, added
on top of the *empty* project. For Spring Boot, I got it from the Spring
initializer page, and for Javalin, I got from the maven quickstart archetype.

In terms of endpoints, both have only:

* An index **/** that returns **Hello World**
* A hello **/hello/{name}** that returns **Hello {name}**

And here are the results.

* Bundle size - This is the fatjar
  
  * Javalin size was **9.4 MB**
  * Spring Boot size was **23 MB**
* Dependencies - Considering only runtime
  
  * Javalin had **44** dependencies
  * Spring Boot had **53** dependencies
* Startup time
  
  * Javalin took **0.548** seconds
  * Spring Boot **5.229** seconds
* Memory footprint using JVM
  
  * Javalin took 144320 KB, about **140 MB**
  * Spring Boot took 205892, about **201 MB**

Javalin startup screenshot

.. attachment-image:: javalin-startup.png

Spring Boot startp screenshot

.. attachment-image:: spring-startup.png

This gives us a good perspective about frameworks. Depending of your needs,
of course, Javalin can give you a lightweight working app. Unless you need
Spring Boot's out-of-the-box ready features.

That's all for today. If you have any questions, I'll be happy to answer. Reach
out by using the comment system below or any of the link in the about page.

This post will get a video version on YouTube, stay tuned and keep an eye at
this channel: https://www.youtube.com/@thermcampos

Thanks for reading.


.. _`maven-setup page`: https://javalin.io/tutorials/maven-setup
.. _`graddle-setup page`: https://javalin.io/tutorials/gradle-setup
.. _`On their page`: https://javalin.io/tutorials/
