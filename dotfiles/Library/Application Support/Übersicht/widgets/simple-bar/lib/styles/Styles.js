import { Colors } from './Colors.js'

export const BaseStyles = /* css */ `
.simple-bar {
  position: fixed;
  top: 0;
  display: flex;
  align-items: center;
  padding: 4px 5px;
  box-sizing: border-box;
  color: ${Colors.foreground};
  font-size: 11px;
  font-family: ${Colors.font};
}
.simple-bar--process {
  left: 0;
  width: 100%;
  height: 28px;
  background-color: ${Colors.background};
  box-shadow: ${Colors.lightShadow};
  z-index: 0;
}
.simple-bar--spaces {
  left: 0;
  z-index: 1;
}
.simple-bar--data {
  right: 0;
  margin-left: auto;
  color: ${Colors.main};
  z-index: 1;
}
.simple-bar--data > *:not(:last-of-type) {
  margin-right: 5px;
}
.simple-bar--empty {
  height: 28px;
  display: flex;
  align-items: center;
}
.simple-bar--spaces.simple-bar--empty,
.simple-bar--data.simple-bar--empty {
  z-index: 2;
}
.simple-bar--process.simple-bar--empty {
  width: 100%;
  justify-content: center;
}
.simple-bar--data.simple-bar--empty {
  justify-content: flex-end;
  color: white;
}
.simple-bar--empty > span {
  position: relative;
  display: flex;
  align-items: center;
}
.simple-bar--empty > span::before {
  content: "";
  width: 6px;
  height: 6px;
  margin-right: 7px;
  background-color: ${Colors.red};
  border-radius: 50%;
}
.simple-bar--empty.simple-bar--loading > span::before {
  background-color: ${Colors.green};
}
`

export const FloatingBarOverride = /* css */ `
.simple-bar {
  top: 5px;
}
.simple-bar--spaces {
  left: 5px;
}
.simple-bar--process {
  left: 5px;
  width: calc(100% - 10px);
  border-radius: 3px;
}
.simple-bar--data {
  right: 5px;
}

.settings--visible .settings__overlay {
  display: none;
}
.settings__outer {
  top: 43px;
}
`

export const NoBarBgOverride = /* css */ `
.simple-bar {
  padding: 0;
}
.simple-bar--process {
  background-color: transparent;
  box-shadow: none;
}
.simple-bar--data,
.spaces,
.process {
  padding: 4px 5px;
  background-color: ${Colors.background};
  box-shadow: ${Colors.lightShadow};
  border-radius: 3px;
}
.process {
  height: 20px;
  display: flex;
  align-items: center;
  padding: 4px 10px;
}

.settings--visible .settings__overlay {
  display: none;
}
`

export const NoColorInDataOverride = /* css */ `
.simple-bar--data {
  color: #fff;
}
.spotify,
.music,
.browser-track,
.battery,
.mic,
.sound,
.wifi,
.date,
.time {
  background-color: ${Colors.minor};
}
.battery--caffeinate {
  color: ${Colors.main};
  background-color: #fff;
}
.spotify__icon,
.music__icon,
.browser-track__icons > svg:nth-of-type(1),
.browser-track__icons > svg:nth-of-type(2),
.battery__icon,
.mic__icon,
.sound__icon,
.wifi__icon,
.date__icon,
.time__icon,
.battery__charging-icon-fill,
.battery__caffeinate-icon {
  fill: #fff;
}
.battery--caffeinate .battery__icon,
.battery--caffeinate .battery__charging-icon-fill,
.battery--caffeinate .battery__caffeinate-icon {
  fill: ${Colors.minor};
}
.battery__charging-icon-outline-left,
.battery__charging-icon-outline-right {
  fill: ${Colors.minor};
}

.battery--caffeinate .battery__charging-icon-outline-left,
.battery--caffeinate .battery__charging-icon-outline-right {
  fill: #fff;
}
.battery__icon {
  border: 1px solid #fff;
}
.battery--caffeinate .battery__icon {
  border: 1px solid ${Colors.main};
}
.battery__icon::after {
  background-color: #fff;
}
.battery__icon-filler {
  background-color: #fff;
  opacity: 0.8;
}
.battery--caffeinate .battery__icon::after,
.battery--caffeinate .battery__icon-filler {
  background-color: ${Colors.main};
}
.browser-track__icons > svg:nth-of-type(2) {
  stroke: ${Colors.minor};
}
.specter > span {
  background-color: #fff;
}
`

