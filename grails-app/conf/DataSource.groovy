import org.hibernate.dialect.Dialect

dataSource {
    pooled = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:postgresql://localhost:5432/dataentry"
            username = "postgres"
            password = "postgres"
            dialect = com.dataentry.TableNamePostgresDialect
//            url = "jdbc:postgresql://localhost:5432/dataentry"
//            username = "postgres"
//            password = "postgres"
//            dialect = com.dataentry.TableNamePostgresDialect
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            pooled = true
            url = "jdbc:postgresql://localhost:5432/dataentry"
            username = "postgres"
            password = "postgres"
            dialect = com.dataentry.TableNamePostgresDialect
            driverClassName = "org.postgresql.Driver"


//
//            dbCreate = "update"
//            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//            pooled = true
//            properties {
//                maxActive = -1
//                minEvictableIdleTimeMillis=1800000
//                timeBetweenEvictionRunsMillis=1800000
//                numTestsPerEvictionRun=3
//                testOnBorrow=true
//                testWhileIdle=true
//                testOnReturn=true
//                validationQuery="SELECT 1"
//            }
        }
    }
}
