(require 'request)
(require 'json)

(defun getJsonSunData()
"This function gets Json data from \"http://api.sunrise-sunset.org/json\". It
is their API that I am using for this little program."
 (request
 "http://api.sunrise-sunset.org/json?lat=57.70887&lng=11.974560&date=today"
 :params '(("lat" . "57.70887") ("lng" . "11.974560") ("date" . "today"))
 :parser 'json-read
 :success (cl-function
           (lambda (&key data &allow-other-keys)
             (message "response: %S" data))))
 )


;(request
; "http://api.sunrise-sunset.org/json?lat=57.70887&lng=11.974560&date=today"
; :parser 'json-read
; :success (cl-function
;           (lambda (&key data &allow-other-keys)
;             (message "response: %S" data))))

(getJsonSunData)

;(defvar jsonData getJsonSunData)
;(jsonData)
;(assoc 'results jsonData())
