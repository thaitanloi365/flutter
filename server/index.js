var express = require("express");
var bodyParser = require("body-parser");

var app = express();

const PORT = 5000;

function randomIntFromInterval(min, max) {
  // min and max included
  return Math.floor(Math.random() * (max - min + 1) + min);
}

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.post("/login", bodyParser.json(), (req, res) => {
  const { username, password } = req.body;
  let success = false;
  let message = "Login failed";
  let errorCode = 500;
  let data = {};
  console.log("req.body", req.body);
  if (username == "test" && password == "1") {
    success = true;
    message = "Login successfully";
    errorCode = 200;
    data.token = "dummyToken";
    data.userId = "1111";
  }
  res.status(errorCode).send({ success, message, data });
});

app.get("/profile", (req, res) => {
  const { accessToken } = req.header;
  let success = false;
  let message = "Get list item failed";
  let errorCode = 500;
  let data = {};
  if (accessToken === "dumyToken") {
    success = true;
    message = "Get list item successfully";
    errorCode = 200;
    data.name = "Loi";
  } else {
    errorCode = 402;
    success = false;
    message = "Invalid token";
  }
  res.status(errorCode).send({ success, message, data });
});

app.get("/getListItem", (req, res) => {
  const { accessToken } = req.header;
  let success = false;
  let message = "Get list item failed";
  let errorCode = 500;
  let data = [];
  if (accessToken === "dumyToken") {
    success = true;
    message = "Get list item successfully";
    errorCode = 200;
    const items = [
      {
        name: "Coca",
        price: 20000,
        image: "https://product.hstatic.net/1000126467/product/coca-sleek-330ml-3.jpg"
      },
      {
        name: "Pepsi",
        price: 40000,
        image: "https://images-na.ssl-images-amazon.com/images/I/61ZcFT1BvDL._SX522_.jpg"
      },
      {
        name: "Revive",
        price: 10000,
        image:
          "https://csfood.vn/wp-content/uploads/2016/07/N%C6%B0%E1%BB%9Bc-u%E1%BB%91ng-Isotonic-7-Up-Revive-chai-500ml.jpg"
      },
      {
        name: "Tiger",
        price: 15000,
        image:
          "https://cdn.tgdd.vn/Products/Images/2282/77606/bhx/thung-bia-tiger-bac-lon-330ml-3-org.jpg"
      },
      {
        name: "RedBull",
        price: 12000,
        image:
          "https://cdn.tgdd.vn/Products/Images/2443/83742/bhx/nuoc-tang-luc-redbull-loc-6-lon-250ml-1511201814549.JPG"
      },
      {
        name: "Strongbows",
        price: 24000,
        image: "https://www.totalwine.com/media/sys_master/twmmedia/hec/hb6/10997609332766.png"
      }
    ];

    for (let i = 0; i < 50; i++) {
      const index = randomIntFromInterval(0, 5);
      data.push(items[index]);
    }
  } else {
    errorCode = 402;
    success = false;
    message = "Invalid token";
  }
  res.status(errorCode).send({ success, message, data });
});

app.listen(PORT, () => {
  console.log(`server running on port ${PORT}`);
});
