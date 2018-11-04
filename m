From: Rishi <2rushikeshj@gmail.com>
Subject: Dom0 kernel 4.14 with SMP randomly crashing
Date: Sun, 4 Nov 2018 18:37:36 +0530
Message-ID: <CAO9XypUsz-e3vmX-n5eSMz7rG2aZpDG1h03CMRAAT2X=TpZNNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4940604271605558723=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============4940604271605558723==
Content-Type: multipart/alternative; boundary="00000000000084d2540579d6748a"

--00000000000084d2540579d6748a
Content-Type: text/plain; charset="UTF-8"

I've built a dom0 kernel 4.14 with SMP support. The dom0 kernel crashes
when I'm downloading a large file on host. It does not crash if I have
nosmp boot option on xen command line.

my .config SMP options are

[root@f6029920339a wip-kernel-4.14.78]# grep SMP .config

CONFIG_X86_64_*SMP*=y

CONFIG_GENERIC_*SMP*_IDLE_THREAD=y

CONFIG_*SMP*=y

CONFIG_XEN_PV_*SMP*=y

CONFIG_XEN_PVHVM_*SMP*=y

# CONFIG_MAX*SMP* is not set

CONFIG_PM_SLEEP_*SMP*=y

CONFIG_SCSI_SAS_HOST_*SMP*=y


While comparing it to earlier kernels the options

CONFIG_XEN_PV_*SMP*=y

CONFIG_XEN_PVHVM_*SMP*=y


are newly introduced. Does xen need any update to better handle them?

My xen versions is : 4.7.6

--00000000000084d2540579d6748a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve built a dom0 kernel 4.14 with SMP support. T=
he dom0 kernel crashes when I&#39;m downloading a large file on host. It do=
es not crash if I have nosmp boot option on xen command line.<br></div><div=
><br></div><div>my .config SMP options are</div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">[root@f6029920339a wip-kernel-4=
.14.78]# grep SMP .config</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CONFIG_X86_64_</span><span clas=
s=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:rg=
b(202,51,35)"><b>SMP</b></span><span class=3D"gmail-s1" style=3D"font-varia=
nt-ligatures:no-common-ligatures">=3Dy</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CONFIG_GENERIC_</span><span cla=
ss=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:r=
gb(202,51,35)"><b>SMP</b></span><span class=3D"gmail-s1" style=3D"font-vari=
ant-ligatures:no-common-ligatures">_IDLE_THREAD=3Dy</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CONFIG_</span><span class=3D"gm=
ail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(202,5=
1,35)"><b>SMP</b></span><span class=3D"gmail-s1" style=3D"font-variant-liga=
tures:no-common-ligatures">=3Dy</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CONFIG_XEN_PV_</span><span clas=
s=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:rg=
b(202,51,35)"><b>SMP</b></span><span class=3D"gmail-s1" style=3D"font-varia=
nt-ligatures:no-common-ligatures">=3Dy</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CONFIG_XEN_PVHVM_</span><span c=
lass=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color=
:rgb(202,51,35)"><b>SMP</b></span><span class=3D"gmail-s1" style=3D"font-va=
riant-ligatures:no-common-ligatures">=3Dy</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"># CONFIG_MAX</span><span class=
=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb=
(202,51,35)"><b>SMP</b></span><span class=3D"gmail-s1" style=3D"font-varian=
t-ligatures:no-common-ligatures"> is not set</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CONFIG_PM_SLEEP_</span><span cl=
ass=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:=
rgb(202,51,35)"><b>SMP</b></span><span class=3D"gmail-s1" style=3D"font-var=
iant-ligatures:no-common-ligatures">=3Dy</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CONFIG_SCSI_SAS_HOST_</span><sp=
an class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;c=
olor:rgb(202,51,35)"><b>SMP</b></span><span class=3D"gmail-s1" style=3D"fon=
t-variant-ligatures:no-common-ligatures">=3Dy</span></p><p class=3D"gmail-p=
1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatu=
res:no-common-ligatures"><br></span></p><p class=3D"gmail-p1" style=3D"marg=
in:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stre=
tch:normal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,=
0,0)"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-s=
erif;font-size:small">While comparing it to earlier kernels the options=C2=
=A0</span><br></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo=
;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures=
:no-common-ligatures">CONFIG_XEN_PV_</span><span class=3D"gmail-s2" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(202,51,35)"><b>SMP=
</b></span><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-comm=
on-ligatures">=3Dy</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;=
font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)">






</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">CONFIG_XEN_PVHVM_</span><sp=
an class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;c=
olor:rgb(202,51,35)"><b>SMP</b></span><span class=3D"gmail-s1" style=3D"fon=
t-variant-ligatures:no-common-ligatures">=3Dy</span></p><p class=3D"gmail-p=
1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatu=
res:no-common-ligatures"><br></span></p><p class=3D"gmail-p1" style=3D"marg=
in:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stre=
tch:normal;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,=
0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-li=
gatures"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,san=
s-serif;font-size:small;font-variant-ligatures:normal">are newly introduced=
. Does xen need any update to better handle them?</span><br></span></p><p c=
lass=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:normal=
;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font=
-variant-ligatures:no-common-ligatures"><span style=3D"color:rgb(34,34,34);=
font-family:Arial,Helvetica,sans-serif;font-size:small;font-variant-ligatur=
es:normal">My xen versions is=C2=A0</span></span><span style=3D"font-varian=
t-ligatures:no-common-ligatures">: 4.7.6</span></p>





</div></div>

--00000000000084d2540579d6748a--


--===============4940604271605558723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4940604271605558723==--
