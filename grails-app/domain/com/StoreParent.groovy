package com

class StoreParent {
    String countryName
    static constraints = {
        countryName nullable: false
    }

    static hasMany = [storeChild:StoreChild]
}