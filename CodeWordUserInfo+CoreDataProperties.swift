//
//  CodeWordUserInfo+CoreDataProperties.swift
//  CodeWord
//
//  Created by Akhil Tirumalasetty on 9/10/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CodeWordUserInfo {

    @NSManaged var title: String?
    @NSManaged var hint: String?
    @NSManaged var uname: String?
    @NSManaged var email: String?
    @NSManaged var password: String?

}
