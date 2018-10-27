//
//  User.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

struct User: Entity, AggregatedModelType {
    var id: String
    var description: String?
    var followersCount: Int?
    var facebookId: String?
    var permanentId: Int?
    var githubLoginName: String?
    var twitterScreenName: String?
    var followeesCount: Int?
    var websiteUrl: String?
    var linkedinId: String?
    var profileImageUrl: String?
    var location: String?
    var itemsCount: Int?
    var name: String?
    var organization: String?
}
