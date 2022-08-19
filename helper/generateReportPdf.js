const fs = require("fs");
const path = require("path");
const PDFDocument = require("pdfkit-table");
const moment = require("moment");

const { SEVERITY } = require("../helper/constants/severity");

const capitalize = (query) => {
	return query.charAt(0).toUpperCase() + query.slice(1).toLowerCase();
};

module.exports = async (tickets, start, end, filter, casesubject, product) => {
	let doc = new PDFDocument({
		margin: 30,
		size: "A4",
	});

	// const filename = "TIMES_REPORT_" + moment().format("YYYY-MM-DD_HH-mm");

	// doc.pipe(
	// 	fs.createWriteStream(path.join("public", "reports", `${filename}.pdf`))
	// );

	let filterlist = []
	
	Object.keys(filter).forEach((field) => {
		if (field === "sla") {
			filterlist.push(`${capitalize(field)}: within ${filter[field]} days`);
		} else if (field === "product") {
			filterlist.push(`${capitalize(field)}: ${product || filter[field]}`);
		} else if (field === "status") {
			filterlist.push(`${capitalize(field)}: ${filter[field]}`);
		} else if (field === "subject") {
			filterlist.push(`${capitalize(field)}: ${casesubject || filter[field]}`);
		} else if (field === "deptfrom") {
			filterlist.push(`Created by department: ${filter[field]}`);
		} else if (field === "deptto") {
			filterlist.push(`Assigned to department: ${filter[field]}`);
		}
	});

	const table = {
		title: "Times Report",
		subtitle: `issued at ${moment().format("LLLL")}\nFrom: ${moment(
			start
		).format("llll")} to ${moment(end).format(
			"llll"
		)}\n${filterlist.length > 0 ? "Filters Applied:" : ""}\n${filterlist.join("\n")}`,
		headers: [
			{ label: "No.", property: "no", width: 20 },
			{ label: "Ticket ID", property: "ticket_id", width: 40 },
			{ label: "Product", property: "product", width: 80 },
			{ label: "Event Location", property: "location", width: 80 },
			{ label: "Subject", property: "casesubject", width: 90 },
			{ label: "Created At", property: "created_date", width: 70 },
			{ label: "Severity", property: "severity", width: 50 },
			{ label: "Status", property: "status", width: 50 },
			{ label: "SLA", property: "sla", width: 50 },
		],
		datas: tickets.map((ticket, idx) => {
			return {
				no: idx + 1,
				ticket_id: ticket.ticket_id,
				product: ticket.Product.product_name,
				status: ticket.status,
				location: ticket.location,
				casesubject: ticket.CaseSubject.subject,
				created_date: moment(ticket.created_date).format("llll"),
				severity: `${ticket.CaseSubject.severity} - ${
					SEVERITY.find((s) => s.label === ticket.CaseSubject.severity)
						.handle_in
				} days`,
				sla:
					ticket.sla > 0
						? `Due in ${ticket.sla} day(s)`
						: ticket.sla < 0
						? `${Math.abs(ticket.sla)} day(s) passed due`
						: ticket.sla === 0
						? `Today`
						: `No SLA`,
			};
		}),
	};

	doc.table(table, {
		prepareHeader: () => doc.font("Helvetica-Bold").fontSize(8),
		prepareRow: (row, indexColumn, indexRow, rectRow, rectCell) => {
			doc.font("Helvetica").fontSize(8);
			indexRow % 2 === 0 &&
				indexColumn === 0 &&
				doc.addBackground(rectRow, "gray", 0.15);
		},
		padding: 1,
	});

	doc.end();

	return doc;
};
