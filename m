Return-Path: <SRS0=ef4D=SI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A903CC10F06
	for <xen-devel@archiver.kernel.org>; Sat,  6 Apr 2019 21:00:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65120213F2
	for <xen-devel@archiver.kernel.org>; Sat,  6 Apr 2019 21:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPzc6n+o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65120213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCsQT-0007qP-7w; Sat, 06 Apr 2019 21:00:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ExVF=SI=gmail.com=matthew.leinhos@srs-us1.protection.inumbo.net>)
 id 1hCsQR-0007qK-DQ
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2019 21:00:31 +0000
X-Inumbo-ID: 0259aae6-58af-11e9-92d7-bc764e045a96
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0259aae6-58af-11e9-92d7-bc764e045a96;
 Sat, 06 Apr 2019 21:00:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z24so10702280wmi.5
 for <xen-devel@lists.xenproject.org>; Sat, 06 Apr 2019 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iwkbrct55KTUSWu4mwTmypT37PP1Jl2hd+YCnW2AJ58=;
 b=KPzc6n+ofSumB4mTVMuj2LNboFuS8iCfh+tt1quspiRItaY7lWDPKB7m066Jed+TDC
 M6rdZO8QJC7QRvbfqXP6QgQG4BZR2ksvbXv2OeitVv5/ImNWpPrCz6rCRjaMt10KltHX
 4agGx9nmPHwD4//E+DrJinca2VigDAybJxF8gXmMkRSdOqh1lL2uMr7sDM4pZHko/q70
 IjRTU5WNT/8lrDd0l+tvpgkGbQ8qnuJn21TPwHPvE/PI5ICT2uYODhrBmaXSKBvDq2XN
 ywPwWhL3RUgyWLjIBC1qvqYOae2b4CMFmdfIn6jKasMwD8qoNIKfe/nTxea1VJxZUDfP
 EPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iwkbrct55KTUSWu4mwTmypT37PP1Jl2hd+YCnW2AJ58=;
 b=mn5Lt30LC6IMdy6l4zgIwc8urdfOjJuBO/MNcjbHYRQMfJCPgEd/rBmR4ADBMiA3ql
 e9/OiFY+fE6tiIg251bYnbyZOjFDJHewL0GRkOiTD9ZlIROG5RUtH3tSKWRI1FWmQOCT
 T/YGIPBJ7Lr0coIFtqmqjaTLgpIkdtqgCDWBkeGPx6zbay1kuEM2G125VpV5P05mqVIC
 H9tIpIhXrlInxPHg3A67dH5OYVa24ROmEPxUKKfUCXc0LoTNglxWJSxfejHP7L/mToRi
 mXgVhjGqy+gj5yAJKxsoE07LgttLHSvgz1ndDzWI/21ubT6dcsaniIqsmzno0eeuijNT
 evlw==
X-Gm-Message-State: APjAAAVg4iA1CS52JHK0cQ/O0Wom/MUO+iGh/jhugXYZM5ndO8cA+rMK
 dOffEbcX8F1Ac2I+6xCXPAGnzJLwNfauqBmjpAYx7tmk
X-Google-Smtp-Source: APXvYqyplMK6CTVk7QpgRMW58brQ/HmPekmZ4rLAKODCoitKeszgaF/5fzvO0HANWRbRKTzJaU6gp+Oiw5rVyAXqe/o=
X-Received: by 2002:a7b:c3c9:: with SMTP id t9mr11788302wmj.131.1554584428550; 
 Sat, 06 Apr 2019 14:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLDOk90XmXO+HF5evXqHNO48-pckHphNRpoMemx0u4L9NFMQQ@mail.gmail.com>
In-Reply-To: <CAFLDOk90XmXO+HF5evXqHNO48-pckHphNRpoMemx0u4L9NFMQQ@mail.gmail.com>
From: Matt Leinhos <matthew.leinhos@gmail.com>
Date: Sat, 6 Apr 2019 16:00:17 -0500
Message-ID:
 <CAFLDOk8ihm4xCMX9k99sE-htxbJrMyShQuJgQatOtCSph18CwQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] Xen 4.11.1: gdbsx fails
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8891381806626683677=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190406210017.bB-xar9LiLxhBCj33MptpQuyk4pCocLccXJQ_DazP0k@z>

