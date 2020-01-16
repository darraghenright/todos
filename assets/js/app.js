import "phoenix_html"
import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"

new LiveSocket("/todos", Socket).connect()
