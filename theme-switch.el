(require 'request)
(require 'json)

(defun getJsonSunData()
"This function gets Json data from \"http://api.sunrise-sunset.org/json\". It
is their API that I am using for this little program."
 (request
 "http://api.sunrise-sunset.org/json"
 :params '(("lat" . "57.70887") ("lng" . "11.974560") ("date" . "today"))
 :parser 'json-read
 :success (cl-function
           (lambda (&key data &allow-other-keys)
             (setq jsonData data)))) ;Credits to @Jassob.
 )

(getJsonSunData)
(setq jsonData (getJsonSunData))
(setq sunrise (cdr (assoc 'sunrise (assoc 'results jsonData))))
(setq sunset (cdr (assoc 'sunset (assoc 'results jsonData))))
