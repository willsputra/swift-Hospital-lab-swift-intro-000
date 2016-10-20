//
//  SchoolEmployeeTests.swift
//  Hospital



import Quick
import Nimble
@testable import Hospital

class SchoolEmployeeSpec: QuickSpec {
    override func spec() {
        
        var testBoardMember = AdvisoryBoardMember(name: "Bill", vacationDays: 30)
        var testPrincpial = Principal(name: "Nye", vacationDays: 20)
        var testTeacher = Teacher(name: "Science Guy", vacationDays: 15)
        
        describe("AdvisoryBoardMember - Payable") {
            it("Should implement wages() function to return 100_000.00") {
                
                let wages = testBoardMember.wages()
                
                expect(wages).to(equal(100_000.00))
                
            }
        }
        
        describe("AdvisoryBoardMember - TimeOff") {
            it("Should adopt and conform to the TimeOff protocol") {
                
                // testBoardMember has 30 vacation days (as per its default value asigned above)
                let requestFor15Days = testBoardMember.requestForVacation(15)
                expect(requestFor15Days).to(equal(true))
                
                let requestFor31Days = testBoardMember.requestForVacation(31)
                expect(requestFor31Days).to(equal(false))
                
                // change the amount of vacation days fakeBoardMember has to 0
                testBoardMember.vacationDays = 0
                
                let requestFor1Day = testBoardMember.requestForVacation(1)
                expect(requestFor1Day).to(equal(false))
                
            }
        }
        
        describe("Principal - Payable") {
            it("Should implement wages() function to return 80_000.00") {
                
                let wages = testPrincpial.wages()
                
                expect(wages).to(equal(80_000.00))
                
            }
        }
        
        describe("Principal - TimeOff") {
            it("Should adopt the TimeOff protocol") {
                
                // testPrincipal has 15 vacation days (as per its default value asigned above)
                let requestFor15Days = testPrincpial.requestForVacation(15)
                expect(requestFor15Days).to(equal(true))
                
                let requestFor21Days = testPrincpial.requestForVacation(21)
                expect(requestFor21Days).to(equal(false))
                
                // change the amount of vacation days fakePrincipal has to 0
                testPrincpial.vacationDays = 0
                
                let requestFor1Day = testPrincpial.requestForVacation(1)
                expect(requestFor1Day).to(equal(false))
                
            }
        }
        
        describe("Principal - Reprimand") {
            it("Should implement the Reprimand protocol correctly.") {
                
                let messageForSevere = testPrincpial.disciplineStudent(.severe)
                
                expect(messageForSevere).to(equal("We are expelling you from the school!"))
            }
        }
        
        describe("Teacher - Payable") {
            it("Should implement wages() function to return 100_000.00") {
                
                let wages = testTeacher.wages()
                
                expect(wages).to(equal(50_000.00))
                
            }
        }
        
        describe("Teacher - TimeOff") {
            it("Should adopt the TimeOff protocol") {
                
                // testTeacher has 15 vacation days (as per its default value asigned above)
                let requestFor15Days = testTeacher.requestForVacation(15)
                expect(requestFor15Days).to(equal(true))
                
                let requestFor16Days = testTeacher.requestForVacation(16)
                expect(requestFor16Days).to(equal(false))
                
                // change the amount of vacation days testTeacher has to 0
                testTeacher.vacationDays = 0
                
                let requestFor1Day = testTeacher.requestForVacation(1)
                expect(requestFor1Day).to(equal(false))
                
            }
        }
        
        describe("Teacher - Teach") {
            it("Should adopt The Teach protocol") {
                
                let messageForMath = testTeacher.teachSubject(.math)
                
                expect(messageForMath).to(equal("Take out your math books please."))
                
            }
        }
    }
}
