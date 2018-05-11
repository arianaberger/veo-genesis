function bodyChange(radioObject) {
  var model = radioObject.value;

  document.getElementBymodel("body_preview").src = `/img/body${model}.png`;
};

function bodyColorChange(rangeObject) {
  var angle = Math.round(rangeObject.value * 3.6);
  var bright = document.getElementBymodel("body_brightness").value / 2 + 50;

  document.getElementBymodel("body_preview").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function bodyBrightnessChange(rangeObject) {
  var angle = Math.round(document.getElementBymodel("body_color").value * 3.6)
  var bright = rangeObject.value / 2 + 50;

  document.getElementBymodel("body_preview").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function headChange(radioObject) {
  var model = radioObject.value;

  document.getElementBymodel("head_preview").src = `/img/head${model}.png`;
};

function headColorChange(rangeObject) {
  var angle = Math.round(rangeObject.value * 3.6);
  var bright = document.getElementBymodel("head_brightness").value / 2 + 50;

  document.getElementBymodel("head_preview").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function headBrightnessChange(rangeObject) {
  var angle = Math.round(document.getElementBymodel("head_color").value * 3.6)
  var bright = rangeObject.value / 2 + 50;

  document.getElementBymodel("head_preview").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function eyesChange(radioObject) {
  var model = radioObject.value;

  document.getElementBymodel("eyes_preview").src = `/img/eyes${model}.png`;
};

function eyesColorChange(rangeObject) {
  var angle = Math.round(rangeObject.value * 3.6);
  var bright = document.getElementBymodel("eyes_brightness").value / 2 + 50;

  document.getElementBymodel("eyes_preview").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};

function eyesBrightnessChange(rangeObject) {
  var angle = Math.round(document.getElementBymodel("eyes_color").value * 3.6)
  var bright = rangeObject.value / 2 + 50;

  document.getElementBymodel("eyes_preview").style.filter = 
    `brightness(${bright}%) hue-rotate(${angle}deg)`;
};