--===============8891381806626683677==
Content-Type: multipart/alternative; boundary="000000000000a3216a0585e2e40a"

--000000000000a3216a0585e2e40a
Content-Type: text/plain; charset="UTF-8"

It appears that this is a known issue in gdbsx that was fixed in commit
0c9821d5c870c35aa38df7bb5e2ff54da2169b5b, as referenced here:
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg21769.html

However, that commit is not included in the RELEASE-4.11.1 tag. In fact, I
show tools/debuggers/gdbsx as being untouched since Apr 2018 in that tag.

--Matt


On Fri, Apr 5, 2019 at 4:48 PM Matt Leinhos <matthew.leinhos@gmail.com>
wrote:

> Greetings:
>
> I've encountered a problem running gdb + gdbsx on Xen 4.11.1, running
> Linux kernel 4.18.0-15 on Ubuntu 18.04. Pertinent info is below.
>
> I've observed this behavior with gdb 8.0, 8.1.1 and 8.2. I've also seen it
> on Xen 4.9.2. In short, something is broken with my system, but I don't
> know how to investigate.
>
> Thanks in advance for any help!
>
> --Matt
>
>
> Here's my guest config file:
>
> $ cat xen-vms/ub1804-dev.hvm
> type = "hvm"
> name = "ub18-dev-work"
>
> # Initial and max memory allocation (MB)
> memory = 2048
> maxmem = 2048
>
> vcpus = 1
> acpi = 1
> apic = 1
> # values: disabled, mixed, external, limited
> altp2m = "mixed"
> vif = [ 'bridge=xenbr0' ]
> disk = [ 'phy:/dev/ubuntu-vg/xen_ubuntu_dev,xvda,w'
>
> ,'file:/home/matt/iso/ubuntu-18.04.1-desktop-amd64.iso,hdc:cdrom,r' ]
> boot = 'c' # hard disk (c) / cdrom (d)
> console = 1
> on_poweroff = "destroy"
> on_reboot   = "restart"
> on_crash    = "preserve"
>
>
> Here are the two usages of gdbsx (both from Dom0). Note that domain 2 is
> 64 bit.
>
> # xl list
> Name                                        ID   Mem VCPUs      State
> Time(s)
> Domain-0                                     0 30098     8     r-----
> 8724.5
> ub18-dev-work                                2  2040     1     -b----
> 24.9
>
> This is a sanity check....
> # gdbsx -c 2 64 0
> ===> Context for DOMID:2
>
> --> VCPU:0
> rip:ffffffff9b1f52e6 rsp:ffffffff9bc03e10 flags:0000000000000246
> rax:ffffffff9b1f4ff0 rbx:0000000000000000 rcx:ffffffff9bc6ff60
> rdx:0000000000066e16 rsi:ffffffff9bc2ebc8 rdi:0000000000000000
> r08:00000000505563be r09:0000000000000000 r10:0000000000000008
> r11:0000000000000008 r12:0000000000000000 r13:0000000000000000
> r14:0000000000000000 r15:0000000000000000 rbp:ffffffff9bc03e10
> cs:0000000000000010 ds:0000000000000000 fs:0000000000000000
> gs:0000000000000000
>
> Call Trace:
>    [ffffffff9b1f52e6]
>    [ffffffff9bc03e38]
>    [ffffffff9b1f5010]
>    [ffffffff9be85ee0]
>    [ffffffff9bc03e48]
>    [ffffffff9a8394c5]
>    [ffffffff9bc03e58]
>    [ffffffff9b1f544c]
>    [ffffffff9bc03ea0]
>    [ffffffff9a8c3c84]
>    [ffffffff9bf8c920]
>
> This is the actual usage that fails
> # gdbsx -a 2 64 3333
> Listening on port 3333
> Remote debugging from host 127.0.0.1
> readchar: Got EOF
> Detaching from guest
> Exiting.. Remote side has terminated connection
>
>
> And here's the corresponding usage of gdb that led to the failure in gdbsx
> (again, from Dom0):
>
> $ gdb -q
> Currently logging to "/home/matt/gdb.log".
> Logs will overwrite the log file.
> Output will be logged and displayed.
> gdb> set architecture i386:x86-64
> The target architecture is assumed to be i386:x86-64
> gdb> target remote localhost:3333
> Remote debugging using localhost:3333
> warning: No executable has been specified and target does not support
> determining executable automatically.  Try using the "file" command.
> Truncated register 26 in remote 'g' packet
> gdb> show version
> GNU gdb (Ubuntu 8.2-0ubuntu1~18.04) 8.2
> Copyright (C) 2018 Free Software Foundation, Inc.
>

