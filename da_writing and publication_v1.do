**************************************************************************
* Project: 	Publication records and training in scientific writing skills*
* Authors: 	Carlos Culquichicon, Mario Valladares-Garrido,	  			 *
* Data managers: 	Carlos Culquichicon									 *
* Last update:		05/24/19	  										 *
**************************************************************************
version 15.1
local dir "`autocd'"
cd "`autocd'"
use "160714_Base TICs en est de med Latinos.dta",clear

* Cleaning-up
gen socem=grupo_estud
recode socem 2/4=0

gen tesis_dond2=tesis_dond
recode tesis_dond2 (.=3)(0=4)(1=5)(3=0)(4=1)(2=3)(5=2)
label define tesis_dond2 0 ninguna 1 congreso 2 revista 3 ambas
label value tesis_dond2 tesis_dond2

gen tesis_revista=tesis_dond2
recode tesis_revista (1=0)(3=0)(2=1)

*Dx y reemplazo missing en preguntas "salto"

///SCOPUS
*Frecuencia de uso de SCOPUS
*Añadiendo nueva categoría no conoce
recode scopus_frecuencia 4=5 3=4 2=3 1=2 0=1
recode scopus_frecuencia .=0 if scopus_frecuencia==. & scopus_conoce==0 // 9334 miss
tab scopus_frecuencia, nola //466 miss
label define scopus_frecuencia 0 "No conoce" 1 "Nunca la uso" 2 "Al menos 1 vez este año" 3 "Al menos 1 vez al mes" 4 "Al menos 1 vez a la semana" 5 "Todos los dias"
label value scopus_frecuencia scopus_frecuencia

*Capacitación para uso de SCOPUS
tab scopus_capacitacion, miss
*Añadiendo categoría no conoce
recode scopus_capacitacion 1=2 0=1 
tab scopus_capacitacion, nola
recode scopus_capacitacion .=0 if scopus_capacitacion==. & scopus_conoce==0 // 9334 miss
label define scopus_capacitacion 0 "No conoce" 1 "No capacitado" 2 "Si capacitado"
label value scopus_capacitacion scopus_capacitacion 

*Acceso desde tlf de SCOPUS
tab scopus_acceso_tlf, miss
recode scopus_acceso_tlf 1=2 0=1 
recode scopus_acceso_tlf .=0 if scopus_acceso_tlf ==. & scopus_conoce==0 // 9334 miss
label define scopus_acceso_tlf 0 "No conoce" 1 "No accede" 2 "Si accede"
label value scopus_acceso_tlf  scopus_acceso_tlf 
tab scopus_acceso_tlf, miss

///PUBMED
*Frecuencia de uso de PubMed
tab pubmed_frecuencia, miss
recode pubmed_frecuencia 4=5 3=4 2=3 1=2 0=1
recode pubmed_frecuencia .=0 if pubmed_frecuencia ==. & pubmed_conoce==0 // 4529 miss
label define pubmed_frecuencia 0 "No conoce" 1 "Nunca la uso" 2 "Al menos 1 vez este año" 3 "Al menos 1 vez al mes" 4 "Al menos 1 vez a la semana" 5 "Todos los dias"
label value pubmed_frecuencia pubmed_frecuencia

*Capacitación para uso de PubMed
tab pubmed_capacitacion, miss
recode pubmed_capacitacion 1=2 0=1 
recode pubmed_capacitacion .=0 if pubmed_capacitacion==. & pubmed_conoce==0 // 4529 miss
label define pubmed_capacitacion 0 "No conoce" 1 "No capacitado" 2 "Si capacitado", replace
label value pubmed_capacitacion pubmed_capacitacion 

*Acceso desde tlf de PubMed
tab pubmed_acceso_tlf, miss //4872 miss
recode pubmed_acceso_tlf 1=2 0=1 
recode pubmed_acceso_tlf .=0 if pubmed_acceso_tlf ==. & pubmed_conoce==0 // 4529 miss
label define pubmed_acceso_tlf 0 "No conoce" 1 "No accede" 2 "Si accede"
label value pubmed_acceso_tlf  pubmed_acceso_tlf 
tab pubmed_acceso_tlf, miss

