//
//  School.swift
//  Hospital

protocol Payable {
    func wages() -> Double
}

extension Payable {
    func wages() -> Double {
        return 50_000.00
    }
}

protocol TimeOff {
    var vacationDays: Int {
        get
        set
    }
    
    func requestForVacation(_ days: Int) -> Bool
}

extension TimeOff {
    func requestForVacation(_ days: Int) -> Bool {
        if vacationDays >= days {
            return true
        } else {
            return false
        }
    }
}

enum Punishment {
    case severe
    case light
    case medium
}

protocol Reprimand {
    func disciplineStudent(_ scale: Punishment) -> String
    func callParentDeliveringMessage(_ scale: Punishment) -> String
}

extension Reprimand {
    func disciplineStudent(_ scale: Punishment) -> String {
        switch scale {
        case .severe: return "We are expelling you from the school!"
        case .light: return "You're to go back to class, don't do it again."
        case .medium: return "Why would you think that's a good idea?! You're going to detention."
        }
    }
    
    func callParentDeliveringMessage(_ scale: Punishment) -> String {
            switch scale {
            case .severe: return "Your child has been expelled from the school."
            case .light: return "Your child thought it was funny to put gum in Amy's hair."
            case .medium: return "Your child has become a terror in the classroom."
            }
        }
}

enum Subject {
    case math
    case science
    case english
}

protocol Teach {
    func teachSubject(_ subject: Subject) -> String
}

extension Teach {
    func teachSubject(_ subject: Subject) -> String {
        switch subject{
        case .math: return "Take out your math books please."
        case .science: return "Time to learn the best subject of all! Science!!"
        case .english: return "To read or not to read. Everyone take out your english books."
        }
    }
}

protocol Employee: Payable, TimeOff {
    
}










