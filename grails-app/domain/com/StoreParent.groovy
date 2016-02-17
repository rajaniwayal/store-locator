package com

class StoreParent {
    String stateName
    static constraints = {
        stateName nullable: false
    }
    static hasMany = [storeChild: StoreChild]
}
