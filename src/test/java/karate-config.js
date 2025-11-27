function fn() {
    var env = karate.env || 'qa';

    var urls = {
        qa: 'https://dummyjson.com/',
        pp: 'https://pp-api.example.com'
    };

    if (!urls[env]) {
        throw 'Unknown environment: ' + env;
    }

    var File = Java.type('java.io.File');
    var Scanner = Java.type('java.util.Scanner');
    var file = new File('.env'); // если лежит в src/test/resources, используй просто '.env'
    var envVars = {};
    if (file.exists()) {
        var scanner = new Scanner(file);
        while (scanner.hasNextLine()) {
            var line = scanner.nextLine().trim();
            if (line && !line.startsWith('#')) {
                var parts = line.split('=');
                if (parts.length === 2) {
                    envVars[parts[0].trim()] = parts[1].trim();
                }
            }
        }
        scanner.close();
    }

    // Create config object
    var config = {
        env: env,
        baseUrl: urls[env],
        username: envVars.USERNAME,
        password: envVars.PASSWORD
    };


    // Perform login once and reuse the token across all tests
    config.accessToken = karate.callSingle('classpath:features/login.feature', config);

    return config;
}