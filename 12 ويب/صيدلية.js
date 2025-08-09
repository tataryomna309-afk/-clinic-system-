
    const form = document.getElementById("pharmacyForm");
    const output = document.getElementById("medOutput");

    form.onsubmit = function(e) {
      e.preventDefault();
      document.getElementById("outName").textContent = document.getElementById("medName").value;
      document.getElementById("outQty").textContent = document.getElementById("medQty").value;
      document.getElementById("outPrice").textContent = document.getElementById("medPrice").value;
      document.getElementById("outDate").textContent = document.getElementById("medDate").value;
      output.style.display = "block";
    };



  function updateMedImage() {
    const med = document.getElementById("medName").value;
    const img = document.getElementById("medImg");

    const images = {
      "باراسيتامول": "https://i.imgur.com/3x9fUOv.png",
      "أوغمنتين": "https://i.imgur.com/k0Y4HyS.png",
      "فولتارين": "https://i.imgur.com/EfK7Eys.png",
      "بنادول": "https://i.imgur.com/2Aa5LKP.png",
      "إيبوبروفين": "https://i.imgur.com/fYNGSlj.png"
    };

    if (images[med]) {
      img.src = images[med];
      img.style.display = "block";
    } else {
      img.style.display = "none";
    }
  }
