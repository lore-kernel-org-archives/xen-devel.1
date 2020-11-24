Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FDCC2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8963B206F7
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMRMh73o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8963B206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36682.68694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcHL-0000Wp-O5; Tue, 24 Nov 2020 17:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36682.68694; Tue, 24 Nov 2020 17:38:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcHL-0000Wh-Jn; Tue, 24 Nov 2020 17:38:59 +0000
Received: by outflank-mailman (input) for mailman id 36682;
 Tue, 24 Nov 2020 17:38:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcHK-0000WD-5H
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:38:58 +0000
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7a55cf4-14fc-4845-a289-042abd0fa024;
 Tue, 24 Nov 2020 17:38:57 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id 9so6801825qvk.9
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:38:57 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id b3sm13138042qte.85.2020.11.24.09.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:38:56 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcHK-0000WD-5H
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:38:58 +0000
X-Inumbo-ID: a7a55cf4-14fc-4845-a289-042abd0fa024
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a7a55cf4-14fc-4845-a289-042abd0fa024;
	Tue, 24 Nov 2020 17:38:57 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id 9so6801825qvk.9
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Km12pVmBeWPgkRcOQAU5l84XavjRPJ4jqz28aKaNPFE=;
        b=qMRMh73o0YdpLAudiX8NPmCDY1bWM9OqQpg0RgHiyT+mlhnf0MZE5Czy8Qf5TqqFXj
         rj0mrD0ci08BBaP1QvOdQSlNYqt4OJVZLsc2rhNHZGmlnQEUH2P7sLZGRMA7ZcG7MS17
         yG8VIyxJ1lw+SyIO+IffHqOfCRSVn1pBmEJnkOVku1COq8LlNZb39TrX/RGHB52cYbib
         i+ykMchrdGixNcqG6wF1woJvO40gLVLsETP5ex6q4w5pbpO9xSAgvvJXfB6Yw0WWCqLF
         nDEPDCAPTAHfrqXDPn19OFx798DWMB961lVkvHrRd6Il2RPmsuogUvJSPGip8MEuWX9g
         QyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Km12pVmBeWPgkRcOQAU5l84XavjRPJ4jqz28aKaNPFE=;
        b=o+1XRVwduLMyv0VuJ7rqyxdoYjW4y9qcyjE59XvEDJn+MWe/kUUWZtUTZ6miPItMyx
         hpoW+AKgIOrcB2uPjTMOBzrfwZjt4MomdZrw3prLvoe9Qs+pbQQWcy8jqGPrws6hYZyb
         KWXazhXWwoO9Dgq1aO4df8ZRc7uSv93CtazElntNgUiSM3GX/uPbrqoMZsfYnIW/UjLn
         Y0MELWtoTbZrmmHV4vzoZkAY9xFP5ao0lnDRBdlIbYE8czADQ5v17ZDuRoTU8CfyLZM7
         U8eAhH28o3CWZL9gtMHnzCVx7dD0seq+5tWEACRfyhSlzgFBvCcRbw3fZOBLTT43td45
         uaEA==
X-Gm-Message-State: AOAM533LLRlJ6MgwzDxsd+DVFTyl3JmViFEF+Me9VeVkfywozeImH/JA
	uxmgKNX5pEySZytr23Oo9p4=
X-Google-Smtp-Source: ABdhPJx2viG2YUIcT9pxnUmh9SMKJ+iaGPuLa9sp1d1smXeKSZjMmg4Jo+Hs7YyRPHzhOtS6yXj/uA==
X-Received: by 2002:a0c:f7cc:: with SMTP id f12mr5949753qvo.0.1606239537123;
        Tue, 24 Nov 2020 09:38:57 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id b3sm13138042qte.85.2020.11.24.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:38:56 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:38:34 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 17/45] init: refactor name_to_dev_t
Message-ID: <X71FGgQtvXHTHU0V@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-18-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-18-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:23PM +0100, Christoph Hellwig wrote:
> Split each case into a self-contained helper, and move the block
> dependent code entirely under the pre-existing #ifdef CONFIG_BLOCK.
> This allows to remove the blk_lookup_devt stub in genhd.h.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

