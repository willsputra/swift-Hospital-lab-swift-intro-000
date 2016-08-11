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

**(5)** - Lets create an enum. This enum is called `Punishment` and should have three cases. `Severe`, `Light` and `Medium`.

**(6)** - Create a protocol called `Reprimand` which requires that there be two functions. The first function is called `disciplineStudent(_:)` which takes in one argument called `scale` of type `Punishment` and returns a `String`. The second function is called `callParentDeliveringMessage(_:)` which takes in one argument called `scale` of type `Punishment` and returns a `String`.

**(7)** - Create an extension on the `Reprimand` protocol and provide default implementation for the two functions required by this protocol. In your implementation of the `disciplineStudent(_:)` function it should switch on the `scale` argument and return the following `String` based upon that case:

If the case is Severe - "We are expelling you from the school!"  
If the case is Light - "You're to go back to class, don't do it again."  
If the case is Medium - "Why would you think that's a good idea?! Never again, go back to class."  

In your implementation of the `callParentDeliveringMessage(_:)` method, it should switch on the `scale` argument and return the following `String` based upon that case:

If the case is Severe - "Your child has been expelled from the school."   
If the case is Light - "Your child thought it was funny to put gum in Amy's hair."    
If the case is Medium - "Your child has become a terror in the classroom."  

**(8)** - Create an enum called `Subject` which has three cases. `Math`, `Science` and `English`.

**(9)** - Create a protocol called `Teach` which requires that there be one function. That one function should be called `teachSubject(_:)` which takes in one argument called `subject` of type `Subject`. It will return a `String`.

**(10)** - Create an extension on `Teach` and provide a default implementation of the `teachSubject(_:)` function.

In your implementation, you should switch on the `subject` argument and return the following `String` based upon the specific case.

If the case is Math - "Take out your math books please."  
If the case is Science - "Time to learn the best subject of all! Science!!"  
If the case is English - "To read or not to read. Everyone take out your english books."



<a href='https://learn.co/lessons/AllTheThings' data-visibility='hidden'>View this lesson on Learn.co</a>
