//
//  OverviewController.swift
//  Example-iOS
//
//  Created by Christoph Wendt on 26.07.18.
//  Copyright © 2018 Christoph Wendt. All rights reserved.
//

import WatchKit
import Foundation

class OverviewController: WKInterfaceController {
    @IBOutlet var overviewTable: WKInterfaceTable!

    struct Content {
        static let featuresTitle = "Features"
        static let fontsTitle = "Fonts"
        static let items = [featuresTitle, fontsTitle]
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.overviewTable.setNumberOfRows(Content.items.count, withRowType: "OverviewRow")
        for index in 0..<overviewTable.numberOfRows {
            guard let controller = overviewTable.rowController(at: index) as? OverviewRowController else { continue }
            let item = Content.items[index]
            controller.title = item
        }
    }

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let entryTitle = Content.items[rowIndex]
        if entryTitle == Content.featuresTitle {
            presentController(withName: "Features", context: entryTitle)
        }
    }
}
