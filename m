From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: Xen Virtio Drivers
Date: Wed, 7 Mar 2018 18:47:11 -0800
Message-ID: <CACMJ4GYj+UNVwMzY7YbdkABr045+aHmTv44+VgOdUPnorU-f5w@mail.gmail.com>
References: <CAFU1X6ww54Ohq4L837sQzNz=Q9w=RBx3Ma4R6rjin=8YRgTdDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1905296030225024182=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=b2/e=f6=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1etlaN-0007mW-6t
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 02:47:15 +0000
Received: by mail-qk0-x233.google.com with SMTP id z197so5223604qkb.6
 for <xen-devel@lists.xenproject.org>; Wed, 07 Mar 2018 18:47:12 -0800 (PST)
In-Reply-To: <CAFU1X6ww54Ohq4L837sQzNz=Q9w=RBx3Ma4R6rjin=8YRgTdDQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Volo M." <vm@vovs.net>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============1905296030225024182==
Content-Type: multipart/alternative; boundary="94eb2c06ad284cf4610566ddb1dd"

--94eb2c06ad284cf4610566ddb1dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 7, 2018 at 6:13 AM, Volo M. <vm@vovs.net> wrote:

> Hi Devs,
>
> Could you please help me to identify right way to start using Virtio
> drivers for Xen guests
>



















*HiThis reply might not be the answer that you=E2=80=99re looking for, but =
it may
be helpful for the next person arriving via searching with a similar Virtio
driver query.If you can, using the native Xen device drivers in your
Windows VM is preferable to using Virtio, and there=E2=80=99s a driver set
available at: https://www.xenproject.org/downloads/windows-pv-drivers.html
<https://www.xenproject.org/downloads/windows-pv-drivers.html>and more info
at: https://www.xenproject.org/developers/teams/windows-pv-drivers.html
<https://www.xenproject.org/developers/teams/windows-pv-drivers.html>Altern=
atively,
Citrix=E2=80=99s XenServer also has a set of Xen PV drivers for Windows
VMs.Virtio's design requires that the domain where the Virtio device is
emulated (where QEMU is running) has full privileges over the VM using the
Virtio driver -- ie. is able to map any memory inside that VM. This
requirement is contrary to the security model of a type-1 hypervisor such
as Xen, and is not necessary: Xen's native device drivers are performant
and don't need it, and they are compatible with deprivileged Driver
Domains.Driver domains are important for many Xen deployments -- for
example, OpenXT and Qubes OS use network driver
domains:https://wiki.xenproject.org/wiki/Driver_Domain
<https://wiki.xenproject.org/wiki/Driver_Domain>https://www.slideshare.net/=
xen_com_mgr/the-openxt-project-in-2016-christopher-clark-bae-systems/15
<https://www.slideshare.net/xen_com_mgr/the-openxt-project-in-2016-christop=
her-clark-bae-systems/15>https://www.qubes-os.org/doc/networking/
<https://www.qubes-os.org/doc/networking/>In addition to security
architecture, there is a question of performance:the Virtio protocols are
optimized for -- and can work well with -- hosted Type-2 hypervisors, but
being implemented in QEMU they tend to become a performance bottleneck in
Xen deployments where Dom0 is usually only one of many domains, and
possibly not the largest.Significant development effort on Xen has gone
into isolating and deprivileging the QEMU device emulator (stubdomains,
dm_ops, dropping privileges, non-root QEMU, SELinux and XSM policy, ...) to
reduce attack surface.Running VMs without QEMU at all whenever possible is
a valued capability.Finally, although Virtio is often presented as a
paravirtualized solution, it requires an emulation infrastructure that is
not otherwise necessary - and so it is not compatible with PV and PVH
guests on x86, or at all on ARM, because of this requirement.A reference to
a related earlier discussion thread:https://lists.gt.net/xen/devel/318380
<https://lists.gt.net/xen/devel/318380>Christopher*

--94eb2c06ad284cf4610566ddb1dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Mar 7, 2018 at 6:13 AM, Volo M. <span dir=3D"ltr">&lt;<a href=
=3D"mailto:vm@vovs.net" target=3D"_blank">vm@vovs.net</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Devs,<div><br></div>=
<div>Could you please help me to identify right way to start using Virtio d=
rivers for Xen guests</div></div></blockquote><div><br></div><div><b style=
=3D"font-weight:normal" id=3D"gmail-docs-internal-guid-15f55720-037c-2026-2=
b25-7c5840fa9357"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Arial;color:rgb=
(0,0,0);background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e-wrap">Hi</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre-wrap">This reply might not be the answer that you=E2=80=99re looki=
ng for, but it may be helpful for the next person arriving via searching wi=
th a similar Virtio driver query.</span></p><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">If you can, using the native Xen device d=
rivers in your Windows VM is preferable to using Virtio, and there=E2=80=99=
s a driver set available at: <a href=3D"https://www.xenproject.org/download=
s/windows-pv-drivers.html">https://www.xenproject.org/downloads/windows-pv-=
drivers.html</a></span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre-wrap">and more info at: <a href=3D"https://www.xenproject.org/de=
velopers/teams/windows-pv-drivers.html">https://www.xenproject.org/develope=
rs/teams/windows-pv-drivers.html</a></span></p><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10p=
t;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre-wrap">Alternatively, Citrix=E2=80=99s XenSer=
ver also has a set of Xen PV drivers for Windows VMs.</span></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre-wrap">Virtio&#39;s des=
ign requires that the domain where the Virtio device is emulated (where QEM=
U is running) has full privileges over the VM using the Virtio driver -- ie=
. is able to map any memory inside that VM. This requirement is contrary to=
 the security model of a type-1 hypervisor such as Xen, and is not necessar=