export const BottomBarOverride = /* css */ `
.simple-bar {
  top: unset;
  bottom: 0;
}

.settings--visible .settings__overlay {
  top: unset;
  bottom: 28px;
}
.settings__outer {
  top: unset;
  bottom: 38px;
  transform: translate(0, 50px) scale(0.8);
}

.space-options {
  top: unset;
  bottom: calc(100% + 3px);
  left: -2px;
  transform-origin: bottom center;
}
.space-options::after {
  content: '';
  top: unset;
  bottom: -3px;
  left: 8px;
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-top: 3px solid #fff;
  border-bottom: none;
}
`

export const FloatinBottomBarOverride = /* css */ `
.simple-bar {
  top: unset;
  bottom: 5px;
}
`

export const SpacesStyles = /* css */ `
.spaces {
  flex: 0 0 auto;
  display: flex;
  list-style: none;
}
.space {
  position: relative;
  transform-origin: left;
  animation: space-appearance 320ms ${Colors.easing};
}
@keyframes space-appearance {
  0% {
    opacity: 0;
    transform: scale(0);
  }
  100% {
    opacity: 1;
    transform: none;
  }
}
.space__inner,
.spaces__add {
  display: flex;
  align-items: center;
  font-size: 10px;
  margin-right: 5px;
  padding: 3px 6px;
  height: 13px;
  color: black;
  background-color: ${Colors.magenta};
  border-radius: 2px;
  box-shadow: ${Colors.lightShadow};
  cursor: pointer;
  user-select: none;
  transform: translateZ(0);
  transition: color 320ms ${Colors.easing}, background-color 320ms ${Colors.easing}, transform 320ms ${Colors.easing};
  z-index: 0;
}
.space:hover .space__inner {
  z-index: 1;
}
.spaces__add {
  margin-right: 0;
  background-color: transparent;
  box-shadow: none;
}
.space__inner:active,
.spaces__add:active {
  transform: translateZ(0) scale(0.85);
}
.space--fullscreen .space__inner {
  color: ${Colors.minor};
  background-color: ${Colors.yellow};
}
.space--focused .space__inner {
  color: ${Colors.main};
  background-color: ${Colors.cyan};
}
.space__icon {
  flex: 0 0 11px;
  width: 11px;
  height: 11px;
  margin-left: 6px;
  margin-right: 3px;
  margin-bottom: -2px;
  fill: currentColor;
  transform: translateZ(0);
}
.space__icon--focused {
  opacity: 1;
}
.space-options {
  position: absolute;
  top: calc(100% + 3px);
  left: -2px;
  height: 90%;
  width: 50px;
  height: 18px;
  display: flex;
  align-items: stretch;
  background-color: #fff;
  opacity: 0;
  pointer-events: none;
  touch-action: none;
  border-radius: 3px;
  box-shadow: ${Colors.lightShadow};
  transform-origin: top center;
  transform: translateZ(0) scale(0);
  transition: opacity 160ms ${Colors.easing}, transform 160ms ${Colors.easing};
  z-index: 1;
}
.space--hovered .space-options {
  opacity: 1;
  transform: translateZ(0);
  pointer-events: auto;
  touch-action: auto;
  transition: opacity 160ms 1s ${Colors.easing}, transform 160ms 1s ${Colors.easing};
}
.space--hovered.space--no-delay .space-options {
  transition: opacity 160ms ${Colors.easing}, transform 160ms ${Colors.easing};
}
.space-options::before {
  content: "";
  position: absolute;
  bottom: 100%;
  left: 0;
  width: 100%;
  height: 3px;
  z-index: 2;
}
.space-options::after {
  content: '';
  position: absolute;
  top: -3px;
  left: 8px;
  width: 0;
  height: 0;
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-bottom: 3px solid #fff;
}
.space-options__option {
  position: relative;
  flex: 1 1 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  user-select: none;
  transform: translateZ(0);
  transition: background-color 160ms ${Colors.easing}, opacity 160ms ${Colors.easing};
}
.space-options__option:last-child {
  opacity: 0.8;
  background-color: ${Colors.red};
}
.space--fullscreen .space-options__option:last-child,
.space:first-of-type:only-of-type .space-options__option:last-child,
.space:first-of-type:nth-last-of-type(2) .space-options__option:last-child {
  pointer-events: none;
  touch-action: none;
  opacity: 0.5;
  filter: grayscale(100%);
}
.space:first-of-type .space-options__option--move-prev,
.space:nth-last-of-type(2) .space-options__option--move-next,
.space:first-of-type:only-of-type .space-options__option--move-prev,
.space:first-of-type:only-of-type .space-options__option--move-next,
.space:first-of-type:nth-last-of-type(2) .space-options__option--move-prev,
.space:first-of-type:nth-last-of-type(2) .space-options__option--move-next {
  opacity: 0.2;
  pointer-events: none;
  touch-action: none;
}
.space .space-options__option:first-of-type {
  border-radius: 3px 0 0 3px;
}
.space-options__option:last-of-type {
  border-radius: 0 3px 3px 0;
}
.space-options__option:not(:last-child):hover {
  background-color: ${Colors.lightGrey};
}
.space-options__option:last-child:hover {
  opacity: 1;
}
.space-options__option > svg {
  width: 8px;
  height: 8px;
  fill: ${Colors.main};
  curor: pointer;
  user-select: none;
}
.space-options__option:last-child > svg {
  fill: #fff;
}
.spaces__add > svg {
  width: 10px;
  height: 10px;
  fill: ${Colors.background};
}
`

