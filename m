Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59936C56202
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 21:20:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E4F20715
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 21:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBpFqtt8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02E4F20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36981.69102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khfjX-0007k4-7W; Tue, 24 Nov 2020 21:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36981.69102; Tue, 24 Nov 2020 21:20:19 +0000
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
	id 1khfjX-0007jx-3y; Tue, 24 Nov 2020 21:20:19 +0000
Received: by outflank-mailman (input) for mailman id 36981;
 Tue, 24 Nov 2020 21:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khfjV-0007ji-KC
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:20:17 +0000
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc2ab0f1-843f-468a-b676-88d6cfdc8f0b;
 Tue, 24 Nov 2020 21:20:17 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id dm12so461034qvb.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:20:17 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id o16sm451985qkg.27.2020.11.24.13.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:20:16 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khfjV-0007ji-KC
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:20:17 +0000
X-Inumbo-ID: bc2ab0f1-843f-468a-b676-88d6cfdc8f0b
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bc2ab0f1-843f-468a-b676-88d6cfdc8f0b;
	Tue, 24 Nov 2020 21:20:17 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id dm12so461034qvb.3
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3HC7ZqQanyIo8VeBYdMEle4L/4ENFYEM5MkKt8pSh/w=;
        b=SBpFqtt8PXbzCveB3YbrqNUj//b1rdDV1EqJm8ZT0/PCMKGkmFs6PzBliBJcdVTLfk
         tv/ZuM+3J7XM+n5fEUuohYu6uKi1fCr78XSUa/5RUJdfK+5UfN3C0U3yX9T9Q54Q5SaR
         vVOVCypSCFl85W7pD0ksSCQvKz2n77IAVCPEhA9UoBfthB9BvyYs6pYTaIL0wmQf9aCu
         xcqLyNke/DBRRYIHLihURVxMheAgoXZ/e0RlaCkV/7/TeYdWzBYlD3KA6yr3YBRfdQIT
         T2cBKt53JFvRl9mTVJp+iF+XYLyh3G75CH9aRMRIV/K8O2t4jUxGxv8CwdtQFQ8WaWa/
         HyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=3HC7ZqQanyIo8VeBYdMEle4L/4ENFYEM5MkKt8pSh/w=;
        b=Ejgbm/JT/OykUEzjtW/KJBRgBiSU+uvTtj1vouOfOFOdfKMHT975QK8/18rwAVIQ+C
         Jdbht3lN2SYUAw5lLkkNgByyRvkKLGbI8D/qx4M+nJNrEkrFr1FY7Ml1huCJJVkJt+b2
         qu0VIEWuYPEC2R0hoOfJHvuC2LngaIBDMggZ4tty35QSfDkNvBSYyP9/pud19/rWRHLN
         OgUaU11UETgQau/445BzgQ66ZH7fc0NZHrMLEQ2fYTZgC6F2xNbMvl+N/gL9Py31n9aa
         ESCr98I7uWAd0pASwMovdiPU6xGBqB4y+0tO+NAsDM2LXn3GHgUe1RSrEkPnYf3dyJ7E
         7fJQ==
X-Gm-Message-State: AOAM530HWE4kxAYyQVHBAoBETxaqpDH26dc0wY6X3jPVYUVojmpwxdST
	Cr81jb7Resz/RPd38cagdB0=
X-Google-Smtp-Source: ABdhPJxH3CMpes4k7VUBJmRwBA7xuLJPWwlXmpOLLvAcoVgK+lPVzlEL/k+veWQQUizcViCkQhf2+Q==
X-Received: by 2002:a05:6214:2a1:: with SMTP id m1mr370118qvv.35.1606252816750;
        Tue, 24 Nov 2020 13:20:16 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id o16sm451985qkg.27.2020.11.24.13.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 13:20:16 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 16:19:53 -0500
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
Subject: Re: [PATCH 27/45] block: simplify the block device claiming interface
Message-ID: <X714+RhOhKVlNrAo@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-28-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-28-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:33PM +0100, Christoph Hellwig wrote:
> Stop passing the whole device as a separate argument given that it
> can be trivially deducted and cleanup the !holder debug check.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

