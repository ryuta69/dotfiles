const iconPicker = (level, status) => {
  if (status === 'AC') {
    return 'fa-bolt';
  } else if (level < 10) {
    return 'fa-battery-empty';
  } else if (level < 20) {
    return 'fa-battery-quarter';
  } else if (level < 50) {
    return 'fa-battery-half';
  } else if (level < 80) {
    return 'fa-battery-three-quarters';
  } else {
    return 'fa-battery-full';
  }
};

const iconColorPicker = level => {
  if (level > 20) {
    return '#09ff09';
  } else if (level > 10 && level <= 20) {
    return '#ffab12';
  } else {
    return 'red';
  }
};

const Battery = ({ data }) => (
  <div>
    <i
      className={`fas ${iconPicker(data.level, data.status)}`}
      style={{
        color: iconColorPicker(data.level),
      }}
    />
    &nbsp;
    { data.level }%
  </div>
);

export default Battery;
