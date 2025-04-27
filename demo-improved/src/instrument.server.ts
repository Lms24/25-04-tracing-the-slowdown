import { NodeSDK } from "@opentelemetry/sdk-node";
import { getNodeAutoInstrumentations } from "@opentelemetry/auto-instrumentations-node";
import { OTLPTraceExporter } from "@opentelemetry/exporter-trace-otlp-proto";
import { createAddHookMessageChannel } from "import-in-the-middle";
import { register } from "module";
// import { diag, DiagConsoleLogger, DiagLogLevel } from '@opentelemetry/api';

const { registerOptions, waitForAllMessagesAcknowledged } =
  createAddHookMessageChannel();
register("import-in-the-middle/hook.mjs", import.meta.url, registerOptions);

// Configure the SDK to export telemetry data to the console
// Enable all auto-instrumentations from the meta package
const sdk = new NodeSDK({
  serviceName: "demo-todo-app",
  traceExporter: new OTLPTraceExporter(),
  instrumentations: [getNodeAutoInstrumentations()],
});

sdk.start();

// diag.setLogger(new DiagConsoleLogger(), DiagLogLevel.ALL);

await waitForAllMessagesAcknowledged();
