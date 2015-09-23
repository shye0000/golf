; Example of program for the reading of level1 GOLF data 
; See http://www.ias.u-psud.fr/golf/ for more details on GOLF and the data. 
; 
; Inputs: 
; ; The name of the data file (format 'yymmdd'), 
; ; appearing as 'yourfile.fits' in this program 
; 
; Outputs: 
; ; pm1_m,pm1_p,pm2_m,pm2_p: array of the intensities measured 
; ; by the Photo-Multipliers 1 and 2, for the two values of the 
; ; magnetic modulation, with a sampling time of 10s. Intensities 
; ; are plotted. 
; 
;  Calls:
;  ; fxbopen ; fxbheader All these routines can be found, for ex. in 
;  ; fxbread the Solar Software (available at 
;  ; fxbclose http://sohowww.nascom.nasa.gov/data/software.html) 
; 
pro golffits_read,filename

;filename = 'yourfile' (format 'yymmdd')
ext=3 

;  reading of PM1 counts 

fxbopen,unit,'B:\SISMO\GOLF\TL01\'+filename+'.fits',ext 
header = fxbheader(unit) 
fxbread, unit, data, 1 
fxbclose, unit 
ix = 2*indgen(8640) 
pm1_m = data[ix] 
;Minimum magnetic modulation 
pm1_p = data[ix+1] 
;Maximum magnetic modulation 

ext=4 

; reading of PM2 counts 
; 
 fxbopen,unit,'B:\SISMO\GOLF\TL01\'+filename+'.fits',ext 
 header = fxbheader(unit) 
 fxbread, unit, data, 1 
fxbclose, unit 
ix = 2*indgen(8640)
 
pm2_m = data[ix] 
; ; Minimum magnetic modulation 

pm2_p = data[ix+1] 
; ; Maximum magnetic modulation 
; 
plot,pm1_p,psym=2,yrange=[min(pm1_m)*0.9,max(pm1_p)*1.1]
oplot,pm1_m,psym=-2
oplot,pm2_p,psym=1
oplot,pm2_m,psym=-1
stop
 end 