From: Yessine Daoud <da.yessine@gmail.com>
Subject: Re: Slow HVM boot time, was "HVM boot time optimization"
Date: Thu, 15 Feb 2018 17:02:35 +0100
Message-ID: <CABLtV0DfAWpTHizHBpSqJZC9dk7UfWnOfq1OsBh9RSEReDax_g@mail.gmail.com>
References: <CABLtV0BqS_Y6oMt8TyCx55Nf9mB=-L7To+xY2on76p+1KDyXSQ@mail.gmail.com>
 <alpine.DEB.2.10.1802080826470.15787@sstabellini-ThinkPad-X260>
 <20180208164810.7h7equv4gfbjyzet@citrix.com>
 <20180208165600.GC1740@perard.uk.xensource.com>
 <20180208173233.6dejumgyqsz3ecjv@citrix.com>
 <CABLtV0Aq4JZfqZSZHYwsOp3PcebPhyQ90kQoqvxJid_2-owwHA@mail.gmail.com>
 <20180212144217.5iwogwdydfl7ehof@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1423486729142036141=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+wnk=fj=gmail.com=da.yessine@srs-us1.protection.inumbo.net>)
 id 1emLzZ-0001fb-Sd
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2018 16:02:38 +0000
Received: by mail-io0-x233.google.com with SMTP id 72so1068134iom.10
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2018 08:02:35 -0800 (PST)
In-Reply-To: <20180212144217.5iwogwdydfl7ehof@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

--===============1423486729142036141==
Content-Type: multipart/alternative; boundary="001a113ffd102cc6b90565425b0e"

--001a113ffd102cc6b90565425b0e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hello,

I tried to debug the issue and this what I found:
the HVM boot takes some time at the following section
(qemu/pc-bios/optionrom/linuxboot.S)
/* Load kernel and initrd */
read_fw_blob_addr32_edi(FW_CFG_INITRD) (ramdisk about 3M takes ~~7.s)
read_fw_blob_addr32(FW_CFG_KERNEL) (vmlinuz about 7M takes ~~15.s)
read_fw_blob_addr32(FW_CFG_CMDLINE)

#define read_fw_blob_addr32(var) \
read_fw var ## _ADDR; \
mov %eax, %edi; \
read_fw_blob_pre(var); \
/* old as(1) doesn't like this insn so emit the bytes instead: \
addr32 rep insb (%dx), %es:(%edi); \
*/ \
.dc.b 0x67,0xf3,0x6c

#define read_fw_blob_addr32_edi(var) \
read_fw_blob_pre(var); \
/* old as(1) doesn't like this insn so emit the bytes instead: \
addr32 rep insb (%dx), %es:(%edi); \
*/ \
.dc.b 0x67,0xf3,0x6c

Any idea how to speed the  I/O read ?
Thanks.


=E1=90=A7

2018-02-12 15:42 GMT+01:00 Wei Liu <wei.liu2@citrix.com>:

> On Mon, Feb 12, 2018 at 09:27:25AM +0100, Yessine Daoud wrote:
> >  Hello,
> >
> > Thank you for your quick response.
> > Any hints how can I "fix" this "issue"? *Any workaround?
> >
>
> Honestly I have no idea why it is slow unless there is more logging
> available.
>
> Wei.
>

--001a113ffd102cc6b90565425b0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;font-size:12.8px;=
float:none;display:inline">Hello,</span><div style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;font-size:12.8px"><br></div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;font-size:12.8px">I tried to debug the issu=
e and this what I found:</div><div style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;font-size:12.8px">the HVM boot takes some time at the following=
 section (qemu/pc-bios/optionrom/<wbr>linuxboot.S)</div><div style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;font-size:12.8px"><div><span style=3D=
