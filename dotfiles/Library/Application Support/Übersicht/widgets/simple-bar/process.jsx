import Process from './lib/components/Process.jsx'
import Settings from './lib/components/Settings.jsx'
import Error from './lib/components/Error.jsx'

import { parseJson } from './lib/utils.js'
import { getSettings } from './lib/settings.js'

import * as Styles from './lib/styles/Styles.js'

const refreshFrequency = false

const settings = getSettings()

const className = `
  ${Styles.BaseStyles}
  ${Styles.ProcessStyles}
  ${Styles.SettingsStyles}

  ${settings.global.floatingBar ? Styles.FloatingBarOverride : ''}
  ${settings.global.noBarBg ? Styles.NoBarBgOverride : ''}
  ${settings.global.bottomBar ? Styles.BottomBarOverride : ''}
  ${settings.global.floatingBar && settings.global.bottomBar ? Styles.FloatinBottomBarOverride : ''}
`

const { shell } = settings.global

const command = `${shell} simple-bar/lib/scripts/get_process.sh`

const render = ({ output, error }) => {
  if (error) return <Error widget="process" type="error" />
  if (!output) return <Error widget="process" type="noOutput" />

  const data = parseJson(output)
  if (!data) return <Error widget="process" type="noData" />

  const { process } = data
  return (
    <div className="simple-bar simple-bar--process">
      <Process output={process} />
      <Settings />
    </div>
  )
}

export { command, refreshFrequency, className, render }
