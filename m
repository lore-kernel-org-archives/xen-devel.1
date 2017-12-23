From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: Question about PV normalise_pagetable
Date: Sat, 23 Dec 2017 13:35:41 +0000
Message-ID: <CADNMjEBeAsuyFA_=e6hL5XKCCPSG8uQxBxJrM0Q+iwHVKMzObA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4778665772851210536=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6jw/=dt=gmail.com=bruno.alvisio@srs-us1.protection.inumbo.net>)
 id 1eSjxp-0007Lp-D3
 for xen-devel@lists.xenproject.org; Sat, 23 Dec 2017 13:35:45 +0000
Received: by mail-yw0-x22d.google.com with SMTP id f1so4982616ywd.8
 for <xen-devel@lists.xenproject.org>; Sat, 23 Dec 2017 05:35:42 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

--===============4778665772851210536==
Content-Type: multipart/alternative; boundary="001a114922d26ecc78056102029f"

--001a114922d26ecc78056102029f
Content-Type: text/plain; charset="UTF-8"

Hi all,

I was understanding the code in tools/libxc/xc_sr_save_x86_pv.c and found
this comment to the normalise_pagetable:

/*
 * Normalise a pagetable for the migration stream.  Performs pfn->mfn
 * conversions on the ptes.
 */
static int normalise_pagetable(struct xc_sr_context *ctx, const uint64_t *src,
                               uint64_t *dst, unsigned long type)


Looks like the function (as it should) is doing the reverse conversion mfn->pfn.

Wanted to confirm this typo or if I am missing something?

Thanks,

Bruno

--001a114922d26ecc78056102029f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I was understanding the code in=
 tools/libxc/xc_sr_save_x86_pv.c and found this comment to the normalise_pa=
getable:</div><div><br></div><div><pre style=3D"font-family:Menlo"><span st=
yle=3D"background-color:rgb(255,255,255)"><font color=3D"#000000" size=3D"1=
"><span style=3D"font-style:italic">/*<br></span><span style=3D"font-style:=
italic"> * Normalise a pagetable for the migration stream.  Performs pfn-&g=
t;mfn<br></span><span style=3D"font-style:italic"> * conversions on the pte=
s.<br></span><span style=3D"font-style:italic"> */<br></span><span style=3D=
"font-weight:bold">static int </span>normalise_pagetable(<span style=3D"fon=
t-weight:bold">struct </span>xc_sr_context *ctx, <span style=3D"font-weight=
:bold">const </span>uint64_t *src,<br>                               uint64=
_t *dst, <span style=3D"font-weight:bold">unsigned long </span>type)</font>=
</span></pre><pre style=3D"font-family:Menlo"><span style=3D"background-col=
or:rgb(255,255,255)"><font color=3D"#000000" size=3D"1"><br></font></span><=
/pre><pre><span style=3D"background-color:rgb(255,255,255)"><font color=3D"=
#000000" face=3D"arial, helvetica, sans-serif">Looks like the function (as =
it should) is doing the reverse conversion mfn-&gt;pfn.</font></span></pre>=
<pre><span style=3D"background-color:rgb(255,255,255)"><font color=3D"#0000=
00" face=3D"arial, helvetica, sans-serif">Wanted to confirm this typo or if=
 I am missing something?</font></span></pre><pre><span style=3D"background-=
color:rgb(255,255,255)"><font color=3D"#000000" face=3D"arial, helvetica, s=
ans-serif">Thanks,</font></span></pre><pre><span style=3D"color:rgb(0,0,0)"=
><font face=3D"arial, helvetica, sans-serif">Bruno</font></span><font face=
=3D"Menlo"><br></font></pre></div></div>

--001a114922d26ecc78056102029f--


--===============4778665772851210536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4778665772851210536==--
