import get from 'lodash/fp/get';
import trim from 'lodash/fp/trim';

const Wifi = ({ data }) => (
  <div style={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
    <i
      className="fas fa-wifi"
      style={{ marginRight: 5, color: !trim(get('ssid')(data)) ? 'red' : '' }}
    />
    <div>{get('ssid')(data)}</div>
  </div>
);

export default Wifi;
