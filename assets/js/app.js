import css from '../css/app.css'
import 'phoenix_html'
import { Socket } from 'phoenix'
import LiveSocket from 'phoenix_live_view'

let hooks = {
  /**
   * Select input text on focus
   */
  select: {
    mounted() {
      this.el.addEventListener('focus', ({ target }) => target.select())
      this.el.focus()
    }
  }
}

new LiveSocket('/todos', Socket, { hooks }).connect()
