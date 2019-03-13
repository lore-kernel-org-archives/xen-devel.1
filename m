From: Tomasz Tuzel <tomasztuzel@gmail.com>
Subject: UEFI Boot Order Not Respected
Date: Wed, 13 Mar 2019 15:31:08 -0600
Message-ID: <CAP-u0V8dn4UzAjZQXPnKDPA0yDAUg7=LBRUC=Ou9JXwdXfezuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7572589177436114578=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eFo=RQ=gmail.com=tomasztuzel@srs-us1.protection.inumbo.net>)
 id 1h4BT7-0002Kz-KH
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 21:31:21 +0000
Received: by mail-io1-xd32.google.com with SMTP id x4so3103680ion.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2019 14:31:20 -0700 (PDT)
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

--===============7572589177436114578==
Content-Type: multipart/alternative; boundary="000000000000c3470905840086ee"

--000000000000c3470905840086ee
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

We've been running into an issue with boot ordering when using OVMF
(specifically, with PXE booting). In particular, the issue is the "-boot
order=ABC" seems to have variable behavior depending on what it receives.
This is only an issue with UEFI; legacy handles this condition correctly.
Here's a table documenting several combinations in the HVM guest
configuration: OS installed || ISO attached || Boot order || Result
---------------------------------------------------- N || N || n || PXE
boot ---------------------------------------------------- N || Y || n ||
Prompt for CD boot, if not pressed drop to PXE boot
---------------------------------------------------- Y || N || n || Boot
from hard drive ---------------------------------------------------- Y || Y
|| n || Prompt for CD boot, if not pressed drop to hard drive
---------------------------------------------------- N || Y || cd || Prompt
for CD boot, if not pressed drop to PXE boot
---------------------------------------------------- N || N || cd || PXE
boot ---------------------------------------------------- Y || N || cd ||
Boot from hardrive ---------------------------------------------------- Y
|| Y || cd || Prompt for CD boot, if not pressed drop to hard drive
---------------------------------------------------- N || N || cn || PXE
boot ---------------------------------------------------- N || Y || cn ||
Prompt for CD boot, if not pressed drop to PXE boot
---------------------------------------------------- Y || N || cn || Boot
from hard drive ---------------------------------------------------- Y || Y
|| cn || Prompt for CD boot, if not pressed drop to hard drive
---------------------------------------------------- N || N || nd || PXE
boot ---------------------------------------------------- N || Y || nd ||
Prompt for CD boot, if not pressed drop to PXE boot
---------------------------------------------------- Y || N || nd || Boot
from hardrive ---------------------------------------------------- Y || Y
|| nd || Prompt for CD boot, if not pressed drop to hard drive
---------------------------------------------------- My running suspicion
is that the fw_cfg file is being incorrectly configured. However, I do not
see what is typically cited as a problem in the QEMU invocation that is
being tested on our end, namely the conflicting usage of "-boot order=ABC"
and "-device XYZ,bootindex=N". I don't really see any chatter about this on
any of the mailing lists that I've dug through, but it was just last week
that a fix was posted for the issue in which the hvmloader firmware leaves
address decoding enabled for enumerated PCI devices. Thus, I'm wondering if
this has simply not shown up on anyone's radar yet. Is this is a known
issue?

Tomasz

--000000000000c3470905840086ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>We&#39;ve been running int=
o an issue with boot ordering when using OVMF (specifically, with PXE booti=
ng). In particular, the issue is the &quot;-boot order=3DABC&quot; seems to=
 have variable behavior depending on what it receives. This is only an issu=
e with UEFI; legacy handles this condition correctly. Here&#39;s a table do=
cumenting several combinations in the HVM guest configuration:<span style=
=3D"color:rgb(51,51,51);font-family:Menlo,Monaco,Consolas,&quot;Courier New=
&quot;,monospace;font-size:13px;white-space:pre-wrap;background-color:rgb(2=
48,248,248)">

OS installed || ISO attached || Boot order || Result
----------------------------------------------------
N            || N            || n          || PXE boot
----------------------------------------------------
N            || Y            || n          || Prompt for CD boot, if not pr=
essed drop to PXE boot
----------------------------------------------------
Y            || N            || n          || Boot from hard drive
----------------------------------------------------
Y            || Y            || n          || Prompt for CD boot, if not pr=
essed drop to hard drive
----------------------------------------------------
N            || Y            || cd         || Prompt for CD boot, if not pr=
essed drop to PXE boot
----------------------------------------------------
N            || N            || cd         || PXE boot
----------------------------------------------------
Y            || N            || cd         || Boot from hardrive
----------------------------------------------------
Y            || Y            || cd         || Prompt for CD boot, if not pr=
essed drop to hard drive
----------------------------------------------------
N            || N            || cn         || PXE boot
----------------------------------------------------
N            || Y            || cn         || Prompt for CD boot, if not pr=
essed drop to PXE boot
----------------------------------------------------
Y            || N            || cn         || Boot from hard drive
----------------------------------------------------
Y            || Y            || cn         || Prompt for CD boot, if not pr=
essed drop to hard drive
----------------------------------------------------
N            || N            || nd         || PXE boot
----------------------------------------------------
N            || Y            || nd         || Prompt for CD boot, if not pr=
essed drop to PXE boot
----------------------------------------------------
Y            || N            || nd         || Boot from hardrive
----------------------------------------------------
Y            || Y            || nd         || Prompt for CD boot, if not pr=
essed drop to hard drive
----------------------------------------------------

</span>My running suspicion is that the fw_cfg file is being incorrectly co=
nfigured. However, I do not see what is typically cited as a problem in the=
 QEMU invocation that is being tested on our end, namely the conflicting us=
age of &quot;-boot order=3DABC&quot; and &quot;-device XYZ,bootindex=3DN&qu=
ot;. I don&#39;t really see any chatter about this on any of the mailing li=
sts that I&#39;ve dug through, but it was just last week that a fix was pos=
ted for the issue in which the hvmloader firmware leaves address decoding e=
nabled for enumerated PCI devices. Thus, I&#39;m wondering if this has simp=
ly not shown up on anyone&#39;s radar yet. Is this is a known issue?</div><=
div><br></div><div>Tomasz<br></div></div>

--000000000000c3470905840086ee--


--===============7572589177436114578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7572589177436114578==--