y: Xen&#39;s native device drivers are performant and don&#39;t need it, an=
d they are compatible with deprivileged Driver Domains.</span><span style=
=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap"><br class=3D"gmail-ki=
x-line-break"></span><span style=3D"font-size:10pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre-wrap"><br class=3D"gmail-kix-line-break"></span><span style=3D"font-si=
ze:10pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fon=
t-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ver=
tical-align:baseline;white-space:pre-wrap">Driver domains are important for=
 many Xen deployments -- for example, OpenXT and Qubes OS use network drive=
r domains:</span><span style=3D"font-size:10pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><br class=3D"gmail-kix-line-break"></span><span style=3D"font-size:1=
0pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre-wrap"><a href=3D"https://wiki.xenproject.o=
rg/wiki/Driver_Domain">https://wiki.xenproject.org/wiki/Driver_Domain</a></=
span><span style=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"><br c=
lass=3D"gmail-kix-line-break"></span><span style=3D"font-size:10pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre-wrap"><a href=3D"https://www.slideshare.net/xen_com_mg=
r/the-openxt-project-in-2016-christopher-clark-bae-systems/15">https://www.=
slideshare.net/xen_com_mgr/the-openxt-project-in-2016-christopher-clark-bae=
-systems/15</a></span><span style=3D"font-size:10pt;font-family:Arial;color=
:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre-wrap"><br class=3D"gmail-kix-line-break"></span><span style=3D"font-s=
ize:10pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre-wrap"><a href=3D"https://www.qubes-os=
.org/doc/networking/">https://www.qubes-os.org/doc/networking/</a></span><s=
pan style=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,0);background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre-wrap"><br class=3D=
"gmail-kix-line-break"></span><span style=3D"font-size:10pt;font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre-wrap"><br class=3D"gmail-kix-line-break"></span><span style=
=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap">In addition to securi=
ty architecture, there is a question of performance:</span><span style=3D"f=
ont-size:10pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre-wrap"><br class=3D"gmail-kix-lin=
e-break"></span><span style=3D"font-size:10pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-=
wrap">the Virtio protocols are optimized for -- and can work well with -- h=
osted Type-2 hypervisors, but being implemented in QEMU they tend to become=
 a performance bottleneck in Xen deployments where Dom0 is usually only one=
 of many domains, and possibly not the largest.</span><span style=3D"font-s=
ize:10pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre-wrap"><br class=3D"gmail-kix-line-bre=
ak"></span><span style=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"=
><br class=3D"gmail-kix-line-break"></span><span style=3D"font-size:10pt;fo=
nt-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:none;vertical-alig=
n:baseline;white-space:pre-wrap">Significant development effort on Xen has =
gone into isolating and deprivileging the QEMU device emulator (stubdomains=
, dm_ops, dropping privileges, non-root QEMU, SELinux and XSM policy, ...) =
to reduce attack surface.</span><span style=3D"font-size:10pt;font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre-wrap"><br class=3D"gmail-kix-line-break"></span><span style=
=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap">Running VMs without Q=
EMU at all whenever possible is a valued capability.</span><span style=3D"f=
ont-size:10pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre-wrap"><br class=3D"gmail-kix-lin=
e-break"></span><span style=3D"font-size:10pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-=
wrap"><br class=3D"gmail-kix-line-break"></span><span style=3D"font-size:10=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-wei=
ght:400;font-style:normal;font-variant:normal;text-decoration:none;vertical=
-align:baseline;white-space:pre-wrap">Finally, although Virtio is often pre=
sented as a paravirtualized solution, it requires an emulation infrastructu=
re that is not otherwise necessary - and so it is not compatible with PV an=
d PVH guests on x86, or at all on ARM, because of this requirement.</span><=
/p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">A r=
eference to a related earlier discussion thread:</span></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:10pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre-wrap"><a href=3D"https://lists.g=
t.net/xen/devel/318380">https://lists.gt.net/xen/devel/318380</a></span></p=
><br><span style=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Chris=
topher</span><span style=3D"font-size:10pt;font-family:Arial;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p"><br class=3D"gmail-kix-line-break"></span></b><br></div><div><br></div><=
/div></div></div>

--94eb2c06ad284cf4610566ddb1dd--


--===============1905296030225024182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1905296030225024182==--
