From: Chaitanya Deshpande <chaitanyagd11@gmail.com>
Subject: Query for running Xen on ARM
Date: Sun, 27 May 2018 10:48:35 -0700
Message-ID: <CA+a_UndTaAP0XCssMCqTHVcGT1wnbmZHaohkfx33=tDU6Bq2Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6830862178670334141=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wcbl=io=gmail.com=chaitanyagd11@srs-us1.protection.inumbo.net>)
 id 1fMzmY-0002ga-D1
 for xen-devel@lists.xenproject.org; Sun, 27 May 2018 17:48:38 +0000
Received: by mail-ot0-x22e.google.com with SMTP id 15-v6so11229535otn.12
 for <xen-devel@lists.xenproject.org>; Sun, 27 May 2018 10:48:36 -0700 (PDT)
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

--===============6830862178670334141==
Content-Type: multipart/alternative; boundary="00000000000044137a056d339c37"

--00000000000044137a056d339c37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,



I am Chaitanya, pursuing my master=E2=80=99s degree from Portland State Uni=
versity
in Embedded Systems.



I have started working on Xen Project and I am beginner in this field.



I have followed all the steps which are given in this link =E2=80=93



https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/qem=
u-system-aarch64



https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions#Bui=
lding_Xen_on_ARM


1) I have used buildroot(rootfs.cpio) for building Linux.

2) I have succeeded in booting Linux on Qemu (qemu-system-.aarch64)

3) Used make dist-xen XEN_TARGET_ARCH=3Darm64
CROSS_COMPILE=3Daarch64-linux-gnu-  for cross compiling and getting Xen
binary.

4) My root is root - root=3D/dev/sda1


After running the  last step UEFI Prompt opens and it gives me this error.



error: no such device: root.

Press any key to continue...
EFI stub: Booting Linux Kernel...
EFI stub: Using DTB from configuration table
EFI stub: Exiting boot services and installing virtual address map...
[   11.231789] acpi PNP0A08:00: Bus 0000:00 not present in PCI namespace
[   41.972816] NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s!
[swapper/0:1]
[  229.940369] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s!
[swapper/0:1]
[  257.939966] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s!
[swapper/0:1]
[  290.035395] NMI watchdog: BUG: soft lockup - CPU#3 stuck for 23s!
[swapper/0:1]
[  303.595373] kvm [1]: error: no compatible GIC node found
[  303.619405] kvm [1]: error initializing Hyp mode: -19





I am unable to find the root cause of this issue. Please can anyone help me
with this.



Thanks,

Chaitanya

--00000000000044137a056d339c37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">


















<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Hi,<span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span>=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">I am Chaitanya, pursuing my master=E2=80=99s de=
gree from Portland
State University in Embedded Systems.<span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span>=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">I have started working on Xen Project and I am =
beginner in
this field. <span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span>=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span>I have followed all the steps which are
given in this link =E2=80=93 <span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span><span>=C2=A0</span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span><a href=3D"https://wiki.xenproject.org/wi=
ki/Xen_ARM_with_Virtualization_Extensions/qemu-system-aarch64"><span style=
=3D"color:rgb(5,99,193)">https://wiki.xenproject.org/wiki/Xen_ARM_with_Virt=
ualization_Extensions/qemu-system-aarch64</span></a><span></span></span></p=
>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span><span>=C2=A0</span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span><span style=3D"color:rgb(5,99,193)"><a hr=
ef=3D"https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensio=
ns#Building_Xen_on_ARM">https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtu=
alization_Extensions#Building_Xen_on_ARM</a></span><span></span></span></p>=
<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span><br></span></p><p class=3D"MsoNormal" sty=
le=3D"margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif=
"><span>1) I have used buildroot(rootfs.cpio) for building Linux.</span></p=
><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;fon=
t-family:Calibri,sans-serif">2) I have succeeded in booting Linux on Qemu (=
qemu-system-.aarch64)</p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0=
001pt;font-size:11pt;font-family:Calibri,sans-serif">3) Used make dist-xen =
XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-=C2=A0 for cross =
compiling and getting Xen binary.</p><p class=3D"MsoNormal" style=3D"margin=
:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">4) My root=
 is root - root=3D/dev/sda1</p><p class=3D"MsoNormal" style=3D"margin:0in 0=
in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"><br></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span>After running the =C2=A0last step UEFI
Prompt opens and it gives me this error.<span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span><span>=C2=A0</span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:9.5pt;font-family:Aria=
l,sans-serif;color:rgb(34,34,34);background:white">error: no such device: r=
oot.</span><span style=3D"font-size:9.5pt;font-family:Arial,sans-serif;colo=
r:rgb(34,34,34)"><br>
<br>
<span style=3D"background:white">Press any key to continue...</span><br>
<span style=3D"background:white">EFI stub: Booting Linux Kernel...</span><b=
r>
<span style=3D"background:white">EFI stub: Using DTB from configuration tab=
le</span><br>
<span style=3D"background:white">EFI stub: Exiting boot services and instal=
ling
virtual address map...</span><br>
<span style=3D"background:white">[=C2=A0=C2=A0 11.231789] acpi PNP0A08:00: =
Bus
0000:00 not present in PCI namespace</span><br>
<span style=3D"background:white">[=C2=A0=C2=A0 41.972816] NMI watchdog: BUG=
: soft
lockup - CPU#1 stuck for 23s! [swapper/0:1]</span><br>
<span style=3D"background:white">[=C2=A0 229.940369] NMI watchdog: BUG: sof=
t
lockup - CPU#0 stuck for 23s! [swapper/0:1]</span><br>
<span style=3D"background:white">[=C2=A0 257.939966] NMI watchdog: BUG: sof=
t
lockup - CPU#0 stuck for 23s! [swapper/0:1]</span><br>
<span style=3D"background:white">[=C2=A0 290.035395] NMI watchdog: BUG: sof=
t
lockup - CPU#3 stuck for 23s! [swapper/0:1]</span><br>
<span style=3D"background:white">[=C2=A0 303.595373] kvm [1]: error: no
compatible GIC node found</span><br>
<span style=3D"background:white">[=C2=A0 303.619405] kvm [1]: error initial=
izing
Hyp mode: -19<span></span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:9.5pt;font-family:Aria=
l,sans-serif;color:rgb(34,34,34);background:white"><span>=C2=A0</span></spa=
n></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:9.5pt;font-family:Aria=
l,sans-serif;color:rgb(34,34,34);background:white"><span>=C2=A0</span></spa=
n></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span>I am unable to find the root cause of
this issue. Please can anyone help me
with this.<span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span><span>=C2=A0</span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span>Thanks,<span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span>Chaitanya<span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span>=C2=A0</span></p>





<br></div>

--00000000000044137a056d339c37--


--===============6830862178670334141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6830862178670334141==--
