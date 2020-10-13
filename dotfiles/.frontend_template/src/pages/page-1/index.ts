import './style.scss';
import { testString } from '@ts/sample/test';

document.addEventListener('DOMContentLoaded', () => {
  const sampleButton = document.getElementById('sampleButton');

  if (!sampleButton) return;

  sampleButton.addEventListener('click', () => {
    alert(testString);
  });
});
