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
If the case is English - "To read or not to read. Everyone take out your english books.

---

Lets now head over to the `SchoolEmployees.swift` file. We're going to create our three structures.

**(11)** - Create a new struct called `AdvisoryBoardMember` which has two instance properties (both of which should be variables). One should be called `name` of type `String`. The other should be called `vacationDays` of type `Int` with a default value of `30`. As well, implement the function `wages()` which takes in no argument and returns a `Double`. In your implementation of this function, you should return back the number `100_000.00` (or 100000.00, they are both the same thing).

**(12)** Next is something that will show how powerful these protocols really are. Extend the `AdvisoryBoardMember` class and adopt the following the following protocols in this extension.  

* `Payable`
* `TimeOff`

Do not implement any functions within this extension. You are _just_ adopting the various protocols. The `Payable` protocol requires that we implement the `wages()` function, which we already did when we created our structure. But we also created a default implementation of this `wages()` function in the extension of our protocol. Because of how we defined it, if we were to call on `wages()` on an instance of `AdvisoryBoardMember`, it would jump to the implementation that we created in our declaration of the `AdvisoryBoardMember` class and return back `100_000.00`, not `50_000.00`.

The `TimeOff` protocol asks us to conform to it by supplying a gettable / settable property named `vacationDays`, which we already did. It also asks to implement a function `requestForVacation(_:)` which we didn't do, nor do we have to. We provided a default implementation in our extension of the protocol, so there's nothing else we need to do here.

**(13)** - Create a new struct called `Principal` which has two instance properties (both of which should be variables). One is called `name` of type `String`. The other is called `vacationDays` of type `Int` with a default value of `20	`. As well, implement the `wages()` function which takes in no arguments and returns a `Double`. In your implementation, it should return back `80_000.00`.

**(14)** - Following the creation of that struct, extend the `Principal` struct and adopt the following protocols  
* `Payable`
* `TimeOff`
* `Reprimand`

Similar to what we just did, do NOT implement any functions in this extension, it will just be empty. Any instance of `Principal` now has all of the functionality that was supplied through the extensions on these various protocols for free.

**(15)** - Create a struct called `Teacher` which has two instance properties (both should be variables). One is called `name` of type `String`. The other is called `vacationDays` of type `Int` with a default value of `15`. Do not implement the `wages()` function.

**(16)** - Create an extension on `Teacher` and have it adopt the following protocols  

* `Payable`
* `TimeOff`
* `Teach`

Do not implement anything in this extension, it should be blank. 

**(17)** - There's one more neat thing you can do here. If you notice something, each struct here shares the `Payable` and `TimeOff` protocol. Those seem to be something inherit to every single employee. Well, we can create an `Employee` protocol which adopts the `Payable` & `TimeOff` protocols. Crazy stuff, lets do it.

Going back to the `School.swift` file, lets type this in:

```swift
protocol Employee: Payable, TimeOff { }
```

So anyone that adopts this `Employee` protocol must also conform to the `Payable` and `TimeOff` protocols as well! So we can now go back to our `SchoolEmployees.swift` file and take out where each struct is adopting the `Payable` and `TimeOff` protocol and replace it with the `Employee` protocol (which now accounts for both of those).



Feel free to test all of the above code you've created in the `ViewController.swift` file.




<a href='https://learn.co/lessons/AllTheThings' data-visibility='hidden'>View this lesson on Learn.co</a>
