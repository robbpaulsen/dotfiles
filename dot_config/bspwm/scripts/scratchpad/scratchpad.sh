#!/usr/bin/env bash
#########################################################################################
#########################################################################################
## Author:   Robbpaulsen
## GitHub:   github.com/robbpaulsem
##
## set -x -e
#########################################################################################
## Author:	Robbpaulsen
## Website:	https://github.com/robbpaulsen
## Email:	ozymandias.1987@protonmail.com
#########################################################################################
## Descripcion:
##
## Script for a more unattended, headless setup and configurationg for the basic things
## on any new linux installation.
##
#########################################################################################
#########################################################################################

#                                                                                                 ;
#                                                                                                 ED.
#           .      .,                                         .,                                  E#Wi
#          ;W     ,Wt j.                                     ,Wt .    .      t                    E###G.
#         f#E    i#D. EW,                   .. GEEEEEEEL    i#D. Di   Dt     ED.               .. E#fD#W;
#       .E#f    f#f   E##j                 ;W, ,;;L#K;;.   f#f   E#i  E#i    E#K:             ;W, E#t t##L
#      iWW;   .D#i    E###D.              j##,    t#E    .D#i    E#t  E#t    E##W;           j##, E#t  .E#K,
#     L##Lffi:KW,     E#jG#W;            G###,    t#E   :KW,     E#t  E#t    E#E##t         G###, E#t    j##f
#    tLLG##L t#f      E#t t##f         :E####,    t#E   t#f      E########f. E#ti##f      :E####, E#t    :E#K:
#      ,W#i   ;#G     E#t  :K#E:      ;W#DG##,    t#E    ;#G     E#j..K#j... E#t ;##D.   ;W#DG##, E#t   t##L
#     j#E.     :KE.   E#KDDDD###i    j###DW##,    t#E     :KE.   E#t  E#t    E#ELLE##K: j###DW##, E#t .D#W;
#   .D#j        .DW:  E#f,t#Wi,,,   G##i,,G##,    t#E      .DW:  E#t  E#t    E#L;;;;;;,G##i,,G##, E#tiW#G.
#  ,WK,           L#, E#t  ;#W:   :K#K:   L##,    t#E        L#, f#t  f#t    E#t     :K#K:   L##, E#K##i
#  EG.             jt DWi   ,KK: ;##D.    L##,     fE         jt  ii   ii    E#t    ;##D.    L##, E##D.
#  ,                             ,,,      .,,       :                               ,,,      .,,  E#t
#                                                                                                 L:

NORMAL='\033[0m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'
UNDERLINE='\033[04m'

trap ctrl_c INT

function ctrl_c() {
	exit_script
}

# Variable para identificar el con nombre la clase de la ventana
winclass=$(xdotool search --class scpad)

# If statement, que see le indica a `xdotool` que si esta ventana existe
# que ejecute una terminal kitty a la cual se le asiganra el mismo nombre
# que tiene la Variable
if [ -z "$winclass" ]; then
	kitty --class scpad
else
	# Despues se pasa a comprobar si el archivo "scpad" no existe en la ruta
	# "/tmp/scap" se le indica que debe de crearlo primero con `touch /tmp/scpad`
	# y que debe de esconder o "minimizar" la ventana
	if [ ! -f /tmp/scpad ]; then
		touch /tmp/scpad && xdo hide "$winclass"
		# Pero si este archivo ya existe en la ruta `/tmp/scpad` debera de eliminarlo
		# y ejecutar `xdo` para que muestre la clase de la ventana o ejecute la accion
		# declarada en la variable superior
	elif [ -f /tmp/scpad ]; then
		rm /tmp/scpad && xdo show "$winclass"
	fi
fi
