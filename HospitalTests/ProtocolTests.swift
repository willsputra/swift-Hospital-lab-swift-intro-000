//
//  ProtocolTests.swift
//  Hospital



import Quick
import Nimble
@testable import Hospital

class ProtocolSpec: QuickSpec {
    
    override func spec() {
        
        // Dummy Struct to test various protocols
        struct FakePerson: Payable, TimeOff, Reprimand, Teach {
            var vacationDays: Int = 15
        }
        var fakeJim = FakePerson()

        describe("Payable protocol") {
            it("Should require one function called wages() which takes in no arguments and returns a Double. It should provide a default implementation in an extension which returns back 50_000.00") {
                
                let actualResponse = fakeJim.wages()
                
                expect(actualResponse).to(equal(50_000.00))
                
            }
        }
        
        describe("TimeOff protocol") {
            it("Should require one instance property called vacationDays of type Int which is both settable and gettable. It should also require a function called requestForVacation(_:) which takes in one argument of type Int and returns back a Bool. See the instructions for how this protocol should provide default implementation for this function.") {
                
                // fakeJim has 15 vacation days (as per its default value asigned above)
                let requestFor15Days = fakeJim.requestForVacation(15)
                expect(requestFor15Days).to(equal(true))
                
                let requestFor16Days = fakeJim.requestForVacation(16)
                expect(requestFor16Days).to(equal(false))
                
                // change the amount of vacation days fakeJim has to 0
                fakeJim.vacationDays = 0
                
                let requestFor1Day = fakeJim.requestForVacation(1)
                expect(requestFor1Day).to(equal(false))
                
            }
        }
        
        describe("Reprimand protocol") {
            it("Should provide default implementation of disciplineStudent(_:) function. See instructions for details.") {
                
                let messageForSevere = fakeJim.disciplineStudent(.severe)
                let messageForLight = fakeJim.disciplineStudent(.light)
                let messageForMedium = fakeJim.disciplineStudent(.medium)
                
                expect(messageForSevere).to(equal("We are expelling you from the school!"))
                expect(messageForLight).to(equal("You're to go back to class, don't do it again."))
                expect(messageForMedium).to(equal("Why would you think that's a good idea?! You're going to detention."))
                
                let messageForParentSevere = fakeJim.callParentDeliveringMessage(.severe)
                let messageForParentLight = fakeJim.callParentDeliveringMessage(.light)
                let messageForParentMedium = fakeJim.callParentDeliveringMessage(.medium)
                
                expect(messageForParentSevere).to(equal("Your child has been expelled from the school."))
                expect(messageForParentLight).to(equal("Your child thought it was funny to put gum in Amy's hair."))
                expect(messageForParentMedium).to(equal("Your child has become a terror in the classroom."))

            }
        }
        
        describe("Teach Protocol") {
            it("Should provide default implementation of its teachSubject(_:) method requirement. See instructions for details.") {
                
                let messageForMath = fakeJim.teachSubject(.math)
                let messageForScience = fakeJim.teachSubject(.science)
                let messageForEnglish = fakeJim.teachSubject(.english)
                
                expect(messageForMath).to(equal("Take out your math books please."))
                expect(messageForScience).to(equal("Time to learn the best subject of all! Science!!"))
                expect(messageForEnglish).to(equal("To read or not to read. Everyone take out your english books."))

            }
        }
        
    }
}
