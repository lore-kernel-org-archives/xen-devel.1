Return-Path: <SRS0=A7jt=LJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B84C48BDF
	for <xen-devel@archiver.kernel.org>; Tue, 15 Jun 2021 04:12:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF00D6140D
	for <xen-devel@archiver.kernel.org>; Tue, 15 Jun 2021 04:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF00D6140D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.141879.261949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt0R7-0008Fx-Lk; Tue, 15 Jun 2021 04:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141879.261949; Tue, 15 Jun 2021 04:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt0R7-0008Fq-I0; Tue, 15 Jun 2021 04:12:25 +0000
Received: by outflank-mailman (input) for mailman id 141879;
 Tue, 15 Jun 2021 04:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=62sT=LJ=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lt0R5-0008ED-7C
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 04:12:23 +0000
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05d75952-88cc-43bc-96f8-5116b466ac55;
 Tue, 15 Jun 2021 04:12:22 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id d196so35582471qkg.12
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jun 2021 21:12:22 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181])
 by smtp.gmail.com with ESMTPSA id h12sm11014027qtn.44.2021.06.14.21.12.20
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 21:12:21 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id 93so10257961qtc.10
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jun 2021 21:12:20 -0700 (PDT)
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
X-Inumbo-ID: 05d75952-88cc-43bc-96f8-5116b466ac55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YDA/6rYFbIzGwN3DJJ3v30Ilg60B464lccTuq9RZZyA=;
        b=fMG07OU4hKhOT0Ejr3qOHcrU08EN3G1+RpniZ8liKpsJESj8tYmvpPMQZbf905Arqa
         jTNjk7/cw8NTc05aXCrTOb4W4H63TAdnEqedfWvkUqde8aQCNzpKVfF+WTvNV5ptv2qS
         TsIum45Bdbkm1pBXJPvJDobZEXMxEtOKj24Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YDA/6rYFbIzGwN3DJJ3v30Ilg60B464lccTuq9RZZyA=;
        b=LxcUUqD0dkI3B55dkNuH608U9NIZyLZrASDEna64bSYRHE1WpnIC712fipHgYf6Vsq
         A8z+yOtqa5qo5xTmPgcKRdy00zD0SevDagxgdEuutdc6AMhZfL9bRju5lp3nsX0t8OXX
         tCxUgSUMAQ3iVVTtQMiEafvPxkGsWhRpK3WGtRay4Qd4/b9CoOXoCLrqkfp4/GTTOco/
         rn28ybVBrxYIhxsKQz1ycCC7Er2hXlSF8DSPNlIIy9xfjki/2CP31GWL+vVTDgTXpMC0
         EwzbtbunSttX/k1kg9iek6Ycu/m4wAQK8XGkK3DAf0vbsJM6RlgaYGYGxpKQvQg3QV4B
         2PZw==
X-Gm-Message-State: AOAM531LSRgxqCsiw8olkPVg274OqOOaBNtP/Bn1kT7JgdBiYhgrRT/R
	Qr1lb9ybJq2PAYg3pqJslmABaE3ZU3nMhg==
X-Google-Smtp-Source: ABdhPJw1tsthZg+CGVRrKfhuqpknIqA2AIzt9ELS+wdJnbKf9WsA8tZO3gF8aSYMvGcgHTHXpNFcYw==
X-Received: by 2002:ae9:c218:: with SMTP id j24mr20030695qkg.94.1623730341641;
        Mon, 14 Jun 2021 21:12:21 -0700 (PDT)
X-Received: by 2002:a02:384b:: with SMTP id v11mr19686288jae.90.1623729977741;
 Mon, 14 Jun 2021 21:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152659.2142983-1-tientzu@chromium.org>
 <20210611152659.2142983-2-tientzu@chromium.org> <20210614061644.GA28343@lst.de>
In-Reply-To: <20210614061644.GA28343@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 15 Jun 2021 12:06:06 +0800
X-Gmail-Original-Message-ID: <CALiNf29cE-T7xf+nUZF2pjT8osaXj+wb4MibtdSkAU_K13wuMw@mail.gmail.com>
Message-ID: <CALiNf29cE-T7xf+nUZF2pjT8osaXj+wb4MibtdSkAU_K13wuMw@mail.gmail.com>
Subject: Re: [PATCH v9 01/14] swiotlb: Refactor swiotlb init functions
To: Christoph Hellwig <hch@lst.de>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, sstabellini@kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com, 
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk, 
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
	Jianxiong Gao <jxgao@google.com>, joonas.lahtinen@linux.intel.com, 
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	matthew.auld@intel.com, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 14, 2021 at 2:16 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Jun 11, 2021 at 11:26:46PM +0800, Claire Chang wrote:
> > +     spin_lock_init(&mem->lock);
> > +     for (i = 0; i < mem->nslabs; i++) {
> > +             mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
> > +             mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
> > +             mem->slots[i].alloc_size = 0;
> > +     }
> > +
> > +     if (memory_decrypted)
> > +             set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
> > +     memset(vaddr, 0, bytes);
>
> We don't really need to do this call before the memset.  Which means we
> can just move it to the callers that care instead of having a bool
> argument.
>
> Otherwise looks good:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks for the review. Will wait more days for other reviews and send
v10 to address the comments in this and other patches.

