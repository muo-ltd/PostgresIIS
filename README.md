# Postgres IIS

Import IIS logs into an instance of Postgres running under docker. Useful to analyse IIS logs on any platform

## How to use it 

Drop your IIS log into the **src/logstoload** directory. Currently it will only support one log at a time
and it must be named **input.log**

To run:

```bash
docker-compose build 
```

then

```bash
docker-compose up -d 
```

An instance of Postgres will then be running on docker with port 5432 mapped to the host.
You can then connect to it using PgAdmin or other tools to query the data. The password 
for the postgres user is Password1. 

## What it does

You can copy your IIS logs into the directory without any changes. The docker file contains the following
commands:
1. Grep is used to remove the header from the file
```
grep "^[^#]" input.log > inputwithoutcomments.log
```
2. Sed is used to replace any \ in the file with /. This is because the Postgres COPY command will 
interpret \ as an escape sequence and then fail the load with UTF-8 byte sequence errors
```
sed -i 's/\\/\//g' inputwithoutcomments.log
```
3. The iconv command then resolves any encoding issues by converting from US-ASCII to UTF-8
```
iconv -c -f US-ASCII -t UTF-8 < inputwithoutcomments.log > output.log
```

When you start the container the databases is created "postgresiis" and then a table is created that
matches the contents of the log file. Note this may be different depending upon what columns are being captured 
by your instance of IIS. The copy command then executes and loads the data in. If the file is large then 
this may take a minute or so. I have tested with multiple GB files and they load correctly. I would 
suggest checking your file beforehand to see how many lines it has in it (**wc -l <filename>** works reasonably well).

