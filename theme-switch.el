(require 'request)
(require 'json)

(defun getJsonSunData()
"This function gets Json data from \"http://api.sunrise-sunset.org/json\". It
is their API that I am using for this little program."
 (request
 "http://api.sunrise-sunset.org/json?";
 :params '(("lat" . "57.70887") ("lng" . "11.974560") ("date" . "today"))
 :parser 'json-read
 :success (function*
           (lambda (&key data &allow-other-keys)
             (message "response: %S" data))))
 )

(getJsonSunData)
