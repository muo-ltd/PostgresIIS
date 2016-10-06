CREATE TABLE iislog (
	logdate DATE NULL,
	logtime TIME NULL,
	ssitename TEXT NULL,
	scomputername  TEXT NULL,
	sip  TEXT NULL,
	csmethod  TEXT NULL,
	csuristem  TEXT NULL,
	csuriquery  TEXT NULL,
	sport  TEXT NULL,
	csusername  TEXT NULL,
	cip  TEXT NULL,
	csversion  TEXT NULL,
	csUserAgent  TEXT NULL,
	csCookie TEXT NULL,
	csReferer TEXT NULL,
	cshost  TEXT NULL,
	scstatus INT NULL,
	scsubstatus  INT NULL,
	scwin32status INT NULL,
	scbytes INT NULL,
	csbytes  INT NULL,
	timetaken INT NULL
);


COPY iislog(logdate,logtime,ssitename,scomputername,sip,csmethod,csuristem,csuriquery,sport,csusername,cip,csversion,csUserAgent,csCookie,csReferer,cshost,scstatus,scsubstatus,scwin32status,scbytes,csbytes,timetaken)
FROM '/tmp/logstoload/output.log' DELIMITER ' ';