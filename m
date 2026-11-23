Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B30A606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=tklengyel.com header.i=@tklengyel.com header.a=rsa-sha256 header.s=zmail header.b=HKvW96wE
Received: from list by lists.xenproject.org with outflank-mailman.1500418.1696588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVU8R-0005sK-HR; Mon, 23 Nov 2026 13:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500418.1696588; Mon, 23 Nov 2026 13:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVU8R-0005sD-Cr; Mon, 23 Nov 2026 13:31:07 +0000
Received: by outflank-mailman (input) for mailman id 1500418;
 Mon, 23 Nov 2026 13:31:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tamas@tklengyel.com>) id 1xVU8P-0005s2-A8
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 13:31:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVU8O-000mQd-Md
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 14:31:04 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tamas@tklengyel.com>)
 id 6b044006-8faa-0a2a0a5109dd-0a2a4504a32a-34
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:31:04 +0100
Received: from [165.173.180.12] (helo=sender6-op-o12.zoho.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tamas@tklengyel.com>)
 id 6b044016-b57f-0a2a45040019-a5adb40c438a-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:31:03 +0100
Received: by smtp.zohomail.com with SMTPS id 1795440655584978.1853562359693;
 Mon, 23 Nov 2026 05:30:55 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-483a66818edso1818096fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 05:30:55 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zmail header.d=tklengyel.com header.i="@tklengyel.com" header.h="Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Subject:To"
ARC-Seal: i=1; a=rsa-sha256; t=1795440659; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I+1eJzWRMlckTAVeCi1rKlGDPJtLRfq2n4J2rxeD7WpI48n9jiVJGi1xbv3tcoXqew6N0181imOPZckhOODUEkEySlxcH2ZIo8533hXzXI8E+aSOreXO+AoohIbSQVXqOShLx032EV0ZURbKmCj4R7Is5qI0HqoglGHyNf+Y5hM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795440659; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Jx2fDvn6M7gyopzeyprlj9vgeulRtIPP8pE+WzwAzCg=; 
	b=HFL6bTm1lEhoyCSERPLeDP9gB+XfKQ1y7YEmXx7wpL9L3T2VZTSbiqZJiqKQ3WTcwj/2w859pjPB/5+1LFKl3C5c7m9lKKDdA8pg9m4rDyrIkYXdjAg2E+AJN+BtaNsQ3SmoPedSdmzlNwGA49V/kFCM7gv+VEg081gJE4vBDu8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: a=rsa-sha256; b=HKvW96wEoPypJVySM2JYSwa5MplvnzG/Ju48/Aj/StJZa+PalCjmpGGubIIcrpb7lPvIFVBcB4+NuOEHEmNi3mkpH9YqvgenvOSnWGjhgVNRuyPkQ/U5YT3xfap+VCUHivuioBbnmjF/xqRUpwF0GfChP+rogqVs28jER87oIaI=; c=relaxed/relaxed; s=zmail; d=tklengyel.com; v=1; bh=Jx2fDvn6M7gyopzeyprlj9vgeulRtIPP8pE+WzwAzCg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
X-Gm-Message-State: APuU4Z9m1k8RDF029TKe146ndelQO7y6qaF24oIJRGjqUrJX0NvORFx+
	HMfYegtdGB+gszG2GrlWXlh38vlfXjmb3Pi7IGaGlVHO6TNpgLM/2y5pUI3zn7OyDNIlEnqdTBt
	iOizZSTLiqZQRnK21eNETYeRoH+U1SjA=
X-Received: by 2002:a05:6870:2c8a:b0:4b7:3a4e:e66a with SMTP id
 586e51a60fabf-4bc8386b8demr10295478fac.34.1795440654254; Mon, 23 Nov 2026
 05:30:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123040805.23963-1-ml@icedev.pl>
In-Reply-To: <20261123040805.23963-1-ml@icedev.pl>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 23 Nov 2026 08:30:18 -0500
X-Gmail-Original-Message-ID: <CABfawh=vhTviM-dd3y-qqTHbpEDtj1oy3baZNNFmF7cM6LZRsQ@mail.gmail.com>
X-Gm-Features: Aa3M54o3hjqbpDk0S6Cc2q5SW-hG3tNCXEcNha8tdaDp71xUPMYBxGCJppAOnUQ
Message-ID: <CABfawh=vhTviM-dd3y-qqTHbpEDtj1oy3baZNNFmF7cM6LZRsQ@mail.gmail.com>
Subject: Re: [PATCH] x86/p2m: don't request mapcache invalidation for altp2m removals
To: =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <ml@icedev.pl>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: multipart/alternative; boundary="00000000000069889a0660f19a39"
X-purgate-ID: tlsNG-ebf023/1795440664-53EC6B50-4028125F/0/0
X-purgate-type: clean
X-purgate-size: 4313
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--00000000000069889a0660f19a39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:08=E2=80=AFPM Micha=C5=82 Leszczy=C5=84ski <ml@i=
cedev.pl> wrote:

