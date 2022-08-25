"use strict";

const fs = require("fs");
const path = require("path");
const Sequelize = require("sequelize");
const { Op } = require("sequelize");
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || "development";
const config = require(__dirname + "/../../config/config_auth.json")[env];
const db = {};

let sequelize;
if (config.use_env_variable) {
	sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
	sequelize = new Sequelize(
		config.database,
		config.username,
		config.password,
		config
	);
}
sequelize.dialect.supports.schemas = true;

fs.readdirSync(__dirname)
	.filter((file) => {
		return (
			file.indexOf(".") !== 0 && file !== basename && file.slice(-3) === ".js"
			);
		})
	.forEach((file) => {
		// console.log(file);
		const model = require(path.join(__dirname, file))(
			sequelize,
			Sequelize.DataTypes
		);
		db[model.name] = model;
	});


db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;