From: Ayush Dosaj <ayushdosaj2313@gmail.com>
Subject: error installing xen tools on ubuntu 18.10 - make -j4
 dist-tools
Date: Thu, 14 Feb 2019 14:17:57 +0530
Message-ID: <CAOCxVi2EznptYn+JgV=RvYzu6GEimcGN_GRO49daQM-92PRdRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7204250474225475261=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V1KD=QV=gmail.com=ayushdosaj2313@srs-us1.protection.inumbo.net>)
 id 1guCgl-0004gD-OY
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 08:48:11 +0000
Received: by mail-ot1-x333.google.com with SMTP id n71so9182169ota.10
 for <xen-devel@lists.xenproject.org>; Thu, 14 Feb 2019 00:48:09 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7204250474225475261==
Content-Type: multipart/alternative; boundary="000000000000b65e8d0581d6b758"

--000000000000b65e8d0581d6b758
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Error Description: https://pastebin.com/rmq6KaPq

Help Needed.
On running command:
make -j4 dist-tools


Error snap from here:
make -C x86_instruction_emulator install
make[6]: Entering directory
'/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruc=
tion_emulator'
[ -L x86-emulate.h ] || ln -sf
/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruct=
ion_emulator/../../../tools/tests/x86_emulator/x86-emulate.h
[ -L x86_emulate ] || ln -sf
/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruct=
ion_emulator/../../../xen/arch/x86/x86_emulate
[ -L asm ] || ln -sf
/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruct=
ion_emulator/../../../xen/include/asm-x86
asm
[ -L x86-emulate.c ] || ln -sf
/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruct=
ion_emulator/../../../tools/tests/x86_emulator/x86-emulate.c
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement
-Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
-fomit-frame-pointer
-D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
.afl-harness.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 -I/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instr=
uction_emulator/../../../tools/include
-D__XEN_TOOLS__ -I.  -c -o afl-harness.o afl-harness.c
[ -L wrappers.c ] || ln -sf
/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruct=
ion_emulator/../../../tools/tests/x86_emulator/wrappers.c
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement
-Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
-fomit-frame-pointer
-D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
.fuzz-emul.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 -I/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instr=
uction_emulator/../../../tools/include
-D__XEN_TOOLS__ -I.  -c -o fuzz-emul.o fuzz-emul.c
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement
-Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
-fomit-frame-pointer
-D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
.x86-emulate.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 -I/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instr=
uction_emulator/../../../tools/include
-D__XEN_TOOLS__ -I.  -c -o x86-emulate.o x86-emulate.c
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement
-Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
-fomit-frame-pointer
-D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
.wrappers.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 -I/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instr=
uction_emulator/../../../tools/include
-D__XEN_TOOLS__ -I.  -c -o wrappers.o wrappers.c
In file included from /usr/include/features.h:424,
                 from
/usr/include/x86_64-linux-gnu/bits/libc-header-start.h:33,
                 from /usr/include/stdio.h:27,
                 from wrappers.c:2:
