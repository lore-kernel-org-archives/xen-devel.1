Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4421C531CF
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 13:31:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369133.1618053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmtWX-0002P6-Gg; Thu, 23 Jul 2026 13:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369133.1618053; Thu, 23 Jul 2026 13:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmtWX-0002Of-By; Thu, 23 Jul 2026 13:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1369133;
 Thu, 23 Jul 2026 13:12:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tomitamoeko@gmail.com>) id 1wmtE7-0007S3-FG
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 13:12:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmtE6-001xTZ-LS
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 15:12:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tomitamoeko@gmail.com>)
 id 6a621332-2eae-0a2a0a5409dd-0a2a450896da-38
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:12:38 +0200
Received: from [74.125.227.132] (helo=mail-pj2-f4.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tomitamoeko@gmail.com>)
 id 6a621345-f659-0a2a45080019-4a7de3849790-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:12:38 +0200
Received: by mail-pj2-f4.google.com with SMTP id
 98e67ed59e1d1-38111ea8a88so415964a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 06:12:38 -0700 (PDT)
Received: from ?IPV6:2408:820c:8ffa:c0f0:e439:d3f2:d7e2:d97a?
 ([2408:820c:8ffa:c0f0:e439:d3f2:d7e2:d97a])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13d1300401fsm21840163c88.3.2026.07.23.06.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 06:12:35 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784812356; x=1785417156; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e14oAFqp0QPnmbZkkpDTCbFv4Sax90xzZ/Ndu7Tq1tY=;
        b=YpdO8Qr6Ar8w5vwkNOpxxiOeQjNyobB8/InfVhTCw5gVPM2LhuDENichw4LRJZcoNs
         EO7TJQ2mHkOJtfSGNNqdZ+b0j285p6J8lsi9fpJ7zwJ6oqsoessbMYb8/4V+E4K5Qyxt
         Reb3ANl72i4GmVTyt6rGEgkCE9CrB6ZNwowmJG19Q3V3Q3qz9LOljxDIVjxxpPXwMOfE
         sIUvTZDtg/nsb9xjfw9BrSHGIRUDjFgHM80NaYMQgZS9Hb+A3rQrCF4f5AGkZli164ib
         rjGQOFq9zeIScc9rr53gOsdLWXtaY4v7klSWSK0MyLsbJe7cQwFfcVr0CEK+Njxunrhf
         yKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812356; x=1785417156;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e14oAFqp0QPnmbZkkpDTCbFv4Sax90xzZ/Ndu7Tq1tY=;
        b=tYeveDDLWXHa9CAzxewWfaAiSPeQWDwq6lIEbMLdanPxwmd8nOkZeuqm0VPYCdTScj
         XAa/wW5qLgEznNuGLfc36++Vf1biSbLRgGoDqUGUZ2WDwg7ItYAuhvJ5hfTyE3Xjnk/O
         ofvObNQni6yhMM9wCAh9qdE4Rqxabc/2amSyj4iaHEAUjZxU6CCNGcWSBy5umHzNQp7B
         CRa+luQQ7P3HlVJzv0rDIUbcUKmpRI6vbNFRsSj6HT/hvg73id568XeT0yfVHjqAdDxG
         m+ptOvM7dLhkcb2hAf+Ct5dAwXXWtzqS6h/3z4PJf8eIhT1YeYUGdsGmFcHBm6PDvbEx
         pBHg==
X-Forwarded-Encrypted: i=1; AHgh+RqSR7Mg79GeYtwgBnpYgCl93VR513owuJnMdt0ovR/WKPp1cz8/z80YPfaLSGtiI6tGVjb0+mNMLTo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywmm31RwdIV4NKq+k2viSMle50H+LD/NGFnGxRokz/ykUlYrFis
	z3OMfAsag0J7SVXqb7OMiHaOm1uCOLuErNCZgmqylrZUUewXi5H11gs=
