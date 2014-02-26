--A fork of mod_offline_mail except calls a URL 
--Which will foward the message to our mobile client.
--:)
--NOTE: Be sure to replace http://localhost/android/... to your URL
local jid_bare = require "util.jid".bare;
local http = require "socket.http";
local json_encode = require "util.json";
local mime = require("mime")

local send_message_as_push;

module:hook("message/offline/handle", function(event)
	local stanza = event.stanza;
	local text = stanza:get_child_text("body");
	if text then
		return send_message_as_push(jid_bare(stanza.attr.to), jid_bare(stanza.attr.from), text);
	end
end, 1);

function send_message_as_push(address, from_address, message_text, subject)
	module:log("info", "Forwarding offline message to %s via push", address);

	local post_url = "http://localhost/android/send_message2.php?to=".. urlencode(address) .. "&from=" .. urlencode(jid_bare(from_address)) .. "&body=" .. urlencode(message_text); 

	local ok, err = http.request(post_url);

	if not ok then
		module:log("error", "Failed to deliver to %s: %s", tostring(address), tostring(err));
		return;
	end
	return true;
end

function urlencode(str)
if (str) then
str = string.gsub (str, "\n", "\r\n")
str = string.gsub (str, "([^%w ])",
function (c) return string.format ("%%%02X", string.byte(c)) end)
str = string.gsub (str, " ", "+")
end
return str
end