Return-Path: <SRS0=0mHu=7D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CCAC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 20:18:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019AE207D3
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 20:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljg05M5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019AE207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbrdY-0006Wi-Gc; Thu, 21 May 2020 20:17:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSRu=7D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jbrdW-0006Wb-Sr
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 20:17:50 +0000
X-Inumbo-ID: 2493e17a-9ba0-11ea-b9cf-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2493e17a-9ba0-11ea-b9cf-bc764e2007e4;
 Thu, 21 May 2020 20:17:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z72so7714884wmc.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=huWgXpbDzdljKw3GvlKFMkS9v32YlszvZUodY9Vu2AM=;
 b=ljg05M5aahcskGiy83jjBBWZfs2xI5NxpP4k2fna2chn8rGXb6cpKB3Ef+xrCKF9yn
 fQC/P/qaZ+2l4SQYIMEb6qRa2UXz12dYEOnRQiH85v1UTuSC4oBFApfWrfv4jSTQp6P2
 yoDl/ib6de/OZOfk7HfYqAUJjl1/u8UWS/W/QSGfCiDmKzeNUB/Z8Ib6P50jRUSQVjDM
 YPfTI5HF8oUlAEgikI2fUumFbbtOfwWNlHE++B0GUji8XWMBv5r+YmHiQ+N90tOpsCSv
 TYp8Gv596H0ws+AtWZyXGaNYXCgld6k3Tm8qzgYs52/rlQa/zjGouo+MPG/6WsSbm+SO
 rogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=huWgXpbDzdljKw3GvlKFMkS9v32YlszvZUodY9Vu2AM=;
 b=ofFyfsug6m9yr7bH9/lIddjw2sidvvdCxcAwUVtraOXjK2Z+9w/OWaoj+C6x8VEQ0u
 9zLwOIdMtdE+fgGjiFrHuuKKD9vetvXLQs0XFskx6yMTDCH63dZr1VuYzb4k1mO98jl9
 d28bZ0eZvGTuZ9aio5DlcNN1UBHdvsZMGDeDuzAJm23hAf2zsiJ02MRxX4zhYCN7M/t7
 CtlU9Zlo5DhRrKHWrLuHIYPdd7JN/f6LoC6xERzUWnVzuYglDwo9HfGKeoAV1yoVlzTQ
 IsCFzmmE1iCqCCP2VMwWW65IoOujwmjL1Q24JJcvgU6ay7A0TdBwJcGBLxGcRQum4k8B
 2cIA==
X-Gm-Message-State: AOAM532HDBPeuIGGW1kzbuqDNmZ/MTij8nX7lNfhKEl9qUO0PqLbLcTT
 LKlrBr5NKUNR6zEzlA5yi6FVHwHFEhzT0EyBwcc=
X-Google-Smtp-Source: ABdhPJwFCX6ZTfZC+CYhpgpI3DM3w4YWTm9Ir6r9l2PdlZuiYiDYb0T2GXm6T8zhCVnCb/vwD8/q+rFFDW8SaepTFM4=
X-Received: by 2002:a7b:cf05:: with SMTP id l5mr10778996wmg.100.1590092269456; 
 Thu, 21 May 2020 13:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-9-sstabellini@kernel.org>
 <83c1120f-fe63-dc54-7b82-15a91c748de8@xen.org>
 <alpine.DEB.2.21.2005211247461.27502@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2005211247461.27502@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 21 May 2020 21:17:38 +0100
Message-ID: <CAJ=z9a24gHgS1yrpzLmW35zPSR6F6NUvYJUyJ9p1+oLp7THD8w@mail.gmail.com>
Subject: Re: [PATCH 09/10] xen/arm: introduce phys/dma translations in
 xen_dma_sync_for_*
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 21 May 2020 at 21:08, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Thu, 21 May 2020, Julien Grall wrote:
> > > @@ -97,8 +98,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
> > >                        phys_addr_t phys,
> > >                        dma_addr_t dev_addr)
> > >   {
> > > -   unsigned int xen_pfn = XEN_PFN_DOWN(phys);
> > > -   unsigned int bfn = XEN_PFN_DOWN(dev_addr);
> > > +   unsigned int bfn = XEN_PFN_DOWN(dma_to_phys(dev, dev_addr));
> > >             /*
> > >      * The swiotlb buffer should be used if
> > > @@ -115,7 +115,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
> > >      * require a bounce buffer because the device doesn't support coherent
> > >      * memory and we are not able to flush the cache.
> > >      */
> > > -   return (!hypercall_cflush && (xen_pfn != bfn) &&
> > > +   return (!hypercall_cflush && !pfn_valid(bfn) &&
> >
> > I believe this change is incorrect. The bfn is a frame based on Xen page
> > granularity (always 4K) while pfn_valid() is expecting a frame based on the
> > Kernel page granularity.
>
> Given that kernel granularity >= xen granularity it looks like it would
> be safe to use PFN_DOWN instead of XEN_PFN_DOWN:
>
>   unsigned int bfn = PFN_DOWN(dma_to_phys(dev, dev_addr));

Yes. But is the change worth it though? pfn_valid() is definitely
going to be more expensive than the current check.

Cheers,

