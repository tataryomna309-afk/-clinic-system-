   document.getElementById("appointmentForm").onsubmit = function(event) {
    event.preventDefault();
    document.getElementById("outPatientName").textContent = document.getElementById("patientName").value;
    document.getElementById("outDate").textContent = document.getElementById("date").value;
    document.getElementById("outTime").textContent = document.getElementById("time").value;
    document.getElementById("outDoctor").textContent = document.getElementById("doctor").value;
    document.getElementById("outNotes").textContent = document.getElementById("notes").value;
    document.getElementById("appointmentOutput").style.display = "block";
  };

    const output = document.getElementById("appointmentOutput");
      document.getElementById("appointmentForm").onsubmit = function(event) {
      event.preventDefault();
      document.getElementById("outPatientName").textContent = document.getElementById("patientName").value;
      document.getElementById("outDate").textContent = document.getElementById("date").value;
      document.getElementById("outTime").textContent = document.getElementById("time").value;
      document.getElementById("outDoctor").textContent = document.getElementById("doctor").value;
      document.getElementById("outNotes").textContent = document.getElementById("notes").value;
      output.style.display = "block";
    };