X-Gm-Gg: AR+sD12+xrWj49KeJqCPF5kHTfsc3lDMu4yBFJibQuckGe1ub/n16NbjgLCxcFyOIAT
	WOyMvMd2ndCR1wahH7yDbNV/6TssrkTJ0eHouARQBert28Mi8qa50DrZyXs81f9HwOHYV4YHoqg
	lqOfkxPUAbQ2tUZ4H0n/jFer1/CDSG/Z+v59mfDXeYjmDIYkDXU4VmPjFLYz3VbJGJOcwUqKmbb
	JaTKwgnNPlSRkcsAbJ+Ol+EbaQfyE6VZxS5Og9olyi8uCfbaUYxIX5NvReU1Ts8qbTGbTYFTh5f
	jZ/0V8wE2qiaTERTOHEHtN38tG1C1r1HE/2nea0f6j3d6C/YcRNqZqOlSVJpJfn0BqMBT3ImOyE
	UqHHBdlqd23AIxu9TQ7w4ww1PlppAULwgG6Uz3XIu6JDXWMF0QlHnSsu8gmsPmhpMJ58U1SwZWo
	qYy2nS33VRE+IKu359dVol6rMYfqrNdGEcX/h297z5EX3xiU6ilkHM+rbp2yCI8jYx7hjP
X-Received: by 2002:a17:90a:c2ce:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-38ec65ed795mr3150984a91.27.1784812356230;
        Thu, 23 Jul 2026 06:12:36 -0700 (PDT)
Message-ID: <f722320f-205b-40d3-a727-753506ba5473@gmail.com>
Date: Thu, 23 Jul 2026 21:12:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/igd: don't register rom bar twice
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20260709183517.25866-1-brchuckz@aol.com>
 <20260709183517.25866-3-brchuckz@aol.com>
From: Tomita Moeko <tomitamoeko@gmail.com>
In-Reply-To: <20260709183517.25866-3-brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1784812358-CFED287B-3CDCEFC2/0/0
X-purgate-type: clean
X-purgate-size: 1886


On 2026-07-10 02:35, Chuck Zmudzinski wrote:
> This also fixes a failed assertion in pci [1] for Qemu
> version 10 and higher when passing through an Intel
> IGD with an option ROM to the guest.
>=20
> [1] f6fc01c ("hw/pci: Assert a bar is not registered multiple times")
>=20
> Fixes: 881213f ("xen, gfx passthrough: retrieve VGA BIOS to work")

Please follow the QEMU standard way to reference a commit
`<at-least-12-digits-of-SHA-commit-id> (=E2=80=9CFixed commit subject=E2=80=
=9D)`

https://www.qemu.org/docs/master/devel/submitting-a-patch.html#write-a-me=
aningful-commit-message

> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> Changes in v2:
>   - get 'pcibus_t romsize' instead of 'PCIIORegion region'
>   - move definition of romsize to the top of the function
>     and make it constant
>   - add stable to Cc list
>=20
> Changes in v3:
>   - fix Cc address for qemu-stable
>=20
>  hw/xen/xen_pt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 474606e..8b30b61 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -459,6 +459,7 @@ static int xen_pt_register_regions(XenPCIPassthroug=
hState *s, uint16_t *cmd)
>  {
>      int i =3D 0;
>      XenHostPCIDevice *d =3D &s->real_device;
> +    const pcibus_t romsize =3D s->dev.io_regions[PCI_ROM_SLOT].size;
> =20
>      /* Register PIO/MMIO BARs */
>      for (i =3D 0; i < PCI_ROM_SLOT; i++) {
> @@ -495,7 +496,7 @@ static int xen_pt_register_regions(XenPCIPassthroug=
hState *s, uint16_t *cmd)
>      }
> =20
>      /* Register expansion ROM address */
> -    if (d->rom.base_addr && d->rom.size) {
> +    if (!romsize && d->rom.base_addr && d->rom.size) {
>          uint32_t bar_data =3D 0;
> =20
>          /* Re-set BAR reported by OS, otherwise ROM can't be read. */


