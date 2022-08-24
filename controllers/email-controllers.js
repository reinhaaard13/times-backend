const moment = require('moment');
const ejs = require('ejs');

const EmailService = require("../services/email");

const db = require('../models');

const generateHTML = async (type, payload) => {
  const ticket = await db.ticket.Ticket.findOne({
    where: {
      status: "OPEN"
    },
    include: [
      { model: db.ticket.CaseSubject, attributes: ["severity", "subject"] },
      { model: db.ticket.Product, attributes: ["product_name"] },
      { model: db.ticket.Subproduct, attributes: ["subproduct_name"] },
    ]
  })

  // const html = await ejs.renderFile("src/views/content_newticket.ejs", {
  //   ticket_id: ticket.ticket_id,
  //   severity: ticket.CaseSubject.severity,
  //   product: ticket.Product.product_name,
  //   subproduct: ticket.Subproduct.subproduct_name,
  //   name: ticket.cust_name,
  //   phone: ticket.cust_no,
  //   location: ticket.location,
  //   created_date: moment(ticket.created_date).format("DD-MM-YYYY HH:mm:ss"),
  //   case_subject: ticket.CaseSubject.subject,
  //   assigned_to: ticket.assigned_to,
  // })

  const html = await ejs.renderFile("src/views/content_comment.ejs")

  res.send(html)

  return html;
}

const sendEmail = async (type, payload) => {
  const html = await generateHTML(type, payload);

	const email = new EmailService().sendEmail(
		to,
		subject,
		text,
    html,
	);
  return res.status(200).json({ message: `Email sent with ID ${email}` });
};

module.exports = {
  generateHTML,
	sendEmail,
}