const db = require('../models')
const moment = require('moment')
const { SEVERITY } = require('./constants/severity')

const Email = require('../services/email')
const EmailService = new Email()

module.exports.refresh = async () => {
  console.log("Refreshing SLA");
  const tickets = await db.Ticket.findAll({
    where: {
      status: ['OPEN', 'PROGRESS']
    },
    include: [
      { model: db.CaseSubject, attributes: ["subject", "severity"]}
    ]
  })
  for (const ticket of tickets) {
    const deadline = moment(ticket.created_date).add(
      SEVERITY.find(s => s.label === ticket.CaseSubject.severity ).handle_in,
      "days"
    )
  
    const sla = deadline.diff(moment(), "days")
  
    ticket.sla = sla
    await ticket.save()
  }

  EmailService.sendReminderEmail(tickets);

  return tickets
}

module.exports.onComplete = async () => {
  console.log("SLA refreshed");
}

module.exports.generateSLA = async (ticket, severity) => {
  const deadline = moment(ticket.created_date).add(
    SEVERITY.find(s => s.label === severity ).handle_in,
    "days"
  )

  const sla = deadline.diff(moment(), "days")

  ticket.sla = sla

  return ticket
}