const multer = require('multer');
const { v1: uuid } = require('uuid')

const fileUpload = multer({
  limits: 500000,
  storage: multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, 'uploads/attachments')
    },
    filename: (req, file, cb) => {
      if (!file) {
        cb(null, '')
      }
      cb(null, uuid() + '.' + file.originalname.split('.').pop())
    }
  })
})

module.exports = fileUpload;