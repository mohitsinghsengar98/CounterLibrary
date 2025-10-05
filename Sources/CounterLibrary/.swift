//
//  Vehicle.swift
//  Counter
//
//  Created by Mohit Sengar on 16/09/25.
//


protocol ProfileCard {
    var name:String { get }
    var designation: String { get }
    func show()
}

enum ProfileDesignation: String {
    case student = "Student"
    case teacher = "Teacher"
}

class Student: ProfileCard {
    var name : String
    var designation: String = ProfileDesignation.student.rawValue
    init(name: String) { self.name = name }
    func show() {
        print("\(designation)'s name - \(name)")
    }
}

class Teacher: ProfileCard {
    var name : String
    var designation: String = ProfileDesignation.teacher.rawValue
    init(name: String) { self.name = name }
    func show() {
        print("\(designation)'s name - \(name)")
    }
}

struct SchoolProfileFactory {
    static func makeProfile(designation: String, name: String) -> ProfileCard? {
        switch designation {
        case ProfileDesignation.student.rawValue:
            return Student(name: name)
        case ProfileDesignation.teacher.rawValue:
            return Teacher(name: name)
        default:
            print("Unkown Profile type please check and create one if it's not there")
            return nil
        }
    }
}
