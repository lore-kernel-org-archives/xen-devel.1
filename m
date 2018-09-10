From: Karl Johnson <karljohnson.it@gmail.com>
Subject: Re: xpti=dom0=false doesn't seem to work on 4.8.4
Date: Mon, 10 Sep 2018 12:40:22 -0400
Message-ID: <CAAzNQHQxPXL+fFZMtE6c4CHAiet6FF=E=TUAC6U_i4cyGB8w3Q@mail.gmail.com>
References: <CAAzNQHSU6x9Tp9kRx65Q8sZ2wEm4QcLyNgT_40gBia+=ShsmjQ@mail.gmail.com>
 <5B4C67C402000078001D43AD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5029875681395658962=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f4mt=ly=gmail.com=karljohnson.it@srs-us1.protection.inumbo.net>)
 id 1fzPEr-0003Fj-EZ
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 16:40:37 +0000
Received: by mail-lf1-x141.google.com with SMTP id x26-v6so17979152lfi.7
 for <xen-devel@lists.xenproject.org>; Mon, 10 Sep 2018 09:40:35 -0700 (PDT)
In-Reply-To: <5B4C67C402000078001D43AD@prv1-mh.provo.novell.com>
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

--===============5029875681395658962==
Content-Type: multipart/alternative; boundary="00000000000025a64905758704aa"

--00000000000025a64905758704aa
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 5:39 AM Jan Beulich <JBeulich@suse.com> wrote:

> >>> On 13.07.18 at 20:54, <karljohnson.it@gmail.com> wrote:
> > Hello,
> >
> > I'm currently testing last Xen 4.8.4 build for CentOS
> > (http://cbs.centos.org/koji/buildinfo?buildID=23169) and disabling
> > XPTI for dom0 doesn't seem to work:
> >
> > (XEN) Command line: dom0_mem=1792M,max:2048M dom0_max_vcpus=4 cpuinfo
> > com1=115200,8n1 console=com1,vga xpti=dom0=false loglvl=all
> > guest_loglvl=all crashkernel=512M@64M
> >
> > (XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled
> >
> > Bug or wrong syntax?
>
> Bug - see
> https://lists.xenproject.org/archives/html/xen-devel/2018-07/msg01305.html
> .
>
> Alternatively you could use "xpti=no-dom0" or (I think) "xpti=dom0=false,".
>
> Jan
>

Is xpti command line broken again on 4.8? I've upgraded to package
xen-4.8.4.43.ge52ec4b787-1 which is based on latest staging snapshot and
xpti=no-dom0 now seems to disable XPTI for domU:

[root@node-tmp1 ~]# xl dmesg|grep -i xpti
(XEN) Command line: dom0_mem=1792M,max:2048M dom0_max_vcpus=4 cpuinfo
com1=115200,8n1 console=com1,vga xpti=no-dom0 crashkernel=512M@64M
loglvl=all guest_loglvl=all
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled

Karl

--00000000000025a64905758704aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Mon, Jul 16, 2018 at 5:39 AM Jan Beulich &lt;<a href=
=3D"mailto:JBeulich@suse.com">JBeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt; On 13.07.18 at =
20:54, &lt;<a href=3D"mailto:karljohnson.it@gmail.com" target=3D"_blank">ka=
rljohnson.it@gmail.com</a>&gt; wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I&#39;m currently testing last Xen 4.8.4 build for CentOS<br>
&gt; (<a href=3D"http://cbs.centos.org/koji/buildinfo?buildID=3D23169" rel=
=3D"noreferrer" target=3D"_blank">http://cbs.centos.org/koji/buildinfo?buil=
dID=3D23169</a>) and disabling<br>
&gt; XPTI for dom0 doesn&#39;t seem to work:<br>
&gt; <br>
&gt; (XEN) Command line: dom0_mem=3D1792M,max:2048M dom0_max_vcpus=3D4 cpui=
nfo<br>
&gt; com1=3D115200,8n1 console=3Dcom1,vga xpti=3Ddom0=3Dfalse loglvl=3Dall<=
br>
&gt; guest_loglvl=3Dall crashkernel=3D512M@64M<br>
&gt; <br>
&gt; (XEN)=C2=A0 =C2=A0XPTI (64-bit PV only): Dom0 enabled, DomU enabled<br=
>
&gt; <br>
&gt; Bug or wrong syntax?<br>
<br>
Bug - see <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2=
018-07/msg01305.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xe=
nproject.org/archives/html/xen-devel/2018-07/msg01305.html</a>.<br>
<br>
Alternatively you could use &quot;xpti=3Dno-dom0&quot; or (I think) &quot;x=
pti=3Ddom0=3Dfalse,&quot;.<br>
<br>
Jan<br></blockquote><div><br></div><div>Is xpti command line broken again o=
n 4.8? I&#39;ve upgraded to package xen-4.8.4.43.ge52ec4b787-1 which is bas=
ed on latest staging snapshot and xpti=3Dno-dom0 now seems to disable XPTI =
for domU:<br></div><div><br></div><div>[root@node-tmp1 ~]# xl dmesg|grep -i=
 xpti<br>(XEN) Command line: dom0_mem=3D1792M,max:2048M dom0_max_vcpus=3D4 =
cpuinfo com1=3D115200,8n1 console=3Dcom1,vga xpti=3Dno-dom0 crashkernel=3D5=
12M@64M loglvl=3Dall guest_loglvl=3Dall<br>(XEN)=C2=A0=C2=A0 XPTI (64-bit P=
V only): Dom0 disabled, DomU disabled</div><div><br></div><div>Karl<br></di=
v></div></div></div></div>

--00000000000025a64905758704aa--


--===============5029875681395658962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5029875681395658962==--
