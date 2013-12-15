package com.dataentry.logs

class AuditLog {
    String actor
    String className
    Date dateCreated
    String eventName
    Date lastUpdated
    String newValue
    String oldValue
    String persistedObjectId
    String persistedObjectVersion
    String propertyName
    String uri

    static mapping = {
        table "AUDIT_LOG"
        version false
        actor column:"actor"
        className column:"class_name"
        dateCreated column:"date_created"
        eventName column:"event_name"
        lastUpdated column:"last_updated"
        newValue column:"new_value"
        oldValue column:"old_value"
        persistedObjectId column:"persisted_object_id"
        persistedObjectVersion column:"persisted_object_version"
        propertyName column:"property_name"
        uri column:"uri"

    }
    static constraints = {
        actor nullable: true, blank:  true
        className nullable: true, blank:  true
        dateCreated nullable: true, blank:  true
        eventName nullable: true, blank:  true
        lastUpdated nullable: true, blank:  true
        newValue nullable: true, blank:  true
        oldValue nullable: true, blank:  true
        persistedObjectId nullable: true, blank:  true
        persistedObjectVersion nullable: true, blank:  true
        propertyName nullable: true, blank:  true
        uri nullable: true, blank:  true
    }


}
