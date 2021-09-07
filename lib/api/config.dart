const HOST = "giraffeapp.co";
const PROTOCOL = "https";
const BASE_API_ENDPOINT = "api";

const API_URL = "$PROTOCOL://$HOST/$BASE_API_ENDPOINT";

const LOCATION_SOCKET_URL = "$PROTOCOL://$HOST/location";
const CHAT_SOCKET_URL = "$PROTOCOL://$HOST/chat";
const JOB_SOCKET_URL = "$PROTOCOL://$HOST/job";

// TODO (cleanup): move this to a separate config file, or move this config file out of lib/apis
const INACTIVITY_TIMEOUT = const Duration(minutes: 15);
