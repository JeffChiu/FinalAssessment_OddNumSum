//
//  NumberUtils.swift
//  FinalAssesement1_OddNumSum
//
//  Created by Chiu Chih-Che on 2016/11/1.
//  Copyright © 2016年 Jeff. All rights reserved.
//

import Foundation

class NumberUtils {
    
    static func oddNumberSum(startNum: Int, endNum: Int) -> String {
        var rtnVal: Int = 0
        for oddNum in startNum...endNum where oddNum % 2 != 0 {
            rtnVal += oddNum
        }
        return String(rtnVal)
    }
}