//UPTODATE
*Frecuencia de uso de Uptodate
tab uptodate_frecuencia, miss
recode uptodate_frecuencia 4=5 3=4 2=3 1=2 0=1
recode uptodate_frecuencia .=0 if uptodate_frecuencia ==. & uptodate_conoce==0 // 9474 miss
label define uptodate_frecuencia 0 "No conoce" 1 "Nunca la uso" 2 "Al menos 1 vez este año" 3 "Al menos 1 vez al mes" 4 "Al menos 1 vez a la semana" 5 "Todos los dias"
label value uptodate_frecuencia uptodate_frecuencia

*Capacitación para uso de Uptodate
tab uptodate_capacitacion, miss
recode uptodate_capacitacion 1=2 0=1 
recode uptodate_capacitacion .=0 if uptodate_capacitacion==. & uptodate_conoce==0 // 9474 miss
label define uptodate_capacitacion 0 "No conoce" 1 "No capacitado" 2 "Si capacitado", replace
label value uptodate_capacitacion uptodate_capacitacion 

*Acceso desde tlf de Uptodate
tab uptodate_acceso_tlf, miss //9928 miss
recode uptodate_acceso_tlf 1=2 0=1 
recode uptodate_acceso_tlf .=0 if uptodate_acceso_tlf ==. & uptodate_conoce==0 // 9474 miss
label define uptodate_acceso_tlf 0 "No conoce" 1 "No accede" 2 "Si accede"
label value uptodate_acceso_tlf  uptodate_acceso_tlf 
tab uptodate_acceso_tlf, miss

//Cochrane
*Frecuencia de uso de Cochrane
tab cochrane_frecuencia, miss //9246 miss
recode cochrane_frecuencia 4=5 3=4 2=3 1=2 0=1
recode cochrane_frecuencia .=0 if cochrane_frecuencia ==. & cochrane_conoce==0 // 8757 miss
label define cochrane_frecuencia 0 "No conoce" 1 "Nunca la uso" 2 "Al menos 1 vez este año" 3 "Al menos 1 vez al mes" 4 "Al menos 1 vez a la semana" 5 "Todos los dias"
label value cochrane_frecuencia cochrane_frecuencia

*Capacitación para uso de Cochrane
tab cochrane_capacitacion, miss
recode cochrane_capacitacion 1=2 0=1 
recode cochrane_capacitacion .=0 if cochrane_capacitacion==. & cochrane_conoce==0 // 8757 miss
label define cochrane_capacitacion 0 "No conoce" 1 "No capacitado" 2 "Si capacitado", replace
label value cochrane_capacitacion cochrane_capacitacion 

*Acceso desde tlf de Cochrane
tab cochrane_acceso_tlf, miss //9214 miss
recode cochrane_acceso_tlf 1=2 0=1 
recode cochrane_acceso_tlf .=0 if cochrane_acceso_tlf ==. & cochrane_conoce==0 // 8757 miss
label define cochrane_acceso_tlf 0 "No conoce" 1 "No accede" 2 "Si accede"
label value cochrane_acceso_tlf  cochrane_acceso_tlf 
tab cochrane_acceso_tlf, miss

//EMBASE
*Frecuencia de uso de Embase
tab embase_frecuencia, miss
recode embase_frecuencia 4=5 3=4 2=3 1=2 0=1
recode embase_frecuencia .=0 if embase_frecuencia ==. & embase_conoce==0 // 10100 miss
label define embase_frecuencia 0 "No conoce" 1 "Nunca la uso" 2 "Al menos 1 vez este año" 3 "Al menos 1 vez al mes" 4 "Al menos 1 vez a la semana" 5 "Todos los dias"
label value embase_frecuencia embase_frecuencia

*Capacitación para uso de Embase
tab embase_capacitacion, miss
recode embase_capacitacion 1=2 0=1 
recode embase_capacitacion .=0 if embase_capacitacion==. & embase_conoce==0 // 10100 miss
label define embase_capacitacion 0 "No conoce" 1 "No capacitado" 2 "Si capacitado", replace
label value embase_capacitacion embase_capacitacion 

