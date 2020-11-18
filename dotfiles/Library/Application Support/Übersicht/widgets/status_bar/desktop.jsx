import Wifi from './components/wifi.jsx';
import Battery from './components/battery.jsx';
import { parse } from './helpers.jsx';

export const command = 'sh status_bar/scripts/desktop.sh';

export const refreshFrequency = 5000;

export const className = `
  bottom: 0;
  color: #FAFAFA;
  width: 100%;
  background-color: #0A0E14;

  .desktop {
    align-items: center;
    color: #A8A8A8;
    display: flex;
    font-size: 14px;
    height: 23px;
    margin-left: 20px;
  }

  .desktop > div {
    margin-right: 20px;
  }

  .desktop > div:nth-child(2) {
    margin-left: auto;
  }
`;

export const render = ({ output }) => {
  let data = parse(output);

  return (
    <div className="desktop">
      <div>{ data.date_time }</div>
      <Wifi data={ data.wifi } />
      <Battery data={ data.battery } />
    </div>
  );
};