export const ProcessStyles = /* css */ `
.process {
  position: absolute;
  top: 50%;
  left: 50%;
  min-width: 60px;
  min-height: 12px;
  max-width: 20%;
  text-align: center;
  white-space: nowrap;
  text-overflow: ellipsis;
  transform: translate(-50%, -50%);
  overflow: hidden;
  border-radius: 4px;
}
`

export const SettingsStyles = /* css */ `
.settings {
  z-index: 0;
}
.settings--visible .settings__overlay {
  position: fixed;
  top: 28px;
  left: 0;
  width: 100%;
  height: calc(100% - 28px);
  background-color: rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(15px);
  z-index: 0;
}
.settings__outer {
  position: fixed;
  left: calc(50% - 300px);
  top: 38px;
  width: 600px;
  display: flex;
  flex-direction: column;
  align-items: stretch;
  padding: 20px;
  background-color: ${Colors.main};
  border-radius: 4px;
  box-shadow: ${Colors.lightShadow};
  opacity: 0;
  transform: translate(0, -50px) scale(0.8);
  pointer-events: none;
  touch-action: none;
  transition: opacity 160ms ${Colors.easing}, transform 160ms ${Colors.easing};
  z-index: 1;
}
.settings--visible .settings__outer {
  pointer-events: auto;
  touch-action: auto;
  opacity: 1;
  transform: none;
}
.settings__header {
  display: flex;
  align-items: center;
  margin-bottom: 14px;
  font-size: 16px;
  font-weight: 700;
}
.settings__close {
  width: 10px;
  height: 10px;
  margin-left: auto;
  cursor: pointer;
  user-select: none;
  fill: white;
}
.settings__tabs {
  display: flex;
  margin-bottom 20px;
}
.settings__tab {
  flex: 0 1 auto;
  display: flex;
  align-items: center;
  padding: 5px;
  text-align: center;
  border-radius: 3px;
  cursor: pointer;
  user-select: none;
  transition: color 160ms ${Colors.easing}, background-color 160ms ${Colors.easing};
}
.settings__tab:not(:last-of-type) {
  margin-right: 10px;
}
.settings__tab:not(.settings__tab--current):hover {
  background-color: ${Colors.minor};
}
.settings__tab--current {
  color: ${Colors.main};
  background-color: #fff;
}
.settings__inner {
  display: flex;
  align-items: flex-start;
  flex-wrap: nowrap;
  overflow: hidden;
}
.settings__category {
  flex: 0 0 100%;
  display: flex;
  flex-wrap: wrap;
  transition: transform 160ms ${Colors.easing};
}
.settings__inner-title {
  flex: 0 0 100%;
  margin-bottom: 10px;
  font-size: 14px;
  font-weight: 700;
}
.settings__item-title {
  flex: 0 0 100%;
  margin: 8px 0;
  font-weight: 700;
}
.settings__item,
.settings__item-option {
  flex: 0 0 33.33%;
  margin-bottom: 5px;
}
.settings__item--full-width {
  flex: 0 0 100%;
  display: flex;
  align-items: center;
}
.settings__item--radio {
  flex: 0 0 100%;
  display: flex;
  flex-wrap: wrap;
  margin-bottom: 0;
}
.settings__item > label,
.settings__item-option > label {
  margin-left: 8px;
}
.settings__item--text > label {
  margin-left: 0;
  margin-right: 8px;
}
.settings__item--full-width.settings__item--text > label {
  flex: 1 1 auto;
  white-space: nowrap;
}
.settings__item--text > input {
  width: auto;
  padding: 1px 4px;
  font-size: 10px;
  box-sizing: border-box;
  border: 0;
  border-radius: 4px;
}
.settings__item--full-width.settings__item--text > input {
  flex: 1 1 100%;
}
.settings__item--text > input:focus {
  outline: none;
}
.settings__infos {
  width: 100%;
  margin-top: 5px;
  padding: 10px;
  background-color: ${Colors.minor};
  border-radius: 5px;
}
.settings__infos-title {
  margin-bottom: 7px;
  font-size: 12px;
  font-weight: 700;
}
.settings__info {
  font-style: italic;
}
`

