const fileInput = document.querySelector(`.fileInput`);
const fileSubmit = document.querySelector(`.fileSubmit`);
const tbody = document.querySelector(`tbody`);

fileSubmit.addEventListener(`click`, (e) => {
  const file = fileInput.files[0];
  const reader = new FileReader();

  reader.onload = function (event) {
    const fileContent = event.target.result;
    if (!file.name.includes(`_`) || !file.name.includes(`10.192.`)) {
      alert(`Nepareizs faila nosaukuma formāts`);
      return;
    }

    const [ip, date] = file.name.slice(0, -4).split(`_`);
    const dateFixed = date.replaceAll(`.`, `-`);
    console.log(ip, dateFixed);
    getValues(fileContent, ip, dateFixed);
  };
  reader.readAsText(file);
});

function getValues(fileContent, ip, date) {
  const startTxt = fileContent.indexOf(`:D`);
  const endTxt = fileContent.indexOf(`:END`);
  let resultTxt = fileContent
    .slice(startTxt, endTxt)
    .replaceAll(`:D`, ``)
    .replaceAll(`\r`, ``)
    .trimEnd();
  console.log(resultTxt);
  let matches;
  if (fileContent.includes(`Spuldzes`) || fileContent.includes(`Lamps`)) {
    const regex =
      /;[0-9]+;[0-9]+;([A-Za-z]+)([0-9]+)([A-Za-z])([0-9]+)(L|\b);OK;[0-9]+;[0-9]+;[0-9]+;([0-9]+);[0-9]+;([0-9]+);[0-9]+/g;
    matches = [...resultTxt.matchAll(regex)];
  } else if (
    fileContent.includes(`Program`) ||
    fileContent.includes(`Programmas`) ||
    fileContent.includes(`Programas`)
  ) {
    const regex =
      /;;[0-9]+;([0-9]+):([0-9]+) (([A-Z]\d|[a-zA-Z]\d-[a-zA-Z]\d|\d\d\d):([A-Z]+(?: [A-Z]+)?)|([A-Z]+\.) ([A-Z]+\d) (\D\D\D\D))/gm;
    matches = [...resultTxt.matchAll(regex)];
  }
  for (const match of matches) {
    const group1 = match[1];
    const group2 = match[2].replace(/(\d{2})(\d{2})(\d{2})/, "$1:$2:$3");
    const group3 = match[3];
    const group4 = match[4] || ``;
    const group5 = match[5] || ``;
    const group6 = match[6] || ``;
    const group7 = match[7] || ``;
    const group8 = match[8] || ``;
    if (fileContent.includes(`Spuldzes`) || fileContent.includes(`Lamps`)) {
      sendDupes(group1, group2, group3, group6, group7, ip, date);
      sendData(
        group1,
        group2,
        group3,
        group4,
        group5 || ``,
        group6,
        group7,
        ip,
        date
      );
      makeTable(
        group1,
        group2,
        group3,
        group4,
        group5 || ``,
        group6,
        group7,
        ip,
        date
      );
    } else if (
      fileContent.includes(`Program`) ||
      fileContent.includes(`Programmas`) ||
      fileContent.includes(`Programas`)
    ) {
      sendLogDupes(
        ip,
        group1,
        group2,
        group4 || null,
        group5 || group6,
        group7 || null,
        group8 || null
      );
      sendLogData(
        ip,
        group1,
        group2,
        group4 || null,
        group5 || group6,
        group7 || null,
        group8 || null
      );
    }
  }
}

function makeTable(g1, g2, g3, g4, g5, g6, g7, g8, g9) {
  const html = `<tr>
  <td>${g1}</td>
  <td>${g2}</td>
  <td>${g3}</td>
  <td>${g4}</td>
  <td>${g5}</td>
  <td>${g6}</td>
  <td>${g7}</td>
  <td>${g8}</td>
  <td>${g9}</td>
  </tr>`;

  tbody.insertAdjacentHTML(`afterbegin`, html);
}

async function sendDupes(type, direct, color, power, ref1, ip, date) {
  await fetch(`http://127.0.0.1:3000/dupes`, {
    headers: {
      "Content-type": "application/json",
    },
    method: "POST",
    body: JSON.stringify({
      type,
      direct,
      color,
      power,
      ref1,
      ip,
      date,
    }),
  })
    .then((response) => {
      console.log(response.status);
      console.log(response);
      return response.json();
    })
    .catch((e) => {
      console.log(e);
    });
}

async function sendData(
  type,
  direct,
  color,
  lamp,
  line,
  power,
  ref1,
  obj,
  date
) {
  await fetch(`http://127.0.0.1:3000/insert`, {
    headers: {
      "Content-type": "application/json",
    },
    method: "POST",
    body: JSON.stringify({
      type,
      direct,
      color,
      lamp,
      line,
      power,
      ref1,
      obj,
      date,
    }),
  })
    .then((response) => {
      // console.log(response.status);
      // console.log(response);
      return response.json();
    })
    .catch((e) => {
      // console.log(e);
    });
}

async function sendLogDupes(ip, date, time, code, error, unit, status) {
  await fetch(`http://127.0.0.1:3000/logdupes`, {
    headers: {
      "Content-type": "application/json",
    },
    method: "POST",
    body: JSON.stringify({
      ip,
      date,
      time,
      code,
      error,
      unit,
      status,
    }),
  })
    .then((response) => {
      console.log(response.status);
      console.log(response);
      return response.json();
    })
    .catch((e) => {
      console.log(e);
    });
}

async function sendLogData(ip, date, time, code, error, unit, status) {
  await fetch(`http://127.0.0.1:3000/insertlog`, {
    headers: {
      "Content-type": "application/json",
    },
    method: "POST",
    body: JSON.stringify({
      ip,
      date,
      time,
      code,
      error,
      unit,
      status,
    }),
  })
    .then((response) => {
      // console.log(response.status);
      // console.log(response);
      return response.json();
    })
    .catch((e) => {
      // console.log(e);
    });
}
