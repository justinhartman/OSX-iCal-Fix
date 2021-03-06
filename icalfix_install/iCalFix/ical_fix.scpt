FasdUAS 1.101.10   ��   ��    k             l      ��  ��   >8
#    Apple iCal / Microsoft Exchange server Timezone Fix
#    Copyright (C) 2008 Justin Hartman <http://justinhartman.com/>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#	 Version: 1.2
#	 Release Date: 28 August 2008
     � 	 	p 
 #         A p p l e   i C a l   /   M i c r o s o f t   E x c h a n g e   s e r v e r   T i m e z o n e   F i x 
 #         C o p y r i g h t   ( C )   2 0 0 8   J u s t i n   H a r t m a n   < h t t p : / / j u s t i n h a r t m a n . c o m / > 
 # 
 #         T h i s   p r o g r a m   i s   f r e e   s o f t w a r e :   y o u   c a n   r e d i s t r i b u t e   i t   a n d / o r   m o d i f y 
 #         i t   u n d e r   t h e   t e r m s   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e   a s   p u b l i s h e d   b y 
 #         t h e   F r e e   S o f t w a r e   F o u n d a t i o n ,   e i t h e r   v e r s i o n   3   o f   t h e   L i c e n s e ,   o r 
 #         a n y   l a t e r   v e r s i o n . 
 # 
 #         T h i s   p r o g r a m   i s   d i s t r i b u t e d   i n   t h e   h o p e   t h a t   i t   w i l l   b e   u s e f u l , 
 #         b u t   W I T H O U T   A N Y   W A R R A N T Y ;   w i t h o u t   e v e n   t h e   i m p l i e d   w a r r a n t y   o f 
 #         M E R C H A N T A B I L I T Y   o r   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E .     S e e   t h e 
 #         G N U   G e n e r a l   P u b l i c   L i c e n s e   f o r   m o r e   d e t a i l s . 
 # 
 #         Y o u   s h o u l d   h a v e   r e c e i v e d   a   c o p y   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e 
 #         a l o n g   w i t h   t h i s   p r o g r a m .     I f   n o t ,   s e e   < h t t p : / / w w w . g n u . o r g / l i c e n s e s / > . 
 # 
 # 	   V e r s i o n :   1 . 2 
 # 	   R e l e a s e   D a t e :   2 8   A u g u s t   2 0 0 8 
   
  
 w          k             l     ��������  ��  ��     ��  i         I     �� ��
�� .emalcpmanull���   @ mssg  o      ���� 0 themessages theMessages��    O     �    X    � ��   k    �       r        l    ����  n         1    ��
�� 
raso   o    ���� 0 
themessage 
theMessage��  ��    o      ���� 0 	thesource 	theSource   ! " ! l    �� # $��   # � � Find the range of the message source that is an ics message 
				   Note: this works both on messages that detect the .ics attachement,
						and on crappy Exchange invites that show up as an owa url.     $ � % %�   F i n d   t h e   r a n g e   o f   t h e   m e s s a g e   s o u r c e   t h a t   i s   a n   i c s   m e s s a g e   
 	 	 	 	       N o t e :   t h i s   w o r k s   b o t h   o n   m e s s a g e s   t h a t   d e t e c t   t h e   . i c s   a t t a c h e m e n t , 
 	 	 	 	 	 	 a n d   o n   c r a p p y   E x c h a n g e   i n v i t e s   t h a t   s h o w   u p   a s   a n   o w a   u r l .   "  & ' & r    % ( ) ( l   # *���� * I   #���� +
