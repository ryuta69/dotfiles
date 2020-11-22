import DateDisplay from './lib/components/Date.jsx'
import Battery from './lib/components/Battery.jsx'
import Sound from './lib/components/Sound.jsx'
import Mic from './lib/components/Mic.jsx'
import Wifi from './lib/components/Wifi.jsx'
import Spotify from './lib/components/Spotify.jsx'
import Music from './lib/components/Music.jsx'
import BrowserTrack from './lib/components/BrowserTrack.jsx'
import Error from './lib/components/Error.jsx'

import { parseJson, getActiveWidgets } from './lib/utils.js'
import { getSettings } from './lib/settings.js'

import * as Styles from './lib/styles/Styles.js'

const refreshFrequency = 5000

const settings = getSettings()

const className = `
  ${Styles.BaseStyles}
  ${Styles.DateStyles}
  ${Styles.BatteryStyles}
  ${Styles.WifiStyles}
  ${Styles.MicStyles}
  ${Styles.SoundStyles}
  ${Styles.SpotifyStyles}
  ${Styles.MusicStyles}
  ${Styles.BrowserTrackStyles}
  ${Styles.SpecterStyles}

  ${settings.global.floatingBar ? Styles.FloatingBarOverride : ''}
  ${settings.global.noColorInData ? Styles.NoColorInDataOverride : ''}
  ${settings.global.noBarBg ? Styles.NoBarBgOverride : ''}
  ${settings.global.bottomBar ? Styles.BottomBarOverride : ''}
  ${settings.global.floatingBar && settings.global.bottomBar ? Styles.FloatinBottomBarOverride : ''}

`

const activeWidgets = getActiveWidgets(settings)
const { shell } = settings.global

const command = `${shell} simple-bar/lib/scripts/get_data.sh "${activeWidgets}"`

const render = ({ output, error }) => {
  if (error) return <Error widget="data" type="error" />
  if (!output) return <Error widget="data" type="noOutput" />

  const data = parseJson(output)
  if (!data) return <Error widget="data" type="noData" />

  const { battery, wifi, mic, sound, spotify, music, browserTrack } = data
  return (
    <div className="simple-bar simple-bar--data">
      <BrowserTrack output={{ ...browserTrack, spotifyStatus: spotify.spotifyIsRunning }} />
      <Spotify output={spotify} />
      <Music output={music} />
      <Battery output={battery} />
      <Mic output={mic} />
      <Sound output={sound} />
      <Wifi output={wifi} />
      <DateDisplay />
    </div>
  )
}

export { command, refreshFrequency, className, render }
