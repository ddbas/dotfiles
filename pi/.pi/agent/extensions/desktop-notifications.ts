/**
 * Desktop Notifications Extension for Pi
 *
 * Sends a native macOS notification when the agent finishes a response,
 * using osascript (built-in, no dependencies required).
 */

import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { execFile } from "node:child_process";

function notify(title: string, subtitle: string, body: string): void {
  const safe = (s: string) => s.replace(/\\/g, "\\\\").replace(/"/g, '\\"');
  const script = `display notification "${safe(body)}" with title "${safe(title)}" subtitle "${safe(subtitle)}" sound name "Glass"`;
  execFile("osascript", ["-e", script], (err, _stdout, stderr) => {
    if (err) console.error("[desktop-notifications] osascript error:", err.message, stderr);
  });
}

export default function (pi: ExtensionAPI) {
  pi.on("agent_end", async (event) => {
    const toolCallCount = (event.messages as any[]).filter(
      (m) => m.role === "tool"
    ).length;

    const toolStr =
      toolCallCount > 0
        ? `🔧 ${toolCallCount} tool${toolCallCount !== 1 ? "s" : ""} used`
        : "💬 No tools";

    const time = new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" });

    notify("Pi 🤖", "✅ Done — ready for input", `${toolStr} · ${time}`);
  });
}
