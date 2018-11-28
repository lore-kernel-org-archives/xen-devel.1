From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Wed, 28 Nov 2018 11:19:15 -0800
Message-ID: <CAHk-=whcbiSxSUprsKjVPEdN5-+o8WnTGiKxEV-+HbKNDs=iNA__26439.4302423627$1543432716$gmane$org@mail.gmail.com>
References: <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de> <20181128074117.GA21126@lst.de>
 <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
 <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
 <20181128180841.GM30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3697526988356726052=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ggdt=oh=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gS5N0-0006VO-O5
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 19:19:34 +0000
Received: by mail-lj1-x22e.google.com with SMTP id t9-v6so24473743ljh.6
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 11:19:32 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id v11-v6sm1258457ljc.57.2018.11.28.11.19.28
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Nov 2018 11:19:28 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id c19-v6so24488918lja.5
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 11:19:28 -0800 (PST)
In-Reply-To: <20181128180841.GM30658@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

--===============3697526988356726052==
Content-Type: multipart/alternative; boundary="000000000000de3c2d057bbe713a"

--000000000000de3c2d057bbe713a
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 28, 2018, 10:08 Russell King - ARM Linux <linux@armlinux.org.uk
wrote:

> >
> > You already cannot do that kmalloc(), exactly because of ERR_PTR().
>
> I'm very sorry, but I think you are confused.
>
> kmalloc() returns a _virtual_ address, which quite rightly must not be
> in the top 4K of 4GB, exactly due to ERR_PTR().  That is fine.
>
> However, that is a completely different kettle of fish from a physical
> or DMA address - neither of which are virtual addresses.
>

You cut away the part that showed that I'm not in the least confused.

Let me just paste it back in here:

  "Which is what we ALREADY do for these exact reasons. If the DMA
mappings means that you'd need to add one more page to that list of
reserved pages, then so be it."

So no, I'm not at all confused.

Let me re-iterate: the argument that all addresses have to be dma'able is
garbage.

*Exactly* as with kmalloc and limited virtual addresses, we can limit
physical addresses.

      Linus

--000000000000de3c2d057bbe713a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Wed, Nov 28, 2018, 10:08 Russell King - ARM Linux &lt;<a href=3D"mailto:=
linux@armlinux.org.uk">linux@armlinux.org.uk</a> wrote:</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
&gt; <br>
&gt; You already cannot do that kmalloc(), exactly because of ERR_PTR().<br=
>
<br>
I&#39;m very sorry, but I think you are confused.<br>
<br>
kmalloc() returns a _virtual_ address, which quite rightly must not be<br>
in the top 4K of 4GB, exactly due to ERR_PTR().=C2=A0 That is fine.<br>
<br>
However, that is a completely different kettle of fish from a physical<br>
or DMA address - neither of which are virtual addresses.<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">You cut away the pa=
rt that showed that I&#39;m not in the least confused.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Let me just paste it back in here:</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0 &quot;Which is what we ALR=
EADY do for these exact reasons. If the DMA</div>mappings means that you&#3=
9;d need to add one more page to that list of<br style=3D"">reserved pages,=
 then so be it.&quot;<div dir=3D"auto"><br></div><div dir=3D"auto">So no, I=
&#39;m not at all confused.=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Let me re-iterate: the argument that all addresses have to be dma=
&#39;able is garbage.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">*Exactly* as with kmalloc and limited virtual addresses, we can limit p=
hysical addresses.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=
=A0 =C2=A0 =C2=A0 Linus</div></div>

--000000000000de3c2d057bbe713a--


--===============3697526988356726052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3697526988356726052==--
