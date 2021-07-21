Return-Path: <SRS0=fMu6=MN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EF6C12002
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jul 2021 18:39:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 696A360FF1
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jul 2021 18:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 696A360FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.159542.293410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6H7n-0001dr-Sx; Wed, 21 Jul 2021 18:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159542.293410; Wed, 21 Jul 2021 18:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6H7n-0001dk-P8; Wed, 21 Jul 2021 18:39:19 +0000
Received: by outflank-mailman (input) for mailman id 159542;
 Wed, 21 Jul 2021 18:39:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QDAX=MN=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1m6H7m-0001de-1D
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 18:39:18 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f078ee54-2b1d-4a68-be91-7fe2046525cd;
 Wed, 21 Jul 2021 18:39:17 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h9so4230194ljm.5
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 11:39:17 -0700 (PDT)
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
X-Inumbo-ID: f078ee54-2b1d-4a68-be91-7fe2046525cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XVG+jbRDBSu+eXxXtQp1KBYPh+7m/khOUuuf9tJsJlQ=;
        b=o0knBKRqF+/V/tbZpHxFHljIbk4FsvpfHxd1B4gIGEd6eXlgdOM3oy0vhGXit4qYj3
         Eau+h3HBB/pRHR7jWtV+eRigTywh20vgTGPLE+kHjvhHEv1ehZ01GA/4VF8wU23W+Ykv
         EAJaX4O9jgr3FMsTBKsz07UN/lmzQ6HdWBm6TBVUW892tdubZjbTaGBZjMx8ZAQYJ7cO
         SIVhMpC2buXAwwPSCIZ6N/RAcaDc5RF3LZMUFdeqUaD0NYg0nDfSDZZ7xZPyjVy6dWbV
         rhw5saUHGPTXtEGx/ZJc07ntkyzEClVwkS6wR2VacLMcAJDIjYQMxoqoQLbUfqU+ZYCH
         QWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XVG+jbRDBSu+eXxXtQp1KBYPh+7m/khOUuuf9tJsJlQ=;
        b=Ona1sji0HfuqtkAssl6Fwj209yovta+2DTcBBGT7wKrdZdgq9nMlpsbfmxJXjPTDVb
         xas9NHGNJMLGj0uxfkjjkP9POydyBXgdcBjMLqnLn/Lzzb7HFD5v/OlxJ5AKqG6fEa21
         t8SX9vwAS3hMmPHWIXXaB68qXZkVMppwwBgAVmxgcMfAMmaNMZAiJI67wDFWBopmEa3m
         1bvzJJpWmDieFLgBUkujP7Gx6WXCxfibvTU2qIe3b/kusmvRqU3rSWIRHCt4K5Ca9rIH
         6s10GF/8l2/lk0SF4yBBx9gNHrCR6stOkI/zyY3Zzy09HhJfddrmDTbhWZa6C4kiSCbI
         4Siw==
X-Gm-Message-State: AOAM530lYBUZWtwZ1mPNvT99C/Ibw83K9s2q7vMRyAXB1OaaAhxkBNWH
	rwi+qzDSONXztz7MryQJzzNAvbE7TR5fjhvhinw=
X-Google-Smtp-Source: ABdhPJwoLGwmM+TS2dyBgKCbp5Ry4yu+pA8iXsy3Lf/VOi5eurQ/S0y3MgQ+JBpzeMSSwEoknDX2czlo24N5L0fkqf8=
X-Received: by 2002:a2e:890f:: with SMTP id d15mr31953878lji.37.1626892756146;
 Wed, 21 Jul 2021 11:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210715170011.GA17324@lst.de> <20210716083934.154992-1-rm.skakun@gmail.com>
 <20210716093551.GA17981@lst.de> <CADu_u-OYA+Z_y-DBLxyUYGhmLVMtLggmZ_SnRiEtw9EGrO4oGg@mail.gmail.com>
 <alpine.DEB.2.21.2107160828430.3916@sstabellini-ThinkPad-T480s>
 <CADu_u-Psn5QpOyZ18_NCPx14DYxmGmSqVod=_RBC3A_A93tGUw@mail.gmail.com> <20210719092235.GA31566@lst.de>
In-Reply-To: <20210719092235.GA31566@lst.de>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Wed, 21 Jul 2021 21:39:05 +0300
Message-ID: <CADu_u-OVTGFpDw9cP+VHMAW8fdG3mtMZDCG3Tu92fF286zVFDA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
To: Christoph Hellwig <hch@lst.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Andrii Anisov <andrii_anisov@epam.com>, 
	Roman Skakun <Roman_Skakun@epam.com>, Roman Skakun <rm.skakun@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> Fine with.  I've queued up the modified patch.

Good. Thanks!

>
> On Sat, Jul 17, 2021 at 11:39:21AM +0300, Roman Skakun wrote:
> > > We can merge this patch and create a new one for
> > > xen_swiotlb_free_coherent() later.
> > > Yeah, no worries, I didn't know that exposing dma_common_vaddr_to_page
> > > was problematic.
> > >
> > > This patch is fine by me.
> >
> > Good. I'm agreed too. Waiting for Christoph.
>
> Fine with.  I've queued up the modified patch.



--
Best Regards, Roman.

