Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D263C2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 21:20:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE3A82083E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 21:20:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNSLo8Jo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE3A82083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36987.69114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khfk0-0007rr-I4; Tue, 24 Nov 2020 21:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36987.69114; Tue, 24 Nov 2020 21:20:48 +0000
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
	id 1khfk0-0007rk-Dm; Tue, 24 Nov 2020 21:20:48 +0000
Received: by outflank-mailman (input) for mailman id 36987;
 Tue, 24 Nov 2020 21:20:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khfjz-0007r1-6K
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:20:47 +0000
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 595e21ca-42d4-493f-8598-8893429f8259;
 Tue, 24 Nov 2020 21:20:41 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q22so524711qkq.6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:20:41 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id b33sm298244qta.62.2020.11.24.13.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:20:40 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khfjz-0007r1-6K
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:20:47 +0000
X-Inumbo-ID: 595e21ca-42d4-493f-8598-8893429f8259
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 595e21ca-42d4-493f-8598-8893429f8259;
	Tue, 24 Nov 2020 21:20:41 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q22so524711qkq.6
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ev/F4l5kU0JVd8J9T+Hn7/Emi68DyGqwAl9VsbylUp0=;
        b=ZNSLo8JoXJqjP5o+nIXl1wDfRlZM34G4UajJItZyFsuYjmXMkUKdp9TKdu4qQVAcH5
         1UtlzvL9QAOsVwNuRmLXs7qTazgrsdlD0c9Fg5jpMS46JIBuEyExozrq6Rpy6KkznpEk
         LK8bE886olCSw1TOZhi4r5Dvu6oUxUSyqj8CgYwDqSKsVWJ+RHfjDuv3hkDpzS8EceZD
         HTuSBVL4noo6GQEfe1lNegiK98NcOs7S2p1t2MSFBRzQhrkn/44t1OAHb6UpUFPD3EHa
         FTBQsVjSYGJSYiOLAEycBszTag6Jbur7U/Yzxl9519cveNmQk/zw99cBH024rHQM0vOy
         HpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ev/F4l5kU0JVd8J9T+Hn7/Emi68DyGqwAl9VsbylUp0=;
        b=NjfquaP+L7jMv+xEjOhCHHZd/oSxOSsg4buPePGlKgBenzDEjHLnP9bEJFr6iHCwEC
         v6k1sQLRL+dXfufx8UuhPI3IdEpIqaSc0uXxHbnQDuu7SKgXrkTCNU5NanoNPlIBvB8L
         XshxRaeGM0jQbJTZo+UrqXORW2CeOZFaacElHuv9N1Usbee27io0nnTqRMcp0A101qTK
         mjSwPLsrcJmH+0D08Rn94o6D9E+vVseAiXuLha7n4ZPnYzGabOspy/sMhpmJ3XhrjDgW
         DHigqiI/+tlAEm3Y7oSN6uGrv8GEyNjKmADw/0xffkhrRTATGm0mASFenczf33ylQFb0
         xtyw==
X-Gm-Message-State: AOAM5330iNN9lY6rSe0uxlKb0omJPfLFi3VuUL4btZkWKg0DPAsxqUDs
	nN6JtzUMt6/cieOO9yhCIWg=
X-Google-Smtp-Source: ABdhPJxVPExCrpl6SBnHr8hh5lACFOCmcWgKuDYnGDx1xBxinXihB0MFiLxOfh+ARQAqrCZ49K/lyA==
X-Received: by 2002:a37:7481:: with SMTP id p123mr176688qkc.424.1606252841332;
        Tue, 24 Nov 2020 13:20:41 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id b33sm298244qta.62.2020.11.24.13.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 13:20:40 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 16:20:18 -0500
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
Subject: Re: [PATCH 28/45] block: simplify part_to_disk
Message-ID: <X715EkY5mafgeJWZ@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-29-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-29-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:34PM +0100, Christoph Hellwig wrote:
> Now that struct hd_struct has a block_device pointer use that to
> find the disk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

