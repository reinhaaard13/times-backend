const { Op } = require("sequelize");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const db = require("../models");

const login = async (req, res) => {
	const { user, password } = req.body;

	let foundUser;
	try {
		// Try to find the user in the database
		foundUser = await db.User.findOne({
			where: {
				[Op.or]: [{ username: user }, { email: user }],
			},
			include: {
				model: db.Role,
				attributes: ["role_id", "role_category"],
				include: {
					model: db.Privilege,
					attributes: ["privilege_id"],
				},
			},
		});
	} catch (err) {
		return res.status(500).json({ err });
	}

	if (!foundUser) {
		return res.status(401).json({ message: "User not found" });
	}

	let isPasswordValid;
	try {
		// Try to compare the password with the hash in the database
		isPasswordValid = await bcrypt.compare(password, foundUser.password);
	} catch (err) {
		return res.status(500).json({ message: "Error Retrieving Password" });
	}

	if (!isPasswordValid) {
		return res.status(401).json({ message: "Invalid password" });
	}

	// Create a token for the user
	const accessToken = jwt.sign(
		{ id: foundUser.user_id, role: foundUser.role },
		process.env.JWT_SECRET,
		{ expiresIn: "15m" }
	);

	// create refresh token
	const refreshToken = jwt.sign(
		{ id: foundUser.user_id, role: foundUser.role },
		process.env.JWT_SECRET,
		{ expiresIn: "7d" }
	);

	// Map privileges object to list
	const privileges = foundUser.Role.Privileges.map(
		(privilege) => privilege.privilege_id
	);

	foundUser.token = accessToken;
	foundUser.refreshToken = refreshToken;
	await foundUser.save();

	return res.status(200).json({
		token: accessToken,
		refreshToken,
		user: {
			id: foundUser.user_id,
			username: foundUser.username,
			name: foundUser.name,
		},
		role: foundUser.role,
		privileges,
	});
};

const refreshToken = async (req, res) => {
	const { refreshToken } = req.body;

	if (!refreshToken) return res.status(401).json({ message: "No refresh token" });

	let decodedToken;
	try {
		decodedToken = jwt.verify(refreshToken, process.env.JWT_SECRET);
	} catch (err) {
		return res.status(401).json({ message: "Invalid token" });
	}

	let foundUser;
	try {
		// Try to find the user in the database
		foundUser = await db.User.findOne({
			where: {
				[Op.and]: [
					{refreshToken},
					{user_id: decodedToken.id},
				]
			},
			include: {
				model: db.Role,
				attributes: ["role_id", "role_category"],
				include: {
					model: db.Privilege,
					attributes: ["privilege_id"],
				},
			},
		});
	} catch (err) {
		return res.status(500).json({ err });
	}

	if (!foundUser) {
		return res.status(401).json({ message: "User not found" });
	}

	// Create a token for the user
	const accessToken = jwt.sign(
		{ id: foundUser.user_id, role: foundUser.role },
		process.env.JWT_SECRET,
		{ expiresIn: "15m" }
	);

	return res.status(200).json({
		token: accessToken,
		refreshToken,
	});
}

const register = async (req, res) => {
	const { username, name, email, password, phone, role } = req.body;

	let foundUser;
	try {
		foundUser = await db.User.findOne({
			where: {
				[Op.or]: [{ username: username }, { email: email }, { phone: phone }],
			},
		});
	} catch (error) {
		return res.status(500).json({ error });
	}

	if (foundUser) {
		return res.status(401).json({ message: "User already exists" });
	}

	let hashedPassword;

	try {
		hashedPassword = await bcrypt.hash(password, 12);
	} catch {
		return res.status(500).json({ error });
	}

	try {
		const newUser = await db.User.create({
			username,
			name,
			phone,
			email,
			password: hashedPassword,
			role,
			created_by: "Admin",
			modified_by: "Admin",
		});
		return res.status(201).json({ newUser });
	} catch (error) {
		return res.status(500).json({ error });
	}
};



module.exports = {
	login,
	register,
	refreshToken
};
