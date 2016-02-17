package com

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class StoreParentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [storeParentInstanceList: StoreParent.list(params), storeParentInstanceTotal: StoreParent.count()]
    }

    def create() {
        [storeParentInstance: new StoreParent(params)]
    }

    def save() {
        def storeParentInstance = new StoreParent(params)
        if(params.childJSON){
            def childs = JSON.parse(params.childJSON);
            childs.each({ c ->
                storeParentInstance.addToStoreChild(StoreChild.saveData(c));
            });
        }


        if (!storeParentInstance.save(flush: true)) {
            render(view: "create", model: [storeParentInstance: storeParentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'storeParent.label', default: 'StoreParent'), storeParentInstance.id])
        redirect(action: "show", id: storeParentInstance.id)
    }

    def show(Long id) {
        def storeParentInstance = StoreParent.get(id)
        if (!storeParentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storeParent.label', default: 'StoreParent'), id])
            redirect(action: "list")
            return
        }

        [storeParentInstance: storeParentInstance]
    }

    def edit(Long id) {
        def storeParentInstance = StoreParent.get(id)
        if (!storeParentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storeParent.label', default: 'StoreParent'), id])
            redirect(action: "list")
            return
        }

        [storeParentInstance: storeParentInstance]
    }

    def update(Long id, Long version) {
        def storeParentInstance = StoreParent.get(id)
        if (!storeParentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storeParent.label', default: 'StoreParent'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (storeParentInstance.version > version) {
                storeParentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'storeParent.label', default: 'StoreParent')] as Object[],
                        "Another user has updated this StoreParent while you were editing")
                render(view: "edit", model: [storeParentInstance: storeParentInstance])
                return
            }
        }

        storeParentInstance.properties = params

        if(params.childJSON){
            StoreParent.executeUpdate("delete  StoreChild  as c where c.storeParent.id=:id", [id: storeParentInstance.id])
            def childs = JSON.parse(params.childJSON);
            childs.each({ c ->
                storeParentInstance.addToStoreChild(StoreChild.saveData(c));
            });
        }

        if (!storeParentInstance.save(flush: true)) {
            render(view: "edit", model: [storeParentInstance: storeParentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'storeParent.label', default: 'StoreParent'), storeParentInstance.id])
        redirect(action: "show", id: storeParentInstance.id)
    }

    def delete(Long id) {
        def storeParentInstance = StoreParent.get(id)
        if (!storeParentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storeParent.label', default: 'StoreParent'), id])
            redirect(action: "list")
            return
        }

        try {
            storeParentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'storeParent.label', default: 'StoreParent'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'storeParent.label', default: 'StoreParent'), id])
            redirect(action: "show", id: id)
        }
    }

    def itemList(){
        def data=StoreChild.list();
        if(data){
            render data as JSON
        }
    }

    def childList(){
        def res=[];
        if(params.id){
            def pData=StoreParent.findById(params.id)
            if(pData){
                def child=StoreChild.findAllByStoreParent(pData as StoreParent)
                if(child){
                    child.each {e->
                        res.push([
                                cityName:e?.cityName?:"",
                                zipCode:e?.zipCode?:""
                        ])
                    }
                }
            }
            if(res){
                render res as JSON
            }
        }
    }
}