*Acceso desde tlf de Embase
tab embase_acceso_tlf, miss //10851 miss
recode embase_acceso_tlf 1=2 0=1 
recode embase_acceso_tlf .=0 if embase_acceso_tlf ==. & embase_conoce==0 // 10100 miss
label define embase_acceso_tlf 0 "No conoce" 1 "No accede" 2 "Si accede"
label value embase_acceso_tlf  embase_acceso_tlf 
tab embase_acceso_tlf, miss

//SCIELO
*Frecuencia de uso de Scielo
tab scielo_frecuencia, miss //5423 miss
recode scielo_frecuencia 4=5 3=4 2=3 1=2 0=1
recode scielo_frecuencia .=0 if scielo_frecuencia ==. & scielo_conoce==0 // 4918 miss
label define scielo_frecuencia 0 "No conoce" 1 "Nunca la uso" 2 "Al menos 1 vez este año" 3 "Al menos 1 vez al mes" 4 "Al menos 1 vez a la semana" 5 "Todos los dias"
label value scielo_frecuencia scielo_frecuencia

*Capacitación para uso de Scielo
tab scielo_capacitacion, miss
recode scielo_capacitacion 1=2 0=1 
recode scielo_capacitacion .=0 if scielo_capacitacion==. & scielo_conoce==0 // 4918 miss
label define scielo_capacitacion 0 "No conoce" 1 "No capacitado" 2 "Si capacitado", replace
label value scielo_capacitacion scielo_capacitacion 

*Acceso desde tlf de Scielo
tab scielo_acceso_tlf, miss //5345 miss
recode scielo_acceso_tlf 1=2 0=1 
recode scielo_acceso_tlf .=0 if scielo_acceso_tlf ==. & scielo_conoce==0 // 4918 miss
label define scielo_acceso_tlf 0 "No conoce" 1 "No accede" 2 "Si accede"
label value scielo_acceso_tlf  scielo_acceso_tlf 
tab scielo_acceso_tlf, miss

*Publicación PI curricular
tab proy_publico, miss
recode proy_publico 1=2 0=1 
recode proy_publico .=0 if proy_publico ==. & proyecto==0 // 5378 miss
label define proy_publico 0 "No hizo" 1 "No publico" 2 "Si publico"
label value proy_publico proy_publico
tab proy_publico, miss

*Publicación TI curricular
tab ti_publico, miss
recode ti_publico 1=2 0=1 
recode ti_publico .=0 if ti_publico ==. & trab_investig==0 // 5315 miss
label define ti_publico 0 "No hizo" 1 "No publico" 2 "Si publico"
label value ti_publico ti_publico
tab ti_publico, miss

*Publicación Carta curricular
tab carta_publico, miss
recode carta_publico 1=2 0=1 
recode carta_publico .=0 if carta_publico ==. & carta_editor==0 // 10880 miss
label define carta_publico 0 "No hizo" 1 "No publico" 2 "Si publico"
label value carta_publico carta_publico
tab carta_publico, miss

*Publicación CC curricular
tab cc_publico, miss
recode cc_publico 1=2 0=1 
recode cc_publico .=0 if cc_publico ==. & caso_reporte==0 // 7882 miss
label define cc_publico 0 "No hizo" 1 "No publico" 2 "Si publico"
label value cc_publico cc_publico
tab cc_publico, miss

*Número de publicaciones extracurr
recode publicac_n .=0 if publicac_n ==. & publicac_extracur==0 // 10423 miss

* Quien paso claves
recode quien_pasa_claves (0=4)(2=3)
recode quien_pasa_claves (4=2)
recode quien_pasa_claves .=0 if acceso_claves==0
lab def quien_pasa_claves_def 0 "No corresponde" 1"Alumno" 2"Docente" 3"Ambos"
lab val quien_pasa_claves quien_pasa_claves_def

