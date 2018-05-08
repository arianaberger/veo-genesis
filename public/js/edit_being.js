function bodyChange(radioObject) {
  var id = radioObject.value;

  document.getElementById("prev_body").src = `/img/body${id}.png`;
};

function bodyColorChange(rangeObject) {
  var angle = Math.round(rangeObject.value * 3.6);
  var bright = document.getElementById("body_brightness").value / 2 + 50;

  document.getElementById("prev_body").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function bodyBrightnessChange(rangeObject) {
  var angle = Math.round(document.getElementById("body_color").value * 3.6)
  var bright = rangeObject.value / 2 + 50;

  document.getElementById("prev_body").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function headChange(radioObject) {
  var id = radioObject.value;

  document.getElementById("prev_head").src = `/img/head${id}.png`;
};

function headColorChange(rangeObject) {
  var angle = Math.round(rangeObject.value * 3.6);
  var bright = document.getElementById("head_brightness").value / 2 + 50;

  document.getElementById("prev_head").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function headBrightnessChange(rangeObject) {
  var angle = Math.round(document.getElementById("head_color").value * 3.6)
  var bright = rangeObject.value / 2 + 50;

  document.getElementById("prev_head").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function eyesChange(radioObject) {
  var id = radioObject.value;

  document.getElementById("prev_eyes").src = `/img/eyes${id}.png`;
};

function eyesColorChange(rangeObject) {
  var angle = Math.round(rangeObject.value * 3.6);
  var bright = document.getElementById("eyes_brightness").value / 2 + 50;

  document.getElementById("prev_eyes").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function eyesBrightnessChange(rangeObject) {
  var angle = Math.round(document.getElementById("eyes_color").value * 3.6)
  var bright = rangeObject.value / 2 + 50;

  document.getElementById("prev_eyes").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};
