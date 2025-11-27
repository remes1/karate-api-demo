({
    // Selects a random user from an array
    getRandomUser: function (users) {
        var total = users.length;
        var index = Math.floor(Math.random() * total);
        return users[index];
    },

    // Generates random number
    randomFirstName: function () {
        return 'Name' + Math.floor(Math.random() * 1000);
    },

    // Generates random surname
    randomLastName: function () {
        return 'Surname' + Math.floor(Math.random() * 1000);
    },

    // Generates random age from 20 to 69
    randomAge: function () {
        return Math.floor(Math.random() * 50) + 20;
    }
})