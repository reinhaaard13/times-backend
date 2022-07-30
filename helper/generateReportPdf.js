const fs = require('fs')
const path = require('path')
const PDFDocument = require('pdfkit-table')
const moment = require('moment')

module.exports = async () => {
  let doc = new PDFDocument({
    margin: 30,
    size: 'A4',
  })

  const filename = "TIMES_REPORT_" + moment().format('YYYY-MM-DD_HH:mm') + ".pdf"
  
  doc.pipe(fs.createWriteStream(path.join(__dirname, `../public/reports/${filename}`)))

  const table = {
    title: "Times Report",
    subtitle: `${moment().format("LLLL")}`,
    headers: [
      {label: 'Ticket ID', property: 'ticket_id'},
      {label: 'Ticket ID', property: 'ticket_id'},
    ]
  }

}