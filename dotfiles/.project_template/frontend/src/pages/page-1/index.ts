import './style.scss';
import { testString } from '@ts/test';

document.addEventListener('DOMContentLoaded', () => {
  const sampleButton = document.getElementById('sampleButton');

  if (!sampleButton) return;

  sampleButton.addEventListener('click', () => {
    alert(testString);
  });
});
