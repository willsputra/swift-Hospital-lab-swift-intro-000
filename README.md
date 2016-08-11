# School

![](http://i.imgur.com/wcCK78r.jpg?1)  

> Tell me and I forget. Teach me and I remember. Involve me and I learn. -[Benjamin Franklin](https://en.wikipedia.org/wiki/Benjamin_Franklin)
 
---



# Protocol Oriented Programming (POP)

POP = Protocol Oriented Programming  
OOP = Object Oriented Programming

Apple's advice for POP is "don't start with a class, start with a protocol". Lets do exactly that in this lab.

We will be building our structures horizontally (POP) rather than vertically (OOP). When designing your various classes vertically, you're utilizing inheritance, creating a base class, then adding functionality through subclassing. 

With protocols, we're not stuck with subclassing from one base class. We can adopt as many protocols as we need and plug them in, take them out as we please during our development cycle. 

# Instructions

We will be designing a school (focusing on the administrative side, not the students). Our end goal is to create three structures:
* AdvisoryBoardMember
* Principal
* Teacher 

In creating these three structures, there's a lot of similarity shared between them. Historically this problem was solved using inheritance (Object-Oriented Programming), but we're going to start with a protocol, not a class. And like I stated, we're going to be creating these as structures, not classes.

A quick overview of the journey we're about to go on. We're going to create a `Payable`, `TimeOff`, `Teach`, `Employee` and `Reprimand` protocol. We will then extend each protocol to provide default implementation. After that we will create our three structures, `AdvisoryBoardMember`, `Principal`, and `Teacher`. Each of these structures will adopt and conform to the protocols we created, but some will conform to only a few. Not ever protocol will be adopted by every structure.

**(1)** - In the `School.swift` file, create a protocol called `Payable` that has one function requirement. The name of the function should be `wages()`. It takes in no arguments but returns back a `Double`. 

**(2)** - Below where you created the `Payable` protocol, create an extension on the `Payable` protocol and implement the `wages()` function. In your implementation, it should just return back `50_000.00`. Notice how I used an underbar here, this can act as a comma (as if you were writing it in on paper), it doesn't do anything in code. It just makes your code more readable instead of having to see a bunch of zeros next to each other.

**(3)** - Still in the same file (`School.swift)`, create another protocol called `TimeOff` which includes a property named `vacationDays` of type `Int` that will be both gettable and settable. It should include a function called `requestForVacation(_:)` which takes in one argument named `days` of type `Int` and returns a `Bool`.

**(4)** - Below this `TimeOff` protocol, create an extension on the `TimeOff` protocol where we will provide some default implementation to the `requestForVacation(_:)` function. In our implementation of the `requestForVacation(_:)` function, you should return `true` if and only if there are enough `vacationDays` to satisfy the request. If the `vacationDays` is equal to 9 and `requestForVacation(10)` is called by that instance (which will be our structure later on), then it should return `false`.

**(5)** - In the same `School.swift` file, create a protocol called `Reprimand` 



<a href='https://learn.co/lessons/AllTheThings' data-visibility='hidden'>View this lesson on Learn.co</a>
