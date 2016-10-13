(require 'request)
(require 'json)

(defun getJsonSunData()
"This function gets Json data from \"http://api.sunrise-sunset.org/json\". It
is their API that I am using for this little program."
 (request
 "http://api.sunrise-sunset.org/json"
 :params '(("lat" . "57.70887") ("lng" . "11.974560") ("date" . "today") ("formatted" . "0"))
 :parser 'json-read
 :success (cl-function
           (lambda (&key data &allow-other-keys)
             (setq jsonData data)))) ;Credits to @Jassob.
 )


(defun checkSun()
  "Checks if the current time is during sun-hours or not, in Gothenburg"
  (setq sunrise (date-to-time(cdr (assoc 'sunrise (assoc 'results jsonData)))))
  (setq sunset (date-to-time(cdr (assoc 'sunset (assoc 'results jsonData)))))
  (when (time-less-p sunrise (current-time)) (time-less-p (current-time) sunset)))

(defun sunnyout()
  (getJsonSunData)
  (checkSun))

(defun switch-theme(darktheme lighttheme)
  (if (sunnyout) (progn (disable-theme darktheme) (enable-theme lighttheme)) (progn (disable-theme lighttheme) (enable-theme darktheme))))

