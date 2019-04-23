Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39029C10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 18:37:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 079652183E
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 18:37:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lq8kmrD5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 079652183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJ0IE-0004BP-8h; Tue, 23 Apr 2019 18:37:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kNGF=SZ=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJ0ID-0004BD-8A
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 18:37:21 +0000
X-Inumbo-ID: d38ac61e-65f6-11e9-92d7-bc764e045a96
Received: from mail-vs1-xe41.google.com (unknown [2607:f8b0:4864:20::e41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d38ac61e-65f6-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 18:37:19 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id t23so8871822vso.10
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2019 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7pDLkQsU5ChbVPNIBc3HKQ1ddo9hYb9nzcdvFPGL6O8=;
 b=lq8kmrD5mUmYtMVyII9+dkhvN0t0bKfkgS2Gj/zCxVR23hMqtM7xKRrfNaGkCZ9Sk8
 7Soj6J02f1VKZdjtxtwd6vJfI0xdy4U9qwAc1M8KgHe8tGa40+Eme21Otm64VKnx197K
 Ov2O0GN4Ehv97cqZu+tdcfkw76VA1VC+c/wKY9/C0lMm0LDo33bF1eurJzzgZXWelOYH
 8LTb6fwH9ZAXkIQx1GFlLNcf94rQedfHp4PiWrcKuU66kgUjoNdtmXmXea0XWjibe0xd
 QEIDEJx5zM1woUz1/1nw8ezU3W/acwmpPDXUa7buFTRND0nYDzRuUgCIwslqsho06ScQ
 RMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7pDLkQsU5ChbVPNIBc3HKQ1ddo9hYb9nzcdvFPGL6O8=;
 b=n1hJys6tqqHWW8An9ev+vmsLGKWDmFS1ktLd9xn2lcDLLFwt2SbDoyb4lKXeZEUZzb
 Pvq+f48M2EBSnKsRZYE5OC9E89c3RwyPTjIzQosKE+WeAaNQ4iUOZwcXsSBBrcr4u5uE
 cDvLcZ5PGAqgQlbYxBs1HkIaW96C8h9F6w4GQJL4CB5fs7Fk4Y+3vZrePFS7iO1UXMsy
 PKT9R+hvlugAbTgyjbLVMlgpz69YwMc/pZbO+CCg5OLmWztAQTOMl6Comh+wwuVay8Qh
 KoGXDWW3E4BXNwOfUQ8G5+oku7vZ96Fr5TdFH8CoR+QYC9SJ15zuLP3pE1j1ZifKq71K
 29gA==
X-Gm-Message-State: APjAAAWMq94DiixmPGC4qEuvZeOlPToTNZw9wfA0qFZLSLGWb1kiobMU
 jcSIS3GSBI3vUT5hrerTs8iIMwApvEpzlz0afbs=
X-Google-Smtp-Source: APXvYqxGGCmJz83M0D/BCd/GgR5gM2YlssW7DofRZuERAC+UsoH3Q7pFBtHxRAZlqlDh5swmxXs0nwbsd1hD/SHkmfw=
X-Received: by 2002:a67:e83:: with SMTP id 125mr2893230vso.35.1556044639231;
 Tue, 23 Apr 2019 11:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-5-git-send-email-sstabellini@kernel.org>
 <96e6defa-5c7b-81e2-a85e-f02884f339fb@arm.com>
 <alpine.DEB.2.10.1904221531470.1370@sstabellini-ThinkPad-X260>
 <811a9368-c6c6-a4ae-1101-f4aac16adc7b@arm.com>
 <alpine.DEB.2.10.1904231028540.24598@sstabellini-ThinkPad-X260>
In-Reply-To: <alpine.DEB.2.10.1904231028540.24598@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@gmail.com>
Date: Tue, 23 Apr 2019 19:37:05 +0100
Message-ID:
 <CAF3u54CD7O0swVyTwMshxUhxnLg56=iF9S1xb5vKjuZq-F9BKQ@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [PATCH 5/6] xen/arm: map reserved-memory regions as
 normal memory in dom0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, nd <nd@arm.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: multipart/mixed; boundary="===============4662224523791714464=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423183705.8SjKVBU3dT7PTy5pSizqWb15ub-xVAS33L9dcsz1mtY@z>

--===============4662224523791714464==
Content-Type: multipart/alternative; boundary="000000000000f9f97d058736dfb0"

--000000000000f9f97d058736dfb0
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Tue, 23 Apr 2019, 18:34 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Tue, 23 Apr 2019, Julien Grall wrote:
> > Hi Stefano,
> >
> > On 4/22/19 11:42 PM, Stefano Stabellini wrote:
> > > On Tue, 26 Feb 2019, Julien Grall wrote:
> > > I am not sure about the suggestion of re-using the libfdt concept of
> > > "mem_rsv", which is meant to be for the old /memreserve/. Today, libfdt
> > > (at least our version of it) is not able to parse the new
> > > reserved-memory bindings. I don't think it is a good idea to modify
> > > libfdt for that. Also, the way we want to handle the old memreserve
> > > regions is quite different from the way we want to handle
> > > reserved-memory, right? I cannot see a way to improve this code using
> > > mem_rsv at the moment.
> >
> > I didn't mean to extend mem_rsv in libfdt but extend consider_modules and
> > dt_unreserved_regions to deal with /reserved-memory. Otherwise you
> > may miss some cases (for instance you left out discard_initial_modules).
> >
> > By extending those two functions you don't have to teach everyone how to
> skip
> > /reserved-memory.
>
> I think I get your point now. Although I don't think it should be
> correct for a bootloader to use a reserved-memory area to store a boot
> module, I wouldn't be suprised if that happens, so it is better to be
> prepared and extend dt_unreserved_regions. I'll do that.
>

Why wouldn't this be correct? It is nothing different /mem-reserve.


> However, we would still need something like check_reserved_memory,
> because we don't want setup_xenheap_mappings to be called on the
> reserved-memory area (or a memory region including the reserved memory
> area) in setup_mm. I don't think we can get away without it, but I can
> simplify it.
>

Hmmm, setup_xenheap_mappings is only doing the mapping in page-tables
allowing direct access in Xen. Are you worried of the memory attributes to
be different in Xen?

This would makes sense however setup_xenheap_mappings may still map the
reserved-memory because it is using 1G mapping... This is pretty wrong and
I have patches that should help to fix it.

 Also if you are concerned with /reserved-memory, then it should also be
fixed for /mem-reserve as they are not different. However, this may break
free_initmem as because we try to give back page to xenheap even if they
are reserved.

 The memory management is quite a mess today. I hope to make it better with
my upcoming series.

Cheers,

--000000000000f9f97d058736dfb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Sorry for the formatting.<br><br><div class=3D"gmail_quote" dir=3D"auto"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 23 Apr 2019, 18:34 Stefano S=
tabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 23 Apr =
2019, Julien Grall wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; On 4/22/19 11:42 PM, Stefano Stabellini wrote:<br>
&gt; &gt; On Tue, 26 Feb 2019, Julien Grall wrote:<br>
&gt; &gt; I am not sure about the suggestion of re-using the libfdt concept=
 of<br>
&gt; &gt; &quot;mem_rsv&quot;, which is meant to be for the old /memreserve=
/. Today, libfdt<br>
&gt; &gt; (at least our version of it) is not able to parse the new<br>
&gt; &gt; reserved-memory bindings. I don&#39;t think it is a good idea to =
modify<br>
&gt; &gt; libfdt for that. Also, the way we want to handle the old memreser=
ve<br>
&gt; &gt; regions is quite different from the way we want to handle<br>
&gt; &gt; reserved-memory, right? I cannot see a way to improve this code u=
sing<br>
&gt; &gt; mem_rsv at the moment.<br>
&gt; <br>
&gt; I didn&#39;t mean to extend mem_rsv in libfdt but extend consider_modu=
les and<br>
&gt; dt_unreserved_regions to deal with /reserved-memory. Otherwise you<br>
&gt; may miss some cases (for instance you left out discard_initial_modules=
).<br>
&gt; <br>
&gt; By extending those two functions you don&#39;t have to teach everyone =
how to skip<br>
&gt; /reserved-memory.<br>
<br>
I think I get your point now. Although I don&#39;t think it should be<br>
correct for a bootloader to use a reserved-memory area to store a boot<br>
module, I wouldn&#39;t be suprised if that happens, so it is better to be<b=
r>
prepared and extend dt_unreserved_regions. I&#39;ll do that.<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Why wouldn&#39;=
t this be correct? It is nothing different /mem-reserve.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
However, we would still need something like check_reserved_memory,<br>
because we don&#39;t want setup_xenheap_mappings to be called on the<br>
reserved-memory area (or a memory region including the reserved memory<br>
area) in setup_mm. I don&#39;t think we can get away without it, but I can<=
br>
simplify it.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Hmmm, setup_xenheap_mappings is only doing the mapping in page-=
tables allowing direct access in Xen. Are you worried of the memory attribu=
tes to be different in Xen?</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">This would makes sense however setup_xenheap_mappings may still map the=
 reserved-memory because it is using 1G mapping... This is pretty wrong and=
 I have patches that should help to fix it.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">=C2=A0Also if you are concerned with /reserved-memory, =
then it should also be fixed for /mem-reserve as they are not different. Ho=
wever, this may break free_initmem as because we try to give back page to x=
enheap even if they are reserved.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">=C2=A0The memory management is quite a mess today. I hope to make=
 it better with my upcoming series.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Cheers,</div></div>

--000000000000f9f97d058736dfb0--


--===============4662224523791714464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4662224523791714464==--

