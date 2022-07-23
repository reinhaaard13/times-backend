module.exports = (number, digits) => {
  let str = number.toString();
  while (str.length < digits) {
    str = '0' + str;
  }
  return str;
}