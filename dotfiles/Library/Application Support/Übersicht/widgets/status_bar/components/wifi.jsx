const Wifi = ({ data }) => (
  <div style={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
    <i
      className="fas fa-wifi"
      style={{ marginRight: 5, color: !data.ssid ? 'red' : '' }}
    />
    <div>{ data.ssid }</div>
  </div>
);

export default Wifi;
