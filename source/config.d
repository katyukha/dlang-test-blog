module config;

import vibe.core.args: readOption, readRequiredOption;
import vibe.http.server: HTTPServerSettings;
import dvorm;
import dvorm.vibe.providers;
import vibe.core.log;

class Config {
    HTTPServerSettings httpSettings;
    DbConnection dbSettings;

    this(){
       httpSettings = new HTTPServerSettings();
       httpSettings.port=8080;

       dbSettings.type = DbType.Memory;
    }

    void configureHTTP(){
        string httpBindAddress;
        readOption("http-bind-address", &httpBindAddress, "Host to listen to.");
        readOption("http-port", &httpSettings.port, "Port to listen to. (default: 8080)");

        if(httpBindAddress)
            httpSettings.bindAddresses = [httpBindAddress];

    }

    void configureDB(){
        string dbType;
        readOption("db-type", &dbType, "Database type (one of 'memory', 'mongo', 'email')");
        switch(dbType){
            case "memory": dbSettings.type = DbType.Memory; break;
            case "mongo": dbSettings.type = DbType.Mongo; break;
            case "email": dbSettings.type = DbType.Email; break;
            default: break;
        }
        
        readOption("db-host", &dbSettings.host, "Host for database server. (if db-type != 'memory')");
        readOption("db-port", &dbSettings.port, "Port for database server. (if db-type != 'memory')");
        readOption("db-user", &dbSettings.user, "User for database server. (if db-type != 'memory')");
        readOption("db-password", &dbSettings.pass, "Password for database server. (if db-type != 'memory')");
        readOption("db-name", &dbSettings.database, "Database name to use. (if db-type != 'memory')");

        databaseConnection(dbSettings);
        logInfo("DataBase configured: dbtype=%s, host=%s, port=%s, user=%s, pass=%s, dbname=%s", dbSettings.type, dbSettings.host, dbSettings.port, dbSettings.user, dbSettings.pass, dbSettings.database);
    }

    /* Root function to get all configuration
       Now all configuration is got using vibe's 'readOption' function
    */
    void getOptions(){
        configureHTTP();
        configureDB();
    }
}

