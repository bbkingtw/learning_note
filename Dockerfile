FROM anapsix/nodejs

RUN npm set proxy http://10.170.158.72:5050
RUN npm set registry http://registry.npmjs.org

RUN npm install lodash@4.16.2
RUN npm install jade@1.11.0
RUN npm install express@4.14.0
RUN npm install express-session@1.14.1
RUN npm install chalk@1.1.3
RUN npm install elasticsearch@11.0.1
RUN npm install uuid@2.0.3
RUN npm install iconv-lite@0.4.13
RUN npm install request@2.75.0
RUN npm install async@2.0.1
RUN npm install optimist@0.6.1
RUN npm install connect-busboy@0.0.2
RUN npm install moment@2.15.1
#RUN npm install mongodb@2.2.10
RUN npm install gridjs@0.1.0
RUN npm install nodemailer@2.6.4
RUN npm install nodemailer-smtp-transport@2.7.2
RUN npm install ip@1.1.3
RUN npm install body-parser@1.15.2

RUN npm install connect-mongo@1.1.0
#RUN npm install mongojs@2.3.0

#=========================================
#this is new feature in tsmc/node_base.1
#=========================================
RUN npm install cookie-parser@1.4.3
RUN npm install md5@2.2.1
RUN npm install lynx@0.2.0
RUN npm install node-etcd@5.0.3
RUN npm install simple-xml2json@1.2.3

#=========================
#-----append at 2016/10/31
#=========================
RUN npm install json2csv@3.7.1
RUN npm install morgan@1.7.0
RUN npm install errorhandler@1.4.3
RUN npm install socket.io@1.5.1

#for past compatible
RUN npm install mongojs@0.15.1
RUN npm install mongodb@1.4.23

---python
xml2json