wrappers.c: In function =E2=80=98emul_memcpy=E2=80=99:
/usr/include/x86_64-linux-gnu/bits/string_fortified.h:31:1: error: inlining
failed in call to always_inline =E2=80=98memcpy=E2=80=99: target specific o=
ption mismatch
 __NTH (memcpy (void *__restrict __dest, const void *__restrict __src,
 ^~~~~
wrappers.c:30:5: note: called from here
     memcpy(dst, src, sz);
     ^~~~~~~~~~~~~~~~~~~~
make[6]: ***
[/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruc=
tion_emulator/../../../tools/Rules.mk:225:
wrappers.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from /usr/include/features.h:424,
                 from /usr/include/assert.h:35,
                 from fuzz-emul.c:1:
fuzz-emul.c: In function =E2=80=98input_read=E2=80=99:
/usr/include/x86_64-linux-gnu/bits/string_fortified.h:31:1: error: inlining
failed in call to always_inline =E2=80=98memcpy=E2=80=99: target specific o=
ption mismatch
 __NTH (memcpy (void *__restrict __dest, const void *__restrict __src,
 ^~~~~
fuzz-emul.c:67:5: note: called from here
     memcpy(dst, &s->corpus->data[s->data_index], size);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/include/features.h:424,
                 from /usr/include/assert.h:35,
                 from fuzz-emul.c:1:
/usr/include/x86_64-linux-gnu/bits/string_fortified.h:31:1: error: inlining
failed in call to always_inline =E2=80=98memcpy=E2=80=99: target specific o=
ption mismatch
 __NTH (memcpy (void *__restrict __dest, const void *__restrict __src,
 ^~~~~
fuzz-emul.c:67:5: note: called from here
     memcpy(dst, &s->corpus->data[s->data_index], size);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[6]: ***
[/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruc=
tion_emulator/../../../tools/Rules.mk:225:
fuzz-emul.o] Error 1
In file included from /usr/include/features.h:424,
                 from /usr/include/assert.h:35,
                 from x86-emulate.h:1,
                 from x86-emulate.c:1:
x86_emulate/x86_emulate.c: In function =E2=80=98protmode_load_seg=E2=80=99:
/usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:1: error: inlining
failed in call to always_inline =E2=80=98memset=E2=80=99: target specific o=
ption mismatch
 __NTH (memset (void *__dest, int __ch, size_t __len))
 ^~~~~
In file included from x86-emulate.c:226:
x86_emulate/x86_emulate.c:1831:13: note: called from here
             memset(sreg, 0, sizeof(*sreg));
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /usr/include/features.h:424,
                 from /usr/include/assert.h:35,
                 from x86-emulate.h:1,
                 from x86-emulate.c:1:
/usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:1: error: inlining
failed in call to always_inline =E2=80=98memset=E2=80=99: target specific o=
ption mismatch
 __NTH (memset (void *__dest, int __ch, size_t __len))
 ^~~~~
In file included from x86-emulate.c:226:
x86_emulate/x86_emulate.c:1831:13: note: called from here
             memset(sreg, 0, sizeof(*sreg));
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[6]: ***
[/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruc=
tion_emulator/../../../tools/Rules.mk:225:
x86-emulate.o] Error 1
make[6]: Leaving directory
'/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruc=
tion_emulator'
make[5]: ***
[/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/../../tools=
/Rules.mk:249:
subdir-install-x86_instruction_emulator] Error 2
make[5]: Leaving directory
'/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz'
make[4]: ***
[/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/../../tools=
/Rules.mk:244:
subdirs-install] Error 2
make[4]: Leaving directory
'/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz'
make[3]: ***
[/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/../tools/Rules.m=
k:249:
subdir-install-fuzz] Error 2
make[3]: Leaving directory
'/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools'
make[2]: ***
[/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/../tools/Rules.m=
k:244:
subdirs-install] Error 2
make[2]: Leaving directory
'/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools'
make[1]: *** [Makefile:74: install] Error 2
make[1]: Leaving directory
'/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools'
make: *** [Makefile:127: install-tools] Error 2
ayush@Dos98:~/Downloads/tklengyel-drakvuf-4328381/xen$


--=20
Ayush Dosaj
VIT Vellore

--000000000000b65e8d0581d6b758
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif;font-size:small">Error=
 Description:=C2=A0<a href=3D"https://pastebin.com/rmq6KaPq">https://pasteb=
in.com/rmq6KaPq</a></div><div class=3D"gmail_default" style=3D"font-family:=
arial,helvetica,sans-serif;font-size:small"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif;font-size:small">He=
lp Needed.</div><div class=3D"gmail_default"><div class=3D"gmail_default"><=
font face=3D"arial, helvetica, sans-serif">On running command:</font></div>=
<div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">ma=
ke -j4 dist-tools</font></div><div class=3D"gmail_default"><font face=3D"ar=
ial, helvetica, sans-serif"><br></font></div><div class=3D"gmail_default"><=
font face=3D"arial, helvetica, sans-serif"><br></font></div><div class=3D"g=
mail_default"><font face=3D"arial, helvetica, sans-serif">Error snap from h=
ere:</font></div><div class=3D"gmail_default"><font face=3D"arial, helvetic=
a, sans-serif">make -C x86_instruction_emulator install</font></div><div cl=
ass=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">make[6]: =
Entering directory &#39;/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen=
/tools/fuzz/x86_instruction_emulator&#39;</font></div><div class=3D"gmail_d=
efault"><font face=3D"arial, helvetica, sans-serif">[ -L x86-emulate.h ] ||=
 ln -sf /home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_=
instruction_emulator/../../../tools/tests/x86_emulator/x86-emulate.h</font>=
</div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-ser=
if">[ -L x86_emulate ] || ln -sf /home/ayush/Downloads/tklengyel-drakvuf-43=
28381/xen/tools/fuzz/x86_instruction_emulator/../../../xen/arch/x86/x86_emu=
late</font></div><div class=3D"gmail_default"><font face=3D"arial, helvetic=
a, sans-serif">[ -L asm ] || ln -sf /home/ayush/Downloads/tklengyel-drakvuf=
-4328381/xen/tools/fuzz/x86_instruction_emulator/../../../xen/include/asm-x=
86 asm</font></div><div class=3D"gmail_default"><font face=3D"arial, helvet=
ica, sans-serif">[ -L x86-emulate.c ] || ln -sf /home/ayush/Downloads/tklen=
gyel-drakvuf-4328381/xen/tools/fuzz/x86_instruction_emulator/../../../tools=
/tests/x86_emulator/x86-emulate.c</font></div><div class=3D"gmail_default">=
<font face=3D"arial, helvetica, sans-serif">gcc=C2=A0 -m64 -DBUILD_ID -fno-=
strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-=
statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs=C2=A0 =C2=
=A0-O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTE=
RFACE_VERSION__ -MMD -MF .afl-harness.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE6=
4_SOURCE=C2=A0 =C2=A0-I/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/=
tools/fuzz/x86_instruction_emulator/../../../tools/include -D__XEN_TOOLS__ =
-I.=C2=A0 -c -o afl-harness.o afl-harness.c=C2=A0</font></div><div class=3D=
"gmail_default"><font face=3D"arial, helvetica, sans-serif">[ -L wrappers.c=
 ] || ln -sf /home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz=
/x86_instruction_emulator/../../../tools/tests/x86_emulator/wrappers.c</fon=
t></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-s=
erif">gcc=C2=A0 -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -Ws=
trict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable=
 -Wno-unused-local-typedefs=C2=A0 =C2=A0-O2 -fomit-frame-pointer -D__XEN_IN=
TERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF .fuzz-emul.o.=
d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE=C2=A0 =C2=A0-I/home/ayush/Downl=
oads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruction_emulator/../.=
./../tools/include -D__XEN_TOOLS__ -I.=C2=A0 -c -o fuzz-emul.o fuzz-emul.c=
=C2=A0</font></div><div class=3D"gmail_default"><font face=3D"arial, helvet=
ica, sans-serif">gcc=C2=A0 -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu9=
9 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-s=
et-variable -Wno-unused-local-typedefs=C2=A0 =C2=A0-O2 -fomit-frame-pointer=
 -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF .x=
86-emulate.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE=C2=A0 =C2=A0-I/hom=
e/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruction_=
emulator/../../../tools/include -D__XEN_TOOLS__ -I.=C2=A0 -c -o x86-emulate=
.o x86-emulate.c=C2=A0</font></div><div class=3D"gmail_default"><font face=
=3D"arial, helvetica, sans-serif">gcc=C2=A0 -m64 -DBUILD_ID -fno-strict-ali=
asing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement =
-Wno-unused-but-set-variable -Wno-unused-local-typedefs=C2=A0 =C2=A0-O2 -fo=
mit-frame-pointer -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERS=
ION__ -MMD -MF .wrappers.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE=C2=
=A0 =C2=A0-I/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/=
x86_instruction_emulator/../../../tools/include -D__XEN_TOOLS__ -I.=C2=A0 -=
c -o wrappers.o wrappers.c=C2=A0</font></div><div class=3D"gmail_default"><=
font face=3D"arial, helvetica, sans-serif">In file included from /usr/inclu=
de/features.h:424,</font></div><div class=3D"gmail_default"><font face=3D"a=
rial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from /usr/include/x86_64-linux-gnu/bits/libc-header-start.=
h:33,</font></div><div class=3D"gmail_default"><font face=3D"arial, helveti=
ca, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from /usr/include/stdio.h:27,</font></div><div class=3D"gmail_default"><=
font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from wrappers.c:2:</font></div><div class=3D=
"gmail_default"><font face=3D"arial, helvetica, sans-serif">wrappers.c: In =
function =E2=80=98emul_memcpy=E2=80=99:</font></div><div class=3D"gmail_def=
ault"><font face=3D"arial, helvetica, sans-serif">/usr/include/x86_64-linux=
-gnu/bits/string_fortified.h:31:1: error: inlining failed in call to always=
_inline =E2=80=98memcpy=E2=80=99: target specific option mismatch</font></d=
iv><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif"=
>=C2=A0__NTH (memcpy (void *__restrict __dest, const void *__restrict __src=
,</font></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, =
sans-serif">=C2=A0^~~~~</font></div><div class=3D"gmail_default"><font face=
=3D"arial, helvetica, sans-serif">wrappers.c:30:5: note: called from here</=
font></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, san=
s-serif">=C2=A0 =C2=A0 =C2=A0memcpy(dst, src, sz);</font></div><div class=
=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~</font></div><div class=3D"gmail_default"><fo=
nt face=3D"arial, helvetica, sans-serif">make[6]: *** [/home/ayush/Download=
s/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruction_emulator/../../.=
./tools/Rules.mk:225: wrappers.o] Error 1</font></div><div class=3D"gmail_d=
efault"><font face=3D"arial, helvetica, sans-serif">make[6]: *** Waiting fo=
r unfinished jobs....</font></div><div class=3D"gmail_default"><font face=
=3D"arial, helvetica, sans-serif">In file included from /usr/include/featur=
es.h:424,</font></div><div class=3D"gmail_default"><font face=3D"arial, hel=
vetica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0from /usr/include/assert.h:35,</font></div><div class=3D"gmail_defau=
lt"><font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from fuzz-emul.c:1:</font></div><div cla=
ss=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">fuzz-emul.=
c: In function =E2=80=98input_read=E2=80=99:</font></div><div class=3D"gmai=
l_default"><font face=3D"arial, helvetica, sans-serif">/usr/include/x86_64-=
linux-gnu/bits/string_fortified.h:31:1: error: inlining failed in call to a=
lways_inline =E2=80=98memcpy=E2=80=99: target specific option mismatch</fon=
t></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-s=
erif">=C2=A0__NTH (memcpy (void *__restrict __dest, const void *__restrict =
__src,</font></div><div class=3D"gmail_default"><font face=3D"arial, helvet=
ica, sans-serif">=C2=A0^~~~~</font></div><div class=3D"gmail_default"><font=
 face=3D"arial, helvetica, sans-serif">fuzz-emul.c:67:5: note: called from =
here</font></div><div class=3D"gmail_default"><font face=3D"arial, helvetic=
a, sans-serif">=C2=A0 =C2=A0 =C2=A0memcpy(dst, &amp;s-&gt;corpus-&gt;data[s=
-&gt;data_index], size);</font></div><div class=3D"gmail_default"><font fac=
e=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</font></div><div class=3D"gmail_default"><fo=
nt face=3D"arial, helvetica, sans-serif">In file included from /usr/include=
/features.h:424,</font></div><div class=3D"gmail_default"><font face=3D"ari=
al, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0from /usr/include/assert.h:35,</font></div><div class=3D"gmai=
l_default"><font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from fuzz-emul.c:1:</font></div><=
div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">/us=
r/include/x86_64-linux-gnu/bits/string_fortified.h:31:1: error: inlining fa=
iled in call to always_inline =E2=80=98memcpy=E2=80=99: target specific opt=
ion mismatch</font></div><div class=3D"gmail_default"><font face=3D"arial, =
helvetica, sans-serif">=C2=A0__NTH (memcpy (void *__restrict __dest, const =
void *__restrict __src,</font></div><div class=3D"gmail_default"><font face=
=3D"arial, helvetica, sans-serif">=C2=A0^~~~~</font></div><div class=3D"gma=
il_default"><font face=3D"arial, helvetica, sans-serif">fuzz-emul.c:67:5: n=
ote: called from here</font></div><div class=3D"gmail_default"><font face=
=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0memcpy(dst, &amp;s-&g=
t;corpus-&gt;data[s-&gt;data_index], size);</font></div><div class=3D"gmail=
_default"><font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0^=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</font></div><div class=3D=
"gmail_default"><font face=3D"arial, helvetica, sans-serif">make[6]: *** [/=
home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instructi=
on_emulator/../../../tools/Rules.mk:225: fuzz-emul.o] Error 1</font></div><=
div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">In =
file included from /usr/include/features.h:424,</font></div><div class=3D"g=
mail_default"><font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /usr/include/assert.h:35,=
</font></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, s=
ans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fr=
om x86-emulate.h:1,</font></div><div class=3D"gmail_default"><font face=3D"=
arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from x86-emulate.c:1:</font></div><div class=3D"gmail_defa=
ult"><font face=3D"arial, helvetica, sans-serif">x86_emulate/x86_emulate.c:=
 In function =E2=80=98protmode_load_seg=E2=80=99:</font></div><div class=3D=
"gmail_default"><font face=3D"arial, helvetica, sans-serif">/usr/include/x8=
6_64-linux-gnu/bits/string_fortified.h:59:1: error: inlining failed in call=
 to always_inline =E2=80=98memset=E2=80=99: target specific option mismatch=
</font></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, s=
ans-serif">=C2=A0__NTH (memset (void *__dest, int __ch, size_t __len))</fon=
t></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-s=
erif">=C2=A0^~~~~</font></div><div class=3D"gmail_default"><font face=3D"ar=
ial, helvetica, sans-serif">In file included from x86-emulate.c:226:</font>=
</div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-ser=
if">x86_emulate/x86_emulate.c:1831:13: note: called from here</font></div><=
div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(sreg, 0, sizeof(*sreg))=
;</font></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, =
sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~</font></div><div class=3D"gmail_default"><font face=3D"aria=
l, helvetica, sans-serif">In file included from /usr/include/features.h:424=
,</font></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, =
sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
rom /usr/include/assert.h:35,</font></div><div class=3D"gmail_default"><fon=
t face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from x86-emulate.h:1,</font></div><div class=3D"=
gmail_default"><font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from x86-emulate.c:1:</font=
></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-se=
rif">/usr/include/x86_64-linux-gnu/bits/string_fortified.h:59:1: error: inl=
ining failed in call to always_inline =E2=80=98memset=E2=80=99: target spec=
ific option mismatch</font></div><div class=3D"gmail_default"><font face=3D=
"arial, helvetica, sans-serif">=C2=A0__NTH (memset (void *__dest, int __ch,=
 size_t __len))</font></div><div class=3D"gmail_default"><font face=3D"aria=
l, helvetica, sans-serif">=C2=A0^~~~~</font></div><div class=3D"gmail_defau=
lt"><font face=3D"arial, helvetica, sans-serif">In file included from x86-e=
mulate.c:226:</font></div><div class=3D"gmail_default"><font face=3D"arial,=
 helvetica, sans-serif">x86_emulate/x86_emulate.c:1831:13: note: called fro=
m here</font></div><div class=3D"gmail_default"><font face=3D"arial, helvet=
ica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(sre=
g, 0, sizeof(*sreg));</font></div><div class=3D"gmail_default"><font face=
=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</font></div><div class=3D"gmail_defau=
lt"><font face=3D"arial, helvetica, sans-serif">make[6]: *** [/home/ayush/D=
ownloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/x86_instruction_emulator/=
../../../tools/Rules.mk:225: x86-emulate.o] Error 1</font></div><div class=
=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">make[6]: Lea=
ving directory &#39;/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/too=
ls/fuzz/x86_instruction_emulator&#39;</font></div><div class=3D"gmail_defau=
lt"><font face=3D"arial, helvetica, sans-serif">make[5]: *** [/home/ayush/D=
ownloads/tklengyel-drakvuf-4328381/xen/tools/fuzz/../../tools/Rules.mk:249:=
 subdir-install-x86_instruction_emulator] Error 2</font></div><div class=3D=
"gmail_default"><font face=3D"arial, helvetica, sans-serif">make[5]: Leavin=
g directory &#39;/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/=
fuzz&#39;</font></div><div class=3D"gmail_default"><font face=3D"arial, hel=
vetica, sans-serif">make[4]: *** [/home/ayush/Downloads/tklengyel-drakvuf-4=
328381/xen/tools/fuzz/../../tools/Rules.mk:244: subdirs-install] Error 2</f=
ont></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans=
-serif">make[4]: Leaving directory &#39;/home/ayush/Downloads/tklengyel-dra=
kvuf-4328381/xen/tools/fuzz&#39;</font></div><div class=3D"gmail_default"><=
font face=3D"arial, helvetica, sans-serif">make[3]: *** [/home/ayush/Downlo=
ads/tklengyel-drakvuf-4328381/xen/tools/../tools/Rules.mk:249: subdir-insta=
ll-fuzz] Error 2</font></div><div class=3D"gmail_default"><font face=3D"ari=
al, helvetica, sans-serif">make[3]: Leaving directory &#39;/home/ayush/Down=
loads/tklengyel-drakvuf-4328381/xen/tools&#39;</font></div><div class=3D"gm=
ail_default"><font face=3D"arial, helvetica, sans-serif">make[2]: *** [/hom=
e/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools/../tools/Rules.mk:244=
: subdirs-install] Error 2</font></div><div class=3D"gmail_default"><font f=
ace=3D"arial, helvetica, sans-serif">make[2]: Leaving directory &#39;/home/=
ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools&#39;</font></div><div c=
lass=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">make[1]:=
 *** [Makefile:74: install] Error 2</font></div><div class=3D"gmail_default=
"><font face=3D"arial, helvetica, sans-serif">make[1]: Leaving directory &#=
39;/home/ayush/Downloads/tklengyel-drakvuf-4328381/xen/tools&#39;</font></d=
iv><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif"=
>make: *** [Makefile:127: install-tools] Error 2</font></div><div class=3D"=
gmail_default"><font face=3D"arial, helvetica, sans-serif">ayush@Dos98:~/Do=
wnloads/tklengyel-drakvuf-4328381/xen$</font></div></div><div class=3D"gmai=
l_default" style=3D"font-family:arial,helvetica,sans-serif;font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetic=
a,sans-serif;font-size:small"><br></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"text-al=
ign:left"><div style=3D"font-family:arial,helvetica,sans-serif">Ayush Dosaj=
</div><div style=3D"font-family:arial,helvetica,sans-serif">VIT Vellore</di=
v><div><br></div></div></div></div></div></div></div></div></div>

--000000000000b65e8d0581d6b758--


--===============7204250474225475261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7204250474225475261==--
