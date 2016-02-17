package com

class StoreChild {
    String cityName
    String zipCode

    static constraints = {
        cityName nullable: true
        zipCode nullable: true
    }
    static belongsTo = [storeParent: StoreParent]

    static saveData(org.codehaus.groovy.grails.web.json.JSONObject d) {
        return new StoreChild(
                cityName: d?.cityName?:"",
                zipCode: d?.zipCode?:""
        );

    }
}