export const BatteryStyles = /* css */ `
.battery {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 3px 7px;
  background-color: ${Colors.magenta};
  border-radius: 2px;
  box-shadow: ${Colors.lightShadow};
  cursor: pointer;
  user-select: none;
  overflow: hidden;
  opacity: 0.9;
  transition: background-color 160ms ${Colors.easing}, opacity 160ms ${Colors.easing}, transform 160ms ${Colors.easing};
}
.battery--caffeinate {
  background-color: #fff;
}
.battery:hover {
  opacity: 1;
}
.battery:active {
  transform: scale(0.9);
}
.battery__charging-icon {
  position: relative;
  width: 10px;
  height: 10px;
  margin: 0 auto;
}
.battery__charging-icon-fill,
.battery__charging-icon-outline-left,
.battery__charging-icon-outline-right {
  position: absolute;
  width: inherit;
  height: inherit;
}
.battery__charging-icon-fill {
  fill: ${Colors.main};
  z-index: 3;
}
.battery__charging-icon-outline-left,
.battery__charging-icon-outline-right {
  fill: ${Colors.magenta};
  z-index: 2;
}
.battery--caffeinate .battery__charging-icon-outline-left,
.battery--caffeinate .battery__charging-icon-outline-right {
  fill: #fff;
}
.battery__charging-icon-outline-left {
  left: -1px;
}
.battery__charging-icon-outline-right {
  left: 1px;
}
.battery__icon {
  position: relative;
  width: 16px;
  height: 9px;
  margin-right: 8px;
  border-radius: 2px;
  border: 1px solid ${Colors.main};
}
.battery__icon::after {
  content: '';
  position: absolute;
  top: 10%;
  left: 100%;
  width: 3px;
  height: 80%;
  border-radius: 0 2px 2px 0;
  background-color: ${Colors.main};
}
.battery__icon-filler {
  position: absolute;
  top: 1px;
  left: 1px;
  width: calc(100% - 2px);
  height: calc(100% - 2px);
  background-color: ${Colors.minor};
  border-radius: 1px;
  transform: scaleX(0);
  transform-origin: left center;
  transition: transform 160ms ${Colors.easing};
  z-index: 1;
}
.battery--low .battery__icon-filler {
  background-color: ${Colors.red};
}
.battery__caffeinate-icon {
  position: absolute;
  top: calc(50% - 10px);
  right: 1px;
  width: 20px;
  height: 20px;
  box-sizing: border-box;
  fill: ${Colors.main};
  opacity: 0.3;
}
`

