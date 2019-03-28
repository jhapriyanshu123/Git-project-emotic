const moment = require('moment');
const momentTimezone = require('moment-timezone');

var getSeconds = async (timeInMilliseconds) => {
var timeInSeconds = timeInMilliseconds/1000;
return timeInSeconds;
};

var setDateTime = async (timezone) => {
var timezoneDate = new moment().tz(timezone);
// console.log(timezoneDate);
//var date = new moment();
var createdAt = timezoneDate.utc().format('YYYY-MM-DD HH:mm:ss');
return createdAt;
};

var getDateTime = async (date, timezone) => {
var createdAt = moment(date).tz('UTC').format('YYYY-MM-DD HH:mm:ss');
var timezoneDate = moment(date).tz(timezone).format('YYYY-MM-DD HH:mm:ss');
return timezoneDate;
}

var getDate = async (date, timezone,format) => {
var createdAt = moment(date).tz('UTC');
var timezoneDate = moment(createdAt).tz(timezone).format(format);
return timezoneDate;
};

var getTime = async (date, timezone,format) => {
var createdAt = moment(date).tz('UTC');
var timezoneTime = moment(createdAt).tz(timezone).format(format);
return timezoneTime;
};

var convertDateTime = async (date=null) => {
if(date==null){
  var createdAt = moment().tz('UTC').format('YYYY-MM-DD HH:mm:ss');
} else {
  var createdAt = moment(date).tz('UTC').format('YYYY-MM-DD HH:mm:ss');
}
return createdAt;
};

var getTimeSince = async (date, timezone=null) => {
//var timezoneTime = moment(date).tz(timezone).format('YYYY-MM-DD hh:mm:ss');
// var timeSince = moment(date).tz(timezone).fromNow();
var timeSince = moment(date).fromNow(true);
return timeSince;
};

var getTimeDifference = async (date, timezone) => {
var now = new moment().tz(timezone);
var end = moment(date); // another date
var duration = moment.duration(now.diff(end));
var days = duration.asDays();
return days;
};

var postDate = (date) => {
 var date = moment(date).format('DD/MM/YYYY');
 return date;
};

var getNumberOfDays = async(startDate, endDate=null) => {
 var d1 = moment();
 var d2 = moment(startDate);
 var days = d2.diff(d1, 'days');
 return days;
};

module.exports = {
  getSeconds,
  setDateTime,
  getDateTime,
  getDate,
  getTime,
  convertDateTime,
  getTimeSince,
  getTimeDifference,
  postDate,
  getNumberOfDays
}
