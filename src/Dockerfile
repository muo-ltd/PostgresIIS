FROM postgres:latest
COPY initialise.sh /docker-entrypoint-initdb.d/initialise.sh
COPY *.sql /tmp/
COPY logstoload /tmp/logstoload
RUN cd /tmp/logstoload && \
    grep "^[^#]" input.log > inputwithoutcomments.log && \
    sed -i 's/\\/\//g' inputwithoutcomments.log && \
    iconv -c -f US-ASCII -t UTF-8 < inputwithoutcomments.log > output.log && \
    rm input.log inputwithoutcomments.log
CMD ["postgres"]