export const MicStyles = /* css */ `
  .mic {
    background-color: ${Colors.orange};
    display: flex;
    align-items: center;
    padding: 3px 7px;
    border-radius: 2px;
    box-shadow: ${Colors.lightShadow};
    cursor: pointer;
    user-select: none;
    opacity: 0.9;
    transition: opacity 160ms ${Colors.easing}, transform 160ms ${Colors.easing};
  }
  .mic:hover {
    opacity: 1;
  }
  .mic:active {
    transform: scale(0.9);
  }
  .mic__icon {
    width: 14px;
    height: 14px;
    margin-right: 4px;
    fill: ${Colors.main};
    transform: translateZ(0);
  }
`

export const SoundStyles = /* css */ `
  .sound {
    display: flex;
    align-items: center;
    padding: 3px 7px;
    background-color: ${Colors.blue};
    border-radius: 2px;
    box-shadow: ${Colors.lightShadow};
  }
  .sound__icon {
    width: 14px;
    height: 14px;
    margin-right: 4px;
    fill: ${Colors.main};
  }
`

export const WifiStyles = /* css */ `
  .wifi {
    display: flex;
    align-items: center;
    padding: 3px 7px;
    background-color: ${Colors.red};
    border-radius: 2px;
    box-shadow: ${Colors.lightShadow};
    cursor: pointer;
    user-select: none;
    opacity: 0.9;
    transition: opacity 160ms ${Colors.easing}, transform 160ms ${Colors.easing};
  }
  .wifi:hover {
    opacity: 1;
  }
  .wifi:active {
    transform: scale(0.9);
  }
  .wifi__icon {
    width: 14px;
    height: 14px;
    margin-right: 7px;
    fill: ${Colors.main};
    transform: translateZ(0);
  }
`

export const DateStyles = /* css */ `
.date {
  display: flex;
  align-items: center;
  padding: 3px 7px;
  background-color: ${Colors.cyan};
  border-radius: 2px;
  box-shadow: ${Colors.lightShadow};
}
.date__icon {
  width: 14px;
  height: 14px;
  margin-right: 7px;
  fill: ${Colors.main};
}
`

export const TimeStyles = /* css */ `
.time {
  position: relative;
  display: flex;
  align-items: center;
  padding: 3px 7px;
  background-color: ${Colors.yellow};
  border-radius: 2px;
  box-shadow: ${Colors.lightShadow};
}
.time__icon {
  width: 14px;
  height: 14px;
  margin-right: 7px;
  fill: ${Colors.main};
}
.time__filler {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  transform: scaleX(0);
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: inherit;
  transform-origin: left;
  pointer-events: none;
  touch-action: none;
}
`

