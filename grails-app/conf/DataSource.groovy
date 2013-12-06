import org.hibernate.dialect.Dialect

dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "postgres"
    dialect = com.dataentry.TableNamePostgresDialect
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
            url = "jdbc:postgresql://localhost:5432/dataentry"
        }
    }
}
