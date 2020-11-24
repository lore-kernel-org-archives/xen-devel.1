Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C06C2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 17:38:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C01F206C0
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 17:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5nEHa58"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C01F206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36657.68646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcGE-0008Sw-FN; Tue, 24 Nov 2020 17:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36657.68646; Tue, 24 Nov 2020 17:37:50 +0000
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
	id 1khcGE-0008So-C9; Tue, 24 Nov 2020 17:37:50 +0000
Received: by outflank-mailman (input) for mailman id 36657;
 Tue, 24 Nov 2020 17:37:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcGC-0008Rv-BK
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:37:48 +0000
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69dc5fb7-6488-428d-82f7-0451d1f7c2eb;
 Tue, 24 Nov 2020 17:37:47 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d9so21470549qke.8
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:37:47 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id s3sm13993894qtd.49.2020.11.24.09.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:37:46 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcGC-0008Rv-BK
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:37:48 +0000
X-Inumbo-ID: 69dc5fb7-6488-428d-82f7-0451d1f7c2eb
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 69dc5fb7-6488-428d-82f7-0451d1f7c2eb;
	Tue, 24 Nov 2020 17:37:47 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d9so21470549qke.8
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wOTAYzxGcPu7PN/+w1SzvPIVnfCkyOLysxq7PCKNFLc=;
        b=S5nEHa589iEpXYy2XcA6lRL7T7kP7ehDm9Bouqy1TnodFVSNw+U8eEGfZTJYqfio3r
         aIIXt6yzwSLgwAXuhqGZj4J0YKEc8mQF148TodMgN6CoPRzSm84R92521SCDHI4hoxuk
         PrhKXiEWiiWgA90gCoz9PIlh8ZPWrsLSXPz4r2Y++1aYQUvVlK+d6BRd/FHjM9xPm2Hs
         6bb0egK3xiad8BkBdBGUWpDfzh4paEIzt947869TGDizd9+eyC5CHgWZWOK8SY4CO5vu
         4gCZeAvqJwOZ5TwMcQFDDPh62cYWKSsPb62iSf4+2HH9Z1OX9VZ9xWj9lq9Oe9yG0Mbo
         CB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=wOTAYzxGcPu7PN/+w1SzvPIVnfCkyOLysxq7PCKNFLc=;
        b=dSlBUw642o+Y4fH2KDGhHzLS8ywPoqSEOai2Pnmd3UeIV09TuSIrpE/8FbmlUlRtaW
         BFGCsCFvBOf8YQvY2uKG19vu8Cso7d9zKCCmzq92U93IFi/Urhq6SOiDLEnTmAnjtxPG
         vZTiemLvYL9BoPF6EWvYvwJodTgvXHUA5mZHYIrhGPMByyzfUokdu4A77iN4c6s3e2mk
         mgbxzFJba1lGNqiMoBJXdn+TIXtAVrVzzXCasiC/G9pugIUcREFnBYldVgbTHA1YgdqR
         gXVt6mMrFnsbNubIpuwHKT/NKErtqrVazJIFI0aae73iR12Hq5TutvILyvOTiTqtG/HK
         3Fsw==
X-Gm-Message-State: AOAM533VPmfZ5+yxHOXFs8X+uGbi+Ttl9llZFLqB3y5REiQ+m6vBmYvV
	Ih4p27HR1zgpMeUdSc9GexQ=
X-Google-Smtp-Source: ABdhPJyBD8adSd77vYvAq958zJMB+ltr44tGztKokoaCAzhoNqA4YXMUBiY2USQm4Mo3NyM012Iq6w==
X-Received: by 2002:a05:620a:11a4:: with SMTP id c4mr6030355qkk.8.1606239467443;
        Tue, 24 Nov 2020 09:37:47 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id s3sm13993894qtd.49.2020.11.24.09.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:37:46 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:37:23 -0500
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
Subject: Re: [PATCH 13/45] block: add a bdev_kobj helper
Message-ID: <X71E05jyb3JdxRti@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-14-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-14-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:19PM +0100, Christoph Hellwig wrote:
> Add a little helper to find the kobject for a struct block_device.

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

