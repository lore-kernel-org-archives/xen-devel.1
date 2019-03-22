From: Diego Alejandro Parra Guzman <daparrag@correo.udistrital.edu.co>
Subject: Performance Monitor and Profiling tools for ARM64
Date: Fri, 22 Mar 2019 08:25:28 +0100
Message-ID: <CAMWmVVANRaJX_Cx6OEHuKYR=v7nNfvPpW738_2hbhB+1s7w4LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5912156681001777540=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y287=RZ=correo.udistrital.edu.co=daparrag@srs-us1.protection.inumbo.net>)
 id 1h7EYh-0001iq-52
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 07:25:43 +0000
Received: by mail-lf1-x12b.google.com with SMTP id u68so671460lff.7
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2019 00:25:41 -0700 (PDT)
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

--===============5912156681001777540==
Content-Type: multipart/alternative; boundary="00000000000002b9470584a9c392"

--00000000000002b9470584a9c392
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Everyone



My name is diego. I'm very interesting in extend the XenOprof to ARM64
based architectures, and also integrate some tools for hypervisor and
application profiling and performance evaluation.



I read the documentation for Oprofile a perf which is in the wiki page and
I noticed that XEN doesn't support ARM64 architectures.  For this reason I
have two ideas.



1. Add support for ARM64 architectures to XenOprof  in its current
implementation.



2. I found an interesting library called libpfm4 which also work with
perf_event, and support ARM64 and ARM32 architectures. Well I can tray to
use this library in order to profile DOM0 and DOMU-VP guest.



Personally I prefer the option 2 since the  library currently works in
normal linux OS and I guest could be easy to replicate it on XEN.



Approaches:



(hypercalls) from DOM0-DOMU to xen

(direct pass through from DOM0 to PMU counters), and VPMU in DOMU .





Here my questions?



I would like to know if currently DOM0 and DOMU have support to  perf_event
i.e., they can read directly performance monitoring unit (PMU) counters,
only DOM0 or none of them?

should I implement some traps in XEN hypervisor ?

someone  currently  is  working on this?

Which is the most efficient way to implement it ?

There is a guide line to do this easily?



Cheers.
--=20
Diego Alejandro Parra Guzm=C3=A1n
Estudiante de ingenier=C3=ADa electr=C3=B3nica
Universidad distrital FJC

--00000000000002b9470584a9c392
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0=
cm 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">HI Everyone</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">My name is diego. I&#39;m very interes=
ting in extend the
XenOprof to ARM64 based architectures, and also integrate some tools for
hypervisor and application profiling and performance evaluation.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">I read the documentation for Oprofile =
a perf which is in
the wiki page and I noticed that XEN doesn&#39;t support ARM64 architecture=
s.=C2=A0 For this reason I have two ideas.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">1. Add support for ARM64 architectures=
 to XenOprof=C2=A0 in its current implementation.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">2. I found an interesting library call=
ed libpfm4 which
also work with perf_event, and support ARM64 and ARM32 architectures. Well =
I
can tray to use this library in order to profile DOM0 and DOMU-VP guest.</p=
>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Personally I prefer the option 2 since=
 the=C2=A0 library currently works in normal linux OS
and I guest could be easy to replicate it on XEN.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Approaches:</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">(hypercalls) from DOM0-DOMU to xen</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">(direct pass through from DOM0 to PMU =
counters), and VPMU
in DOMU .</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Here my questions?</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">I would like to know if currently DOM0=
 and DOMU have
support to=C2=A0 perf_event i.e., they can
read directly performance monitoring unit (PMU) counters, only DOM0 or none=
 of
them?</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">should I implement some traps in XEN h=
ypervisor ?</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">someone=C2=A0 currently=C2=A0 is=C2=A0
working on this?</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Which is the most efficient way to imp=
lement it ?</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">There is a guide line to do this easil=
y?</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Cheers.</p></div>-- <br><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Diego Aleja=
ndro Parra Guzm=C3=A1n<br>Estudiante de ingenier=C3=ADa electr=C3=B3nica<br=
>Universidad distrital FJC<br></div></div>

--00000000000002b9470584a9c392--


--===============5912156681001777540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5912156681001777540==--
