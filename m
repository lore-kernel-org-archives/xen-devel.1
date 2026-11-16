Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B62606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 21:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJ46xkcL
Received: from list by lists.xenproject.org with outflank-mailman.1491563.1692296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT46s-0000oS-Na; Mon, 16 Nov 2026 21:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491563.1692296; Mon, 16 Nov 2026 21:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT46s-0000oI-Kj; Mon, 16 Nov 2026 21:19:30 +0000
Received: by outflank-mailman (input) for mailman id 1491563;
 Mon, 16 Nov 2026 21:19:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xT46r-0000nq-Bv
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 21:19:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT46q-00FkWp-Kk
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 22:19:28 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afb7319-e002-0a2a0a5209dd-0a2a4504ae38-30
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 22:19:28 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afb735e-b57f-0a2a45040019-aceafc1f9f2e-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 22:19:27 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D74FF41804;
 Mon, 16 Nov 2026 21:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19F01F000C4;
 Mon, 16 Nov 2026 21:19:23 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794863965;
	bh=r+aIJPrcv/6jqNiqvoDZbj0ty6chj9nLzftqu/jVFF8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=lJ46xkcLMEGO0f5T0uxLO4DA/YmS9sR1nrlVFW8glYqiwpgaSA7k8j+vrq6BWa9iZ
	 uTYiRqok1/JliQsEAcIGEgMjn0l6bU9yeoUyna3CtRDhuDuWgHIHbtePzJErc9L6Nf
	 6xp9g0yaa94sphClL5PDusJeVTlhm4v+WRFkafBFQVz5yN/isCzQ5wp2QyO0PpgZt2
	 6/EaialiKpr1dfnq1E3A34fOM5t9cK8F/gZWYhd03HheR5STZpb8q0Nf+T34a4L+5j
	 GG5IxbOarzhVbil2fr5MR2HqpPSFGNyDk2G+oqiFhMikOnpzAhvo4BEYJjoDH9yUWN
	 Rt3pzVjakVt1Q==
Date: Mon, 16 Nov 2026 13:19:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Julian Vetter <julian.vetter@vates.tech>
cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, qemu-devel@nongnu.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] hw/xen: Mark legacy Xen backends as hotpluggable
In-Reply-To: <1794814281.8631fc262581453bbf619ec5b2062170.1a1e34487400006d3f@vates.tech>
Message-ID: <552c4efb-3108-1259-9aa1-acc404b6bed7@kernel.org>
References: <20261116-qemu-xen-usb-v1-1-bff36d5b646b@nxp.com> <1794814281.8631fc262581453bbf619ec5b2062170.1a1e34487400006d3f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ebf023/1794863968-C3AC0B50-0DC64FC2/0/0
X-purgate-type: clean
X-purgate-size: 1396
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026, Julian Vetter wrote:
> On 11/16/26 03:56, Peng Fan (OSS) wrote:
> 
> > diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> > index 7977b527127..bf4396c9460 100644
> > --- a/hw/xen/xen-legacy-backend.c
> > +++ b/hw/xen/xen-legacy-backend.c
> > @@ -640,6 +640,13 @@ static void xendev_class_init(ObjectClass *klass, const void *data)
> >       DeviceClass *dc = DEVICE_CLASS(klass);
> >   
> >       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> > +    /*
> > +     * Legacy Xen backends are created and destroyed dynamically from
> > +     * xenstore at runtime, after the machine has been initialized.
> > +     * TYPE_DYNAMIC_SYS_BUS_DEVICE marks devices as not hotpluggable,
> > +     * so override that here.
> > +     */
> > +    dc->hotpluggable = true;
> >       dc->bus_type = TYPE_XENSYSBUS;
> >   }
> >   
> 
> This also fixes the legacy vfb/vkbd backends with -machine xenpv 
> (qemu-system-i386 -xen-attach -machine xenpv -vga xenfb) on an arm64 Xen 
> 4.21 host. Without this fix QEMU exits with "Device 'xen-backend' does 
> not support hotplugging" as soon as the backends are created from 
> xenstore. Tested on top of QEMU 10.1.0 with an arm64 Debian 13 guest 
> (xen-fbfront/xen-kbdfront).
> 
> Tested-by: Julian Vetter <julian.vetter@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