* Etiquetas universidades
lab def univdef 0 "U. Central Ecuador" 1 "U. de Panama" 2 "U. Nacional Itapúa" ///
3 "U. Católica Bolivia Santa Cruz" 4 "U. de Tacna" 5 "U. Autónoma de Guadalajara" ///
6 "UCLA-Venezuela" 7 "UNAH" 8 "U.Nacional de Ica" 9 "UPTC" 10 "UNT" 11 "UDO Bolivar" ///
12 "U. Tecnica de Ambato" 13 "UPAO-Piura" 14 "UCC Medellin" 15 "URP" ///
16 "U.Autonoma de Zacatecas" 17 "UPEU" 18 "UNA-Paraguay" 19 "UDP-Chile" ///
20 "U.Surcolombiana" 21 "UANCV" 22 "UNPRG" 23 "U. Nacional Ucayali" ///
24 "U. Latina de Panama" 25 "U. Nacional Amazonia Peruana" 26 "UNS" 27 "UNIDA" ///
28 "UAJMS" 29 "U.Andina Cusco" 30 "U Cooperativa de Colombia (UCC)" 31 "UCV-Piura" ///
32 "UNMSM" 33 "UCV-Trujillo" 34 "U.Nacional de Cajamarca" 35 "USMP-Chiclayo" ///
36 "U. Tucuman" 37 "UPLA" 38 "U. Pacifico" 39 "UMSA"

lab val univ univdef



* Dataset set-up
xtset univ

* Descriptive
#delimit;
global ss="privada mujer anio carrera_previa socem ingles pubmed_capacitacion 
scopus_capacitacion scielo_capacitacion capacita_redacccion capacita_bases 
capacita_busq_biblio capacita_zotero sci_hub acceso_claves quien_pasa_claves
";
#delimit cr;


tab1 publicac_extracur 
tab1 $ss 

summ edad, d
hist edad, norm
tabstat edad, s( n median min max iqr)