> From: Micha=C5=82 Leszczy=C5=84ski <ml@icedev.pl>
>
> Since commit 588d961d15d1, p2m_remove_entry() requests a mapcache
> invalidation for every removal, including altp2m entries removed via
> p2m_change_altp2m_gfn(). Device models map guest memory through the
> host p2m, so such removals cannot leave them with stale mappings.
>
> When the request is issued by another domain, every vCPU of the guest
> synchronously broadcasts IOREQ_TYPE_INVALIDATE on its next hypercall.
> DRAKVUF triggers this whenever it removes the last breakpoint from a
> page.
>
> This was measured on Xen 4.22.0 with QEMU 9.1 and a 2-vCPU Windows 10
> guest, benchmarking a dummy application which calls NtCreateFile in a loo=
p
> while DRAKVUF's filetracer plugin is tracing those calls. On every such
> syscall entry, the plugin places a temporary trap on the return address,
> to be able to observe syscall's return value. The trap is removed after
> the observation is made. Thus, every syscall translates to altp2m entry
> addition and removal under this benchmark scenario.
>
> Without this change, each traced call took about 8.1 ms.
> With patch it goes down to about 0.19 ms (~43 times faster!)
>
> Only request the invalidation for the host p2m.
>
> Fixes: 588d961d15d1 ("IOREQ: refine when to send mapcache invalidation
> request")
> Backport: 4.15+
> Signed-off-by: Micha=C5=82 Leszczy=C5=84ski <ml@icedev.pl>


Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

It's great to see you still working on Xen & DRAKVUF! :)

Cheers,
Tamas

--00000000000069889a0660f19a39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 22,=
 2026 at 11:08=E2=80=AFPM Micha=C5=82 Leszczy=C5=84ski &lt;<a href=3D"mailt=
o:ml@icedev.pl">ml@icedev.pl</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Micha=C5=82 Leszczy=C5=84ski &lt;<a href=
=3D"mailto:ml@icedev.pl" target=3D"_blank">ml@icedev.pl</a>&gt;<br>
<br>
Since commit 588d961d15d1, p2m_remove_entry() requests a mapcache<br>
invalidation for every removal, including altp2m entries removed via<br>
p2m_change_altp2m_gfn(). Device models map guest memory through the<br>
host p2m, so such removals cannot leave them with stale mappings.<br>
<br>
When the request is issued by another domain, every vCPU of the guest<br>
synchronously broadcasts IOREQ_TYPE_INVALIDATE on its next hypercall.<br>
DRAKVUF triggers this whenever it removes the last breakpoint from a<br>
page.<br>
<br>
This was measured on Xen 4.22.0 with QEMU 9.1 and a 2-vCPU Windows 10<br>
guest, benchmarking a dummy application which calls NtCreateFile in a loop<=
br>
while DRAKVUF&#39;s filetracer plugin is tracing those calls. On every such=
<br>
syscall entry, the plugin places a temporary trap on the return address,<br=
>
to be able to observe syscall&#39;s return value. The trap is removed after=
<br>
the observation is made. Thus, every syscall translates to altp2m entry<br>
addition and removal under this benchmark scenario.<br>
<br>
Without this change, each traced call took about 8.1 ms.<br>
With patch it goes down to about 0.19 ms (~43 times faster!)<br>
<br>
Only request the invalidation for the host p2m.<br>
<br>
Fixes: 588d961d15d1 (&quot;IOREQ: refine when to send mapcache invalidation=
 request&quot;)<br>
Backport: 4.15+<br>
Signed-off-by: Micha=C5=82 Leszczy=C5=84ski &lt;<a href=3D"mailto:ml@icedev=
.pl" target=3D"_blank">ml@icedev.pl</a>&gt;</blockquote><div><br></div><div=
>Reviewed-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">ta=
mas@tklengyel.com</a>&gt;</div><div><br></div><div>It&#39;s great to see yo=
u still working on Xen &amp; DRAKVUF! :)</div><div><br></div><div>Cheers,</=
div><div>Tamas=C2=A0</div></div></div>

--00000000000069889a0660f19a39--