�� .sysooffslong    ��� null��   + �� , -
�� 
psof , m     . . � / /  B E G I N : V C A L E N D A R - �� 0��
�� 
psin 0 o    ���� 0 	thesource 	theSource��  ��  ��   ) o      ���� 0 	vcalbegin 	vcalBegin '  1 2 1 r   & 5 3 4 3 [   & 3 5 6 5 l  & / 7���� 7 l  & / 8���� 8 I  & /���� 9
�� .sysooffslong    ��� null��   9 �� : ;
�� 
psof : m   ( ) < < � = =  E N D : V C A L E N D A R ; �� >��
�� 
psin > o   * +���� 0 	thesource 	theSource��  ��  ��  ��  ��   6 l  / 2 ?���� ? l  / 2 @���� @ n   / 2 A B A 1   0 2��
�� 
leng B m   / 0 C C � D D  E N D : V C A L E N D A R��  ��  ��  ��   4 o      ���� 0 vcalend vcalEnd 2  E F E l   6 6�� G H��   G   Get the ics data     H � I I $   G e t   t h e   i c s   d a t a   F  J K J r   6 C L M L l  6 A N���� N n   6 A O P O 7  7 A�� Q R
�� 
ctxt Q o   ; =���� 0 	vcalbegin 	vcalBegin R o   > @���� 0 vcalend vcalEnd P o   6 7���� 0 	thesource 	theSource��  ��   M o      ���� 0 	theinvite 	theInvite K  S T S l   D D�� U V��   U   Only deal with requests     V � W W 2   O n l y   d e a l   w i t h   r e q u e s t s   T  X Y X Z   D � Z [�� \ Z =  D O ] ^ ] l  D M _���� _ l  D M `���� ` I  D M���� a
�� .sysooffslong    ��� null��   a �� b c
�� 
psof b m   F G d d � e e  M E T H O D : R E Q U E S T c �� f��
�� 
psin f o   H I���� 0 	theinvite 	theInvite��  ��  ��  ��  ��   ^ m   M N����   [ l   R R�� g h��   g   do nothing     h � i i    d o   n o t h i n g  ��   \ k   V � j j  k l k l   V V�� m n��   m � ~ path to which to save the tmp file.  This may need to be changed,  AppleScript's handling of paths leaves much to be desired     n � o o �   p a t h   t o   w h i c h   t o   s a v e   t h e   t m p   f i l e .     T h i s   m a y   n e e d   t o   b e   c h a n g e d ,     A p p l e S c r i p t ' s   h a n d l i n g   o f   p a t h s   l e a v e s   m u c h   t o   b e   d e s i r e d   l  p q p r   V ] r s r c   V [ t u t m   V W v v � w w ( / t m p / t e m p _ i n v i t e . i c s u m   W Z��
�� 
psxf s o      ���� 0 thepath thePath q  x y x l  ^ ^��������  ��  ��   y  z { z l   ^ ^�� | }��   |   write to a temp file     } � ~ ~ ,   w r i t e   t o   a   t e m p   f i l e   {   �  r   ^ i � � � I  ^ g�� � �
�� .rdwropenshor       file � o   ^ _���� 0 thepath thePath � �� ���
�� 
perm � m   b c��
�� boovtrue��   � o      ���� 0 
thetmpfile 
theTmpfile �  � � � I  j s�� � �
�� .rdwrseofnull���     **** � o   j k���� 0 
thetmpfile 
theTmpfile � �� ���
�� 
set2 � m   n o����  ��   �  � � � r   t y � � � c   t w � � � o   t u���� 0 	theinvite 	theInvite � m   u v��
�� 
ctxt � o      ���� 0 thedummy theDummy �  � � � l  z z��������  ��  ��   �  � � � I  z ��� � �
�� .rdwrwritnull���     **** � b   z  � � � o   z {���� 0 thedummy theDummy � o   { ~��
�� 
ret  � �� ���
�� 
refn � o   � ����� 0 
thetmpfile 
theTmpfile��   �  � � � I  � ��� ���
�� .rdwrclosnull���     **** � o   � ����� 0 
thetmpfile 
theTmpfile��   �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � � � t / A p p l i c a t i o n s / i C a l F i x / f i x _ t i m e z o n e . s h   / t m p / t e m p _ i n v i t e . i c s��   �  � � � l   � ��� � ���   �   open in iCal     � � � �    o p e n   i n   i C a l   �  � � � O  � � � � � I  � ��� ���
�� .aevtodocnull  �    alis � l  � � ����� � o   � ����� 0 thepath thePath��  ��  ��   � m   � � � ��                                                                                  wrbt   alis    D  Macintosh HD               ���H+     iCal.app                                                         w���h        ����  	                Applications    ���      ���H         "Macintosh HD:Applications:iCal.app    i C a l . a p p    M a c i n t o s h   H D  Applications/iCal.app   / ��   �  � � � l   � ��� � ���   �   delete the file     � � � � "   d e l e t e   t h e   f i l e   �  ��� � O  � � � � � I  � ��� ���
�� .coredeloobj        obj  � l  � � ����� � o   � ����� 0 thepath thePath��  ��  ��   � m   � � � ��                                                                                  MACS   alis    r  Macintosh HD               ���H+    �
Finder.app                                                       ES��        ����  	                CoreServices    ���      ���      �  f  e  3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��   Y  ��� � l  � ���������  ��  ��  ��  �� 0 
themessage 
theMessage  o    ���� 0 themessages theMessages  m      � ��                                                                                  emal   alis    D  Macintosh HD               ���H+     Mail.app                                                         �ھMF�        ����  	                Applications    ���      �M*`         "Macintosh HD:Applications:Mail.app    M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  ��   �                                                                                  emal   alis    D  Macintosh HD               ���H+     Mail.app                                                         �ھMF�        ����  	                Applications    ���      �M*`         "Macintosh HD:Applications:Mail.app    M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��     ��� � l     ��������  ��  ��  ��       �� � ���   � ��
�� .emalcpmanull���   @ mssg � �� ���� � ���
�� .emalcpmanull���   @ mssg�� 0 themessages theMessages��   � 	������~�}�|�{�z�y�� 0 themessages theMessages�� 0 
themessage 
theMessage� 0 	thesource 	theSource�~ 0 	vcalbegin 	vcalBegin�} 0 vcalend vcalEnd�| 0 	theinvite 	theInvite�{ 0 thepath thePath�z 0 
thetmpfile 
theTmpfile�y 0 thedummy theDummy �  ��x�w�v�u�t .�s�r�q < C�p�o d v�n�m�l�k�j�i�h�g�f ��e ��d ��c
�x 
kocl
�w 
cobj
�v .corecnte****       ****
�u 
raso
�t 
psof
�s 
psin�r 
�q .sysooffslong    ��� null
�p 
leng
�o 
ctxt
�n 
psxf
�m 
perm
�l .rdwropenshor       file
�k 
set2
�j .rdwrseofnull���     ****
�i 
ret 
�h 
refn
�g .rdwrwritnull���     ****
�f .rdwrclosnull���     ****
�e .sysoexecTEXT���     TEXT
�d .aevtodocnull  �    alis
�c .coredeloobj        obj �� �� � ��[��l kh ��,E�O*���� 	E�O*���� 	��,E�O�[�\[Z�\Z�2E�O*���� 	j  hY [�a &E�O�a el E�O�a jl O��&E�O�_ %a �l O�j Oa j Oa  �j UOa  �j UOP[OY�]Uascr  ��ޭ