* Bivariate association
foreach i in $ss {
tab `i' publicac_extracur, row chi2 
}

logit publicac_extracur edad

* Nested models
quietly {
poisson publicac_extracur 	privada mujer anio carrera_previa socem ingles ///
				capacita_redacccion capacita_bases capacita_busq_biblio ///
				capacita_zotero acceso_claves ///
				, nolog vce(robust) irr
}
gen nomiss = e(sample)

	* Level 1
eststo m_0: quietly poisson publicac_extracur if nomiss==1,nolog irr

foreach i in privada mujer anio carrera_previa socem ingles ///
				capacita_redacccion capacita_bases capacita_busq_biblio ///
				capacita_zotero acceso_claves {
eststo m_`i': quietly poisson 	publicac_extracur  ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all

/* capacita_redacccion selected */


	* Level 2
eststo m_0: quietly poisson publicac_extracur capacita_redacccion ///
				if nomiss==1,nolog irr

foreach i in privada mujer anio carrera_previa socem ingles ///
				capacita_bases capacita_busq_biblio ///
				capacita_zotero acceso_claves {
eststo m_`i': quietly poisson 	publicac_extracur  capacita_redacccion ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all

/* acceso_claves selected */

	* Level 3
eststo m_0: quietly poisson publicac_extracur capacita_redacccion ///
				acceso_claves if nomiss==1,nolog irr

foreach i in privada mujer anio carrera_previa socem ingles ///
				capacita_bases capacita_busq_biblio ///
				capacita_zotero   {
eststo m_`i': quietly poisson 	publicac_extracur  capacita_redacccion ///
					acceso_claves `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all

/* privada selected */

	* Level 4
eststo m_0: quietly poisson publicac_extracur capacita_redacccion ///
				acceso_claves privada if nomiss==1,nolog irr

foreach i in  mujer anio carrera_previa socem ingles ///
				capacita_bases capacita_busq_biblio ///
				capacita_zotero  {
eststo m_`i': quietly poisson 	publicac_extracur  capacita_redacccion ///
					acceso_claves privada `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all

/* capacita_zotero selected */

	* Level 5
eststo m_0: quietly poisson publicac_extracur capacita_redacccion ///
				acceso_claves privada capacita_zotero if nomiss==1,nolog irr

foreach i in  mujer anio carrera_previa socem ingles ///
				capacita_bases capacita_busq_biblio {
eststo m_`i': quietly poisson 	publicac_extracur  capacita_redacccion ///
					acceso_claves privada capacita_zotero `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all

/* capacita_bases selected */

	* Level 6
eststo m_0: quietly poisson publicac_extracur capacita_redacccion ///
				acceso_claves privada capacita_zotero capacita_bases ///
				if nomiss==1,nolog irr

foreach i in  mujer anio carrera_previa socem ingles ///
				capacita_busq_biblio {
eststo m_`i': quietly poisson 	publicac_extracur  capacita_redacccion ///
					acceso_claves privada capacita_zotero capacita_bases ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all

/* anio selected */

	* Level 7
eststo m_0: quietly poisson publicac_extracur capacita_redacccion ///
				acceso_claves privada capacita_zotero capacita_bases anio ///
				if nomiss==1,nolog irr

foreach i in  mujer carrera_previa socem ingles ///
				capacita_busq_biblio {
eststo m_`i': quietly poisson 	publicac_extracur  capacita_redacccion ///
					acceso_claves privada capacita_zotero capacita_bases anio ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all

/* carrera_previa selected */

	* Level 8
eststo m_0: quietly poisson publicac_extracur capacita_redacccion ///
				acceso_claves privada capacita_zotero capacita_bases anio ///
				carrera_previa if nomiss==1,nolog irr

foreach i in  mujer socem ingles ///
				capacita_busq_biblio {
eststo m_`i': quietly poisson 	publicac_extracur  capacita_redacccion ///
					acceso_claves privada capacita_zotero capacita_bases anio ///
					carrera_previa `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all

/* ingles selected */

	* Level 9
eststo m_0: quietly poisson publicac_extracur capacita_redacccion ///
				acceso_claves privada capacita_zotero capacita_bases anio ///
				carrera_previa ingles if nomiss==1,nolog irr

foreach i in  mujer socem ///
				capacita_busq_biblio {
eststo m_`i': quietly poisson 	publicac_extracur  capacita_redacccion ///
					acceso_claves privada capacita_zotero capacita_bases anio ///
					carrera_previa ingles `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all
/* socem selected */

* Level 10
eststo m_0: quietly poisson publicac_extracur capacita_redacccion ///
				acceso_claves privada capacita_zotero capacita_bases anio ///
				carrera_previa ingles socem if nomiss==1,nolog irr

foreach i in  mujer ///
				capacita_busq_biblio {
eststo m_`i': quietly poisson 	publicac_extracur  capacita_redacccion ///
					acceso_claves privada capacita_zotero capacita_bases anio ///
					carrera_previa ingles socem `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

eststo clear
matrix drop _all
scalar drop _all
/* no variable selected */


* Crude regressions
foreach i in $ss {
meglm publicac_extracur i.`i' if nomiss==1, fam(poisson) link(log) eform vce(robust)
}

meglm publicac_extracur ib1.privada, fam(poisson) link(log) eform vce(robust)


* Multivariate regression
#delimit;
global ssfull="capacita_redacccion acceso_claves privada capacita_zotero 
capacita_bases anio carrera_previa ingles socem
";
#delimit cr;

meglm publicac_extracur 	i.capacita_redacccion i.acceso_claves ib1.privada ///
							i.capacita_zotero i.capacita_bases i.anio i.carrera_previa ///
							i.ingles i.socem if nomiss==1, fam(poisson) link(log) eform vce(robust)

							
foreach i in mujer pubmed_capacitacion scopus_capacitacion /// 
				scielo_capacitacion sci_hub quien_pasa_claves {
meglm publicac_extracur 	i.capacita_redacccion i.acceso_claves ib1.privada ///
							i.capacita_zotero i.capacita_bases i.anio i.carrera_previa ///
							i.ingles i.socem i.`i' if nomiss==1, fam(poisson) link(log) eform vce(robust)
}

exit
