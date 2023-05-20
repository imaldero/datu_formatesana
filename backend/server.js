const mysql = require(`mysql2`);
const express = require(`express`);
const app = express();
const cors = require(`cors`);

app.use(express.json());
app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  next();
});
app.use(cors());

app.listen(3000, (err) => {
  if (err) {
    console.log(err);
  } else {
    console.log(`listening on port 3000`);
  }
});

const con = mysql.createConnection({
  host: `127.0.0.1`,
  user: `root`,
  database: `datu_formatesana`,
  multipleStatements: true,
});

app.post(`/dupes`, (req, res) => {
  const o = req.body;
  console.log(o.ip, o.date);
  con.query(
    `INSERT IGNORE INTO lamp_type (type) VALUES ("${o.type}");
     INSERT IGNORE INTO lamp_direct (direct) VALUES ("${o.direct}");
     INSERT IGNORE INTO lamp_color (color) VALUES ("${o.color}");
     INSERT IGNORE INTO lamp_power (power) VALUES ("${o.power}");
     INSERT IGNORE INTO lamp_ref1 (ref1) VALUES ("${o.ref1}");
     INSERT IGNORE INTO object_ip (ip) VALUES ("${o.ip}");
     INSERT IGNORE INTO date (date) VALUES ("${o.date}");`,
    (err, result) => {
      if (err) {
        res.send(err);
        return;
      } else {
        res.send(result);
        return;
      }
    }
  );
});

app.post(`/insert`, (req, res) => {
  const o = req.body;
  console.log(req.body);
  con.query(
    `INSERT INTO lamp_dati (type_id, direct_id, color_id, lamp, line, power_id, ref1_id, obj_id, date_id)
  VALUES ((SELECT id FROM lamp_type WHERE type="${o.type}"),
         (SELECT id FROM lamp_direct WHERE direct="${o.direct}"),
         (SELECT id FROM lamp_color WHERE color="${o.color}"),
         "${o.lamp}",
         "${o.line}", 
         (SELECT id FROM lamp_power WHERE power="${o.power}"),
         (SELECT id FROM lamp_ref1 WHERE ref1="${o.ref1}"), 
         (SELECT id FROM object_ip WHERE ip="${o.obj}"), 
         (SELECT id FROM date WHERE date="${o.date}"))`,
    (err, result) => {
      if (err) {
        res.send(err);
        return;
      } else {
        res.send(result);
        return;
      }
    }
  );
});

app.post(`/logdupes`, (req, res) => {
  const o = req.body;
  console.log(o.ip, o.date);
  con.query(
    `INSERT IGNORE INTO log_time (time) VALUES ("${o.time}");
     INSERT IGNORE INTO log_code (code) VALUES ("${o.code}");
     INSERT IGNORE INTO log_error (error) VALUES ("${o.error}");
     INSERT IGNORE INTO log_unit (unit) VALUES ("${o.unit}");
     INSERT IGNORE INTO log_status (status) VALUES ("${o.status}");
     INSERT IGNORE INTO object_ip (ip) VALUES ("${o.ip}");
     INSERT IGNORE INTO date (date) VALUES ("${o.date}");`,
    (err, result) => {
      if (err) {
        res.send(err);
        return;
      } else {
        res.send(result);
        return;
      }
    }
  );
});

app.post(`/insertlog`, (req, res) => {
  const o = req.body;
  console.log(req.body);
  con.query(
    `INSERT INTO log_dati (ip_id, date_id, time_id, code_id, error_id, unit_id, status_id)
    VALUES ((SELECT id FROM object_ip WHERE ip="${o.ip}"), 
    (SELECT id FROM date WHERE date="${o.date}"),
    (SELECT id FROM log_time WHERE time="${o.time}"),
    (SELECT id FROM log_code WHERE code="${o.code}"),
    (SELECT id FROM log_error WHERE error="${o.error}"),
    (SELECT id FROM log_unit WHERE unit="${o.unit}"),
    (SELECT id FROM log_status WHERE status="${o.status}"))
`,
    (err, result) => {
      if (err) {
        res.send(err);
        return;
      } else {
        res.send(result);
        return;
      }
    }
  );
});
