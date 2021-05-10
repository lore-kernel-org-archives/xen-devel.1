Return-Path: <SRS0=a6zz=KF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C411CC433B4
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 10:02:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 760D661360
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 10:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 760D661360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.125141.235593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg2jY-0000SM-Pl; Mon, 10 May 2021 10:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125141.235593; Mon, 10 May 2021 10:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg2jY-0000SF-Mp; Mon, 10 May 2021 10:01:52 +0000
Received: by outflank-mailman (input) for mailman id 125141;
 Mon, 10 May 2021 10:01:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NcLl=KF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lg2jX-0000S9-TJ
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 10:01:51 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de84b93b-fc1a-4620-91fe-2dc0e3e85d62;
 Mon, 10 May 2021 10:01:51 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id lp4so9460074pjb.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 03:01:51 -0700 (PDT)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com.
 [209.85.210.171])
 by smtp.gmail.com with ESMTPSA id ge4sm10944817pjb.4.2021.05.10.03.01.49
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 03:01:49 -0700 (PDT)
Received: by mail-pf1-f171.google.com with SMTP id 10so13396307pfl.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 03:01:49 -0700 (PDT)
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
X-Inumbo-ID: de84b93b-fc1a-4620-91fe-2dc0e3e85d62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FsG0kiz0NRABZofCxSQspiIrXqavy4umxXhfkY+/Sxk=;
        b=W+HYriAR9Do/fBW2QstFckigQIl1nRoVqh8kV8zVcpd71XHdedwgr9ODHG4afQkOIy
         ynwXu3yhnIcmMABVDj/QNeRt0F7V/f3la3pyVX+S+CEgEQdWOUMw7w57whXmk3tKqZQ+
         S7fuzxNEGgGmhiunD9+8473p2BUhLcDS4p74Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FsG0kiz0NRABZofCxSQspiIrXqavy4umxXhfkY+/Sxk=;
        b=UyoRQsKjY2gDGBXEHmGpJD7fNNe5LHLrNevr45ZMQYC5W3S6I76ze88k2VfkidRJZA
         TYfApj7xUae/wP/wZr9e5DIurQBPuiynDJC5eNpEeOySre62rhZthg61ELm8XPkpwfyd
         1aU1EXO+NW7m88JbkFcAflenJXgtxnokG4DJRBNPzzU4/FCfAdqP/8cvNYCUTmWOS+hX
         McJyGqoZGwF1+aIWtQnTgIvbpMmxakE/aubMtUPbwl2DmwWGH+8mStcHo44bl4wo5IVx
         MTeyGgARj5xfGC43hneBO8i6OtEJwmSVIQykUytVwPwofS3R27RKc5MDMo5zC+UrcCfA
         E81g==
X-Gm-Message-State: AOAM5332kqJ/x1XOKwQMeJkmNusJLBe0M7G4N3+qBmrwGYQ7MKlGe7h+
	CAKk8U8j3VhxsHftVX1/pkvCUaZgV4cn7A==
X-Google-Smtp-Source: ABdhPJzDBfEZ1SvnPnCnaP5armFLMJwRxiHEVqFZmtNXGp21NSRZKdUobwXS2WhR1dGfXjL8nvvZAA==
X-Received: by 2002:a17:902:ed93:b029:ed:5770:5e87 with SMTP id e19-20020a170902ed93b02900ed57705e87mr23544796plj.11.1620640909971;
        Mon, 10 May 2021 03:01:49 -0700 (PDT)
X-Received: by 2002:a92:6804:: with SMTP id d4mr20856971ilc.5.1620640447894;
 Mon, 10 May 2021 02:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Mon, 10 May 2021 17:53:57 +0800
X-Gmail-Original-Message-ID: <CALiNf2_h8r6jpd1JqTwNEmW22KK8aT9B4djLKkYP7Hhnju2EKw@mail.gmail.com>
Message-ID: <CALiNf2_h8r6jpd1JqTwNEmW22KK8aT9B4djLKkYP7Hhnju2EKw@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] Restricted DMA
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, 
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
	matthew.auld@intel.com, nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

v6: https://lore.kernel.org/patchwork/cover/1423201/

