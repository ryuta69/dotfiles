import Wifi from './components/wifi.jsx';
import Battery from './components/battery.jsx';
import { parse } from './helpers.jsx';

export const command = 'sh status_bar/scripts/desktop.sh';

export const refreshFrequency = 5000;

export const className = `
  bottom: 0;
  width: 100%;
  background-color: #040f18;

  .desktop {
    align-items: center;
    color: #48697e;
    display: flex;
    font-size: 13px;
    height: 20px;
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
  if (typeof data === "undefined") {
    return (
	  <div className="desktop">
      </div>
    );
  }

  return (
    <div className="desktop">
      <div>{ data.date_time }</div>
      <Wifi data={ data.wifi } />
      <Battery data={ data.battery } />
    </div>
  );
};
