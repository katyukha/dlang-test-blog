module config;

import vibe.core.args: readOption, readRequiredOption;
import vibe.http.server: HTTPServerSettings;

class Config {
    HTTPServerSettings httpSettings;

    this(){
       httpSettings = new HTTPServerSettings();
       httpSettings.port=8080;
    }

    void getOptions(){
        string httpBindAddress;
        readOption("http-bind-address", &httpBindAddress, "Host to listen to.");
        readOption("http-port", &httpSettings.port, "Port to listen to. (default: 8080)");

        if(httpBindAddress)
            httpSettings.bindAddresses = [httpBindAddress];
    }
}

