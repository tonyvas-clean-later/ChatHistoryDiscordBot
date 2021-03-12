const dotenv = require('dotenv');
const Discord = require('discord.js');
const db = require('./db');

dotenv.config();

const client = new Discord.Client();
client.login(process.env.TOKEN);

client.on('ready', () => {
    console.log(`Bot ${client.user.username} is ready!`);
});

client.on('message', (message) => {
    if (message.author.id == client.user.id) return;

    console.log(`Got message from ${message.author.username}#${message.author.discriminator}`);
});