export const SpotifyStyles = /* css */ `
.spotify {
  position: relative;
  display: flex;
  align-items: center;
  padding: 3px 7px;
  background-color: ${Colors.green};
  border-radius: 2px;
  box-shadow: ${Colors.lightShadow};
  cursor: pointer;
  user-select: none;
  opacity: 0.9;
  transition: opacity 160ms ${Colors.easing}, transform 160ms ${Colors.easing};
}
.spotify:hover {
  opacity: 1;
}
.spotify:active {
  transform: scale(0.9);
}
.spotify__icon {
  width: 10px;
  height: 10px;
  margin-right: 7px;
  fill: ${Colors.main};
}
.spotify__inner {
  max-width: 140px;
  display: flex;
  flew-wrap: nowrap;
  overflow: hidden;
}
.spotify__slider {
  white-space: nowrap;
  transition: transform 160ms ${Colors.easing};
}
`

export const MusicStyles = /* css */ `
.music {
  position: relative;
  display: flex;
  align-items: center;
  padding: 3px 7px;
  background-color: ${Colors.green};
  border-radius: 2px;
  box-shadow: ${Colors.lightShadow};
  cursor: pointer;
  user-select: none;
  opacity: 0.9;
  transition: opacity 160ms ${Colors.easing}, transform 160ms ${Colors.easing};
}
.music:hover {
  opacity: 1;
}
.music:active {
  transform: scale(0.9);
}
.music__icon {
  width: 10px;
  height: 10px;
  margin-right: 7px;
  fill: ${Colors.main};
}
.music__inner {
  max-width: 140px;
  display: flex;
  flew-wrap: nowrap;
  overflow: hidden;
}
.music__slider {
  white-space: nowrap;
  transition: transform 160ms ${Colors.easing};
}
`

export const BrowserTrackStyles = /* css */ `
.browser-track {
  position: relative;
  display: flex;
  align-items: center;
  padding: 3px 7px;
  background-color: ${Colors.green};
  border-radius: 2px;
  box-shadow: ${Colors.lightShadow};
  transition: opacity 160ms ${Colors.easing}, transform 160ms ${Colors.easing};
}
.browser-track__icons {
  position: relative;
}
.browser-track__icons > svg:nth-of-type(1) {
  width: 10px;
  height: 10px;
  margin-right: 7px;
  fill: ${Colors.main};
}
.browser-track__icons > svg:nth-of-type(2) {
  position: absolute;
  bottom: -1px;
  right: 2px;
  width: 10px;
  height: 10px;
  stroke: ${Colors.green};
  stroke-width: 3px;
}
.browser-track__inner {
  max-width: 140px;
  display: flex;
  flew-wrap: nowrap;
  overflow: hidden;
}
.browser-track__slider {
  white-space: nowrap;
  transition: transform 160ms ${Colors.easing};
}
`

export const SpecterStyles = /* css */ `
.specter {
  position: absolute;
  bottom: 0;
  right: 30px;
  display: flex;
  align-items: flex-end;
  z-index: 2;
  pointer-events: none;
  touch-action: none;
}
.specter > span {
  flex: 0 0 5px;
  height: 15px;
  max-height: 4px;
  margin-left: 1px;
  background-color: ${Colors.main};
  opacity: 0.1;
  transition: max-height 160ms ${Colors.easing};
}
.specter > span:nth-of-type(1) {
  animation: specter-waving 640ms -460ms ${Colors.easing} infinite;
}
.specter > span:nth-of-type(2) {
  animation: specter-waving 640ms -320ms ${Colors.easing} infinite;
}
.specter > span:nth-of-type(3) {
  animation: specter-waving 640ms -200ms ${Colors.easing} infinite;
}
.specter > span:nth-of-type(4) {
  animation: specter-waving 640ms -240ms ${Colors.easing} infinite;
}
.specter > span:nth-of-type(5) {
  animation: specter-waving 640ms -150ms ${Colors.easing} infinite;
}
@keyframes specter-waving {
  0%,
  100% {
    max-height: 4px;
  }
  50% {
    max-height: 15px;
  }
}
`
