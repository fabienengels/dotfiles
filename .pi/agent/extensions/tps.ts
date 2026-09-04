/**
 * tps.ts - Tokens generated per second, live in the pi footer.
 *
 * - While an assistant message is streaming: live estimate (chars/4 heuristic,
 *   the same one pi uses internally for token estimation), refreshed on every
 *   stream delta.
 * - When the message completes: exact value from provider usage
 *   (output tokens / elapsed seconds).
 *
 * Shown on the footer extension-status line via ctx.ui.setStatus().
 * Pure ASCII, no extra dependencies.
 */
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

// Estimate generated tokens from assistant content blocks (chars/4 heuristic).
function estimateOutputTokens(content: unknown): number {
	let chars = 0;
	for (const block of (content as Array<Record<string, unknown>>) || []) {
		if (block.type === "text") {
			chars += String(block.text).length;
		} else if (block.type === "thinking") {
			chars += String(block.thinking).length;
		} else if (block.type === "toolCall") {
			chars += String(block.name).length + JSON.stringify(block.arguments).length;
		}
	}
	return Math.ceil(chars / 4);
}

export default function (pi: ExtensionAPI) {
	let startTime: number | undefined;

	pi.on("message_start", (event, ctx) => {
		if (event.message.role === "assistant") {
			startTime = Date.now();
		}
	});

	pi.on("message_update", (event, ctx) => {
		if (event.message.role !== "assistant" || !startTime) return;
		const elapsed = (Date.now() - startTime) / 1000;
		if (elapsed <= 0) return;
		const tps = estimateOutputTokens((event.message as { content?: unknown }).content) / elapsed;
		ctx.ui.setStatus("tps", ctx.ui.theme.fg("dim", `${Math.round(tps)}t/s`));
	});

	pi.on("message_end", (event, ctx) => {
		if (event.message.role !== "assistant" || !startTime) return;
		const elapsed = (Date.now() - startTime) / 1000;
		const output = (event.message as { usage?: { output?: number } }).usage?.output ?? 0;
		startTime = undefined;
		if (elapsed > 0 && output > 0) {
			ctx.ui.setStatus("tps", ctx.ui.theme.fg("dim", `${Math.round(output / elapsed)}t/s`));
		}
	});
}