"white-space:pre-wrap">	</span>/* Load kernel and initrd */</div><div><span=
 style=3D"white-space:pre-wrap">	</span>read_fw_blob_addr32_edi(FW_<wbr>CFG=
_INITRD) (ramdisk about 3M takes ~~7.s)</div><div><span style=3D"white-spac=
e:pre-wrap">	</span>read_fw_blob_addr32(FW_CFG_<wbr>KERNEL) (vmlinuz about =
7M takes ~~15.s)</div><div><span style=3D"white-space:pre-wrap">	</span>rea=
d_fw_blob_addr32(FW_CFG_<wbr>CMDLINE)</div></div><div style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;font-size:12.8px"><br></div><div style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;font-size:12.8px"><div>#define rea=
d_fw_blob_addr32(var)<span style=3D"white-space:pre-wrap">			</span>\</div>=
<div><span style=3D"white-space:pre-wrap">	</span>read_fw<span style=3D"whi=
te-space:pre-wrap">		</span>var ## _ADDR;<span style=3D"white-space:pre-wra=
p">			</span>\</div><div><span style=3D"white-space:pre-wrap">	</span>mov<s=
pan style=3D"white-space:pre-wrap">		</span>%eax, %edi;<span style=3D"white=
-space:pre-wrap">			</span>\</div><div><span style=3D"white-space:pre-wrap"=
>	</span>read_fw_blob_pre(var);<span style=3D"white-space:pre-wrap">				</s=
pan>\</div><div><span style=3D"white-space:pre-wrap">	</span>/* old as(1) d=
oesn&#39;t like this insn so emit the bytes instead: \</div><div><span styl=
e=3D"white-space:pre-wrap">	</span>addr32 rep insb<span style=3D"white-spac=
e:pre-wrap">	</span>(%dx), %es:(%edi);<span style=3D"white-space:pre-wrap">=
		</span>\</div><div><span style=3D"white-space:pre-wrap">	</span>*/<span s=
tyle=3D"white-space:pre-wrap">						</span>\</div><div><span style=3D"white=
-space:pre-wrap">	</span>.dc.b<span style=3D"white-space:pre-wrap">		</span=
>0x67,0xf3,0x6c</div></div><div style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;font-size:12.8px"><br></div><div style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;font-size:12.8px"><div>#define read_fw_blob_addr32_edi(v=
ar)<span style=3D"white-space:pre-wrap">			</span>\</div><div><span style=
=3D"white-space:pre-wrap">	</span>read_fw_blob_pre(var);<span style=3D"whit=
e-space:pre-wrap">				</span>\</div><div><span style=3D"white-space:pre-wra=
p">	</span>/* old as(1) doesn&#39;t like this insn so emit the bytes instea=
d: \</div><div><span style=3D"white-space:pre-wrap">	</span>addr32 rep insb=
<span style=3D"white-space:pre-wrap">	</span>(%dx), %es:(%edi);<span style=
=3D"white-space:pre-wrap">		</span>\</div><div><span style=3D"white-space:p=
re-wrap">	</span>*/<span style=3D"white-space:pre-wrap">						</span>\</div=
><div><span style=3D"white-space:pre-wrap">	</span>.dc.b<span style=3D"whit=
e-space:pre-wrap">		</span>0x67,0xf3,0x6c</div></div><div style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;font-size:12.8px"><br></div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;font-size:12.8px">Any idea h=
ow to speed the=C2=A0<span>=C2=A0</span><span style=3D"color:rgb(34,34,34);=
font-family:&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:15px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">I/O read ?</span>=
</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
tyle:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-wei=
ght:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transfo=
rm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,25=
5);text-decoration-style:initial;text-decoration-color:initial;font-size:12=
.8px">Thanks.</div><br class=3D"gmail-Apple-interchange-newline">

<br></div><div hspace=3D"streak-pt-mark" style=3D"max-height:1px"><img alt=
=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=3D"https://mai=
lfoogae.appspot.com/t?sender=3DaZGEueWVzc2luZUBnbWFpbC5jb20%3D&amp;type=3Dz=
erocontent&amp;guid=3D642a2b25-5ebd-49d1-8ba2-5f813c1dd582"><font color=3D"=
#ffffff" size=3D"1">=E1=90=A7</font></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">2018-02-12 15:42 GMT+01:00 Wei Liu <span dir=3D"lt=
r">&lt;<a href=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@ci=
trix.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>On Mon, Feb 12, 2018 at 09:27:25AM +0100, Yessine Daoud wrote:<br>
&gt;=C2=A0 Hello,<br>
&gt;<br>
&gt; Thank you for your quick response.<br>
&gt; Any hints how can I &quot;fix&quot; this &quot;issue&quot;? *Any worka=
round?<br>
&gt;<br>
<br>
</span>Honestly I have no idea why it is slow unless there is more logging<=
br>
available.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Wei.<br>
</font></span></blockquote></div><br></div>

--001a113ffd102cc6b90565425b0e--


--===============1423486729142036141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1423486729142036141==--