--000000000000a3216a0585e2e40a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It appears that this is a known issue in gdbsx that was fi=
xed in commit=C2=A0<span style=3D"color:rgb(0,0,0);font-family:courier,&quo=
t;courier new&quot;,monospace;font-size:14px;white-space:pre-wrap">0c9821d5=
c870c35aa38df7bb5e2ff54da2169b5b</span><span style=3D"color:rgb(0,0,0);font=
-family:courier,&quot;courier new&quot;,monospace;white-space:pre-wrap">, a=
s referenced here:</span><br><div><a href=3D"https://www.mail-archive.com/x=
en-devel@lists.xenproject.org/msg21769.html">https://www.mail-archive.com/x=
en-devel@lists.xenproject.org/msg21769.html</a><span style=3D"color:rgb(0,0=
,0);font-family:courier,&quot;courier new&quot;,monospace;font-size:14px;wh=
ite-space:pre-wrap"><br></span></div><div><br></div><div>However, that comm=
it is not included in the RELEASE-4.11.1 tag. In fact, I show tools/debugge=
rs/gdbsx as being untouched since Apr 2018 in that tag.</div><div><br></div=
><div>--Matt</div><div><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 5, 2019 at 4:48 PM Matt Leinho=
s &lt;<a href=3D"mailto:matthew.leinhos@gmail.com">matthew.leinhos@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr">Greetings:<br><br>I&#39;ve encountered a problem running =
gdb + gdbsx on Xen=20
4.11.1, running Linux kernel 4.18.0-15 on Ubuntu 18.04. Pertinent info=20
is below.<br><div><br></div><div>I&#39;ve observed this behavior with gdb 8=
.0, 8.1.1 and 8.2. I&#39;ve also seen it on Xen 4.9.2. In short, something =
is broken with my system, but I don&#39;t know how to investigate.<br></div=
><div><br></div>Thanks in advance for any help!<br><br>--Matt<br><br><br>He=
re&#39;s my guest config file:<br><br>$ cat xen-vms/ub1804-dev.hvm<br>type =
=3D &quot;hvm&quot;<br>name =3D &quot;ub18-dev-work&quot;<br><br># Initial =
and max memory allocation (MB)<br>memory =3D 2048<br>maxmem =3D 2048<br><br=
>vcpus =3D 1<br>acpi =3D 1<br>apic =3D 1<br># values: disabled, mixed, exte=
rnal, limited<br>altp2m =3D &quot;mixed&quot;=C2=A0 <br>vif =3D [ &#39;brid=
ge=3Dxenbr0&#39; ]<br>disk =3D [ &#39;phy:/dev/ubuntu-vg/xen_ubuntu_dev,xvd=
a,w&#39;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ,&#39;file:/home/mat=
t/iso/ubuntu-18.04.1-desktop-amd64.iso,hdc:cdrom,r&#39; ]<br>boot =3D &#39;=
c&#39; # hard disk (c) / cdrom (d)<br>console =3D 1<br>on_poweroff =3D &quo=
t;destroy&quot;<br>on_reboot=C2=A0=C2=A0 =3D &quot;restart&quot;<br>on_cras=
h=C2=A0=C2=A0=C2=A0 =3D &quot;preserve&quot;<br><br><br>Here are the two us=
ages of gdbsx (both from Dom0). Note that domain 2 is 64 bit.<br><br># xl l=
ist<br>Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ID=C2=A0=C2=A0 Mem VCPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 State=C2=A0=C2=A0 Time(s)<br>Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 30098=C2=A0=C2=A0=C2=A0=C2=A0 8=C2=A0=
=C2=A0=C2=A0=C2=A0 r-----=C2=A0=C2=A0=C2=A0 8724.5<br>ub18-dev-work=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0 2040=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=
=C2=A0=C2=A0=C2=A0 -b----=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.9<br><div><br></=
div><div>This is a sanity check....<br></div># gdbsx -c 2 64 0<br>=3D=3D=3D=
&gt; Context for DOMID:2<br><br>--&gt; VCPU:0<br>rip:ffffffff9b1f52e6 rsp:f=
fffffff9bc03e10 flags:0000000000000246<br>rax:ffffffff9b1f4ff0 rbx:00000000=
00000000 rcx:ffffffff9bc6ff60<br>rdx:0000000000066e16 rsi:ffffffff9bc2ebc8 =
rdi:0000000000000000<br>r08:00000000505563be r09:0000000000000000 r10:00000=
00000000008<br>r11:0000000000000008 r12:0000000000000000 r13:00000000000000=
00<br>r14:0000000000000000 r15:0000000000000000 rbp:ffffffff9bc03e10<br>cs:=
0000000000000010 ds:0000000000000000 fs:0000000000000000 gs:000000000000000=
0<br><br>Call Trace:<br>=C2=A0=C2=A0 [ffffffff9b1f52e6]<br>=C2=A0=C2=A0 [ff=
ffffff9bc03e38]<br>=C2=A0=C2=A0 [ffffffff9b1f5010]<br>=C2=A0=C2=A0 [fffffff=
f9be85ee0]<br>=C2=A0=C2=A0 [ffffffff9bc03e48]<br>=C2=A0=C2=A0 [ffffffff9a83=
94c5]<br>=C2=A0=C2=A0 [ffffffff9bc03e58]<br>=C2=A0=C2=A0 [ffffffff9b1f544c]=
<br>=C2=A0=C2=A0 [ffffffff9bc03ea0]<br>=C2=A0=C2=A0 [ffffffff9a8c3c84]<br><=
div>=C2=A0=C2=A0 [ffffffff9bf8c920]</div><div><br></div><div>This is the ac=
tual usage that fails<br></div># gdbsx -a 2 64 3333<br>Listening on port 33=
33<br>Remote debugging from host 127.0.0.1<br>readchar: Got EOF<br>Detachin=
g from guest<br>Exiting.. Remote side has terminated connection<br><br><br>=
And here&#39;s the corresponding usage of gdb that led to the failure in gd=
bsx (again, from Dom0):<br><br>$ gdb -q<br>Currently logging to &quot;/home=
/matt/gdb.log&quot;.<br>Logs will overwrite the log file.<br>Output will be=
 logged and displayed.<br>gdb&gt; set architecture i386:x86-64<br>The targe=
t architecture is assumed to be i386:x86-64<br>gdb&gt; target remote localh=
ost:3333<br>Remote debugging using localhost:3333<br>warning: No executable=
 has been specified and target does not support<br>determining executable a=
utomatically.=C2=A0 Try using the &quot;file&quot; command.<br>Truncated re=
gister 26 in remote &#39;g&#39; packet<br>gdb&gt; show version<br>GNU gdb (=
Ubuntu 8.2-0ubuntu1~18.04) 8.2<br>Copyright (C) 2018 Free Software Foundati=
on, Inc.</div>
</blockquote></div>

--000000000000a3216a0585e2e40a--


--===============8891381806626683677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8891381806626683677==--

