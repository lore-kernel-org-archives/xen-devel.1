Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8358CC63777
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 18:04:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06DA22087C
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 18:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is4ScJMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06DA22087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36750.68769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcfb-0003xT-Ik; Tue, 24 Nov 2020 18:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36750.68769; Tue, 24 Nov 2020 18:04:03 +0000
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
	id 1khcfb-0003xM-Ee; Tue, 24 Nov 2020 18:04:03 +0000
Received: by outflank-mailman (input) for mailman id 36750;
 Tue, 24 Nov 2020 18:04:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcfZ-0003xH-CN
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 18:04:01 +0000
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43030d14-aac1-4507-80bd-825c0fab2e05;
 Tue, 24 Nov 2020 18:04:00 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id h20so3011964qkk.4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 10:04:00 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id c14sm13621716qko.29.2020.11.24.10.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 10:03:59 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcfZ-0003xH-CN
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 18:04:01 +0000
X-Inumbo-ID: 43030d14-aac1-4507-80bd-825c0fab2e05
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 43030d14-aac1-4507-80bd-825c0fab2e05;
	Tue, 24 Nov 2020 18:04:00 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id h20so3011964qkk.4
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 10:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8qZ2mbF42a4EoCPjpueBEzfe9XOwF2IptTReGgUwObs=;
        b=is4ScJMtRgB8A67gco8/ShkniDzY10n7rMewX714/9E8uwhLChpIiLuhS9NYdAwKZO
         wwPFFE1umeJEQtu7KDxbrmdClPTpQcYjr1RpDpjnuZBK1iq0PQfGRfm19X+XI49NQayK
         8lAFgH0g1BclA/vf2p2mEb1VckBHMRHQuZY2MAZGNuGYbRuKC1k7RL8V45KondL8dAgu
         pkggwpY/K/3AGEFSp3YuAHk/ID2wYfhEWzIb5TQJq39NiNddKNAmZTO9FhKaayKgBddH
         Z4wiCaTnVN8dlV2LZgcg+T7QWmffCA0edb1cuImXXMdzH67nJfiqgEY4ncID7PjQAYKh
         /ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=8qZ2mbF42a4EoCPjpueBEzfe9XOwF2IptTReGgUwObs=;
        b=RS/K55POrmjxsS0uHRZuDr1UHl2JMZxC4D2tjV3o+D0wjmD5EujPTbeG1fRIom9Tzc
         O/owSkBn+THWf8paMtYPhNt++swOPhO2bkv5DAATUVhxcq6E1YDTaxVk8OR/c5xPPDaI
         v+5+Kmj4ChKhBQOaAN3xL8eRl+tB5szDmmy6frN/l8he3sqQjZV8zBncLtdq5U1ttzvY
         mPw1iEn5qeHxkcybnOXcuo1j1RAIjVAwu6XleHobcY/2tandS/oIC0z82dhiChGfL2ta
         eAuM4JnXQQAKpMgqrj5oe0niPtNNE0RFhUjRxD+nrUvf3YnbNQfKblfolRTjYgQQYDRO
         jCsA==
X-Gm-Message-State: AOAM532YCt52520yEzQLV4eABGRUQroDcNmq9WK37GrsoK2cPkJHfqpd
	9bw00r5GLr9rQpgqFZhK9Mw=
X-Google-Smtp-Source: ABdhPJypHMVf10j8dqLbG3/kMc2wzxScN+9Rw3Fm44OZCed30V+ovAuzBFJQGc76NiRl6CUPNsyaww==
X-Received: by 2002:ae9:e007:: with SMTP id m7mr5836885qkk.416.1606241040110;
        Tue, 24 Nov 2020 10:04:00 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id c14sm13621716qko.29.2020.11.24.10.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 10:03:59 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 13:03:36 -0500
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
Subject: Re: [PATCH 21/45] block: refactor blkdev_get
Message-ID: <X71K+JS+xnGs+EPF@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-22-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-22-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:27PM +0100, Christoph Hellwig wrote:
> Move more code that is only run on the outer open but not the open of
> the underlying whole device when opening a partition into blkdev_get,
> which leads to a much easier to follow structure.
> 
> This allows to simplify the disk and module refcounting so that one
> reference is held for each open, similar to what we do with normal
> file operations.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

