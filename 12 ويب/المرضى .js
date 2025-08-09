import React, { useState } from 'react';

function PatientForm() {
  const [name, setName] = useState('');
  const [age, setAge] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('الاسم:', name);
    console.log('العمر:', age);
  };

  return (
    <form onSubmit={handleSubmit}>
      <label>الاسم:</label>
      <input type="text" value={name} onChange={(e) => setName(e.target.value)} />

      <label>العمر:</label>
      <input type="number" value={age} onChange={(e) => setAge(e.target.value)} />

      <button type="submit">حفظ</button>
    </form>
  );
}const handleSubmit = async (e) => {
  e.preventDefault();

  const response = await fetch('http://localhost/save_patient.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ name, age }),
  });

  const result = await response.text();
  console.log(result);
};