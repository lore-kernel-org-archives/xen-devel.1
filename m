From: Man Chon Kuok <manchonkuok@gmail.com>
Subject: Re: Dynamic Disassembling domU Instructions
Date: Fri, 5 Jan 2018 14:34:00 -1000
Message-ID: <CAJnNCGMo7GOFi90t+Th30b71Jiq2gpFdd_1Ks1wKE-Q6vvVq_w@mail.gmail.com>
References: <CAJnNCGMXY6+pGrp+Vb7nxucKGZxyrZPS8SDRsZNCv0Njw+YYiA@mail.gmail.com>
 <5A4F558C020000780019B4AC@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6957707367474030089=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0vun=eb=gmail.com=manchonkuok@srs-us1.protection.inumbo.net>)
 id 1eXcR1-0007wN-KW
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2018 00:34:03 +0000
Received: by mail-io0-x231.google.com with SMTP id z130so7468455ioe.13
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2018 16:34:01 -0800 (PST)
In-Reply-To: <5A4F558C020000780019B4AC@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============6957707367474030089==
Content-Type: multipart/alternative; boundary="001a1144758cb35d3d056210b80e"

--001a1144758cb35d3d056210b80e
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

Thank you for the insight. That explains a lot of the repeated cached
instruction fetching.
This might belong to another thread, I was exploring xentrace, ran it with
"sudo xentrace output", but it returns the message of "ERROR: Failed to map
cpu buffer! (13 = Permission denied)", even running as root. Googled around
but nothing insightful showed up, any suggestion would be appreciated.

Best,


On Thu, Jan 4, 2018 at 11:38 PM, Jan Beulich <JBeulich@suse.com> wrote:

> >>> On 05.01.18 at 04:17, <manchonkuok@gmail.com> wrote:
> > I am trying to modify Xen 4.8 to have it print out the opcode as well as
> > some registers of an HVM domU as it runs. I tried to modify
> > xen/arch/x86/hvm/emulate.c 's hvmemul_insn_fetch to output the content in
> > hvmemul_ctxt->insn_buf with printk. In hvmemul_insn_fetch, it seems that
> a
> > lot of the requested bytes are cached, does the domU's OS repeatedly
> calls
> > the same instruction region over and over again?
>
> No, but certain operations require going through the emulator
> twice (e.g. once to formulate a request to qemu, and a second
> time to process its response). It would be wrong to read guest
> memory a second time in such a case.
>
> You will also notice that after a completed emulation that cache
> is being invalidated.
>
> > Lastly, I am using printk to log the opcodes. Ideally I would want the
> > opcode to be written to a separate file, but I read that it is not good
> to
> > do any file access in kernel programming. Are there other alternatives or
> > util functions that I should consider using?
>
> xentrace would come to mind.
>
> Jan
>
>

--001a1144758cb35d3d056210b80e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Jan,<br><br></div>Thank you for the insi=
ght. That explains a lot of the repeated cached instruction fetching.<br></=
div>This might belong to another thread, I was exploring xentrace, ran it w=
ith &quot;sudo xentrace output&quot;, but it returns the message of &quot;E=
RROR: Failed to map cpu buffer! (13 =3D Permission denied)&quot;, even runn=
ing as root. Googled around but nothing insightful showed up, any suggestio=
n would be appreciated.<br><br></div>Best,<br><br></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Thu, Jan 4, 2018 at 11:38 PM, Jan=
 Beulich <span dir=3D"ltr">&lt;<a href=3D"mailto:JBeulich@suse.com" target=
=3D"_blank">JBeulich@suse.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span class=3D"">&gt;&gt;&gt; On 05.01.18 at 04:17, &lt;<a href=
=3D"mailto:manchonkuok@gmail.com">manchonkuok@gmail.com</a>&gt; wrote:<br>
&gt; I am trying to modify Xen 4.8 to have it print out the opcode as well =
as<br>
&gt; some registers of an HVM domU as it runs. I tried to modify<br>
&gt; xen/arch/x86/hvm/emulate.c &#39;s hvmemul_insn_fetch to output the con=
tent in<br>
&gt; hvmemul_ctxt-&gt;insn_buf with printk. In hvmemul_insn_fetch, it seems=
 that a<br>
&gt; lot of the requested bytes are cached, does the domU&#39;s OS repeated=
ly calls<br>
&gt; the same instruction region over and over again?<br>
<br>
</span>No, but certain operations require going through the emulator<br>
twice (e.g. once to formulate a request to qemu, and a second<br>
time to process its response). It would be wrong to read guest<br>
memory a second time in such a case.<br>
<br>
You will also notice that after a completed emulation that cache<br>
is being invalidated.<br>
<span class=3D""><br>
&gt; Lastly, I am using printk to log the opcodes. Ideally I would want the=
<br>
&gt; opcode to be written to a separate file, but I read that it is not goo=
d to<br>
&gt; do any file access in kernel programming. Are there other alternatives=
 or<br>
&gt; util functions that I should consider using?<br>
<br>
</span>xentrace would come to mind.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Jan<br>
<br>
</font></span></blockquote></div><br></div>

--001a1144758cb35d3d056210b80e--


--===============6957707367474030089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6957707367474030089==--
