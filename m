Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6AAC63798
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71DA1206C0
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAaQvjyW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71DA1206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36696.68718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcHv-0000mA-D1; Tue, 24 Nov 2020 17:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36696.68718; Tue, 24 Nov 2020 17:39:35 +0000
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
	id 1khcHv-0000m1-8r; Tue, 24 Nov 2020 17:39:35 +0000
Received: by outflank-mailman (input) for mailman id 36696;
 Tue, 24 Nov 2020 17:39:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khcHt-0000lN-Nx
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:39:33 +0000
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a8f5b26-f15a-4a27-bf36-8f8ba215fd15;
 Tue, 24 Nov 2020 17:39:33 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u184so6910462qkf.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:39:33 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id e10sm13416860qkn.126.2020.11.24.09.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:39:32 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khcHt-0000lN-Nx
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:39:33 +0000
X-Inumbo-ID: 9a8f5b26-f15a-4a27-bf36-8f8ba215fd15
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9a8f5b26-f15a-4a27-bf36-8f8ba215fd15;
	Tue, 24 Nov 2020 17:39:33 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u184so6910462qkf.3
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gccbgbDD7s/mdcXht2fL6iBUT8Prx6ozPAIi1oy24XY=;
        b=iAaQvjyW2JnxhLhsfg8rCUwKx68+n4VYv+x/cr19/l2gHjZ5rqQ2eHUQa56Yyrf+V0
         0EBO+8uJl3e7TpL8GOVdi3mPtP96tXMXp7if6adHqmGOPUC9KUkBCbpdOTkT7hALT+Ah
         7EHhHu8GvT+6D/0VCKlT2valDN6Ru1DvIbYtbLzR9+yA8jAAqgTW92ZCQEl3Pxl49Unt
         n/9PGjVy4f9zVoTzBvz1OlBcvmK214hyEQI6i4iF3fx4WQFt+rk4+OOUR5M42Vw6rBoM
         uLOJwtqDc9FyseTQMx+P4zZsyxqAY70M/tC6pBQFw6EbxPD3Q0UbNVnIzJCU6WGu3JSB
         P/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=gccbgbDD7s/mdcXht2fL6iBUT8Prx6ozPAIi1oy24XY=;
        b=elzcoEXRuTdoayDeYBd+iQ2ZMOMaQih6O16bnx2Ty7Vrx5Nxhc27Neb261ZZxcqw47
         zvzigmZ0HybrRnOVFj6YFOlCPkOWnGcYNnZ4zWajRNcQjbWIPX+c2T0cdaB/n+XmuOKN
         YYxYfvGDbJQFSm/DovJEEM4M2ODB1/DbvHNRzJlvz9Qw8MTzUNtmu39De9UEWNwo0Xpm
         GdLxW4TGRzACX7ZIqBqdX31avBClUlDTLV1+QDKJIBz53tCUXzmK2M3HkFN0K4xX7sXD
         L1bjSS3DmuR5dkPV9vlIFunq/eykehFilCT5UFxukdD6C4/ZH/hHC+Rkk58RI10Yw779
         yMCg==
X-Gm-Message-State: AOAM533DUruITNcQc+6ZwFFyX+uu1hRNqIkrOHfLETqem91Vemb8cLSw
	794TipxFZc5QtB2I0NOHGzg=
X-Google-Smtp-Source: ABdhPJxIyQph6LZGahQWIRSjw01El8frTqGQNdMpj1StAekmqcFeaj8JjyjEpK9CN9Iflo08fhI4fA==
X-Received: by 2002:a05:620a:a1d:: with SMTP id i29mr5820661qka.466.1606239572817;
        Tue, 24 Nov 2020 09:39:32 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id e10sm13416860qkn.126.2020.11.24.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:39:32 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 12:39:10 -0500
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
Subject: Re: [PATCH 19/45] init: cleanup match_dev_by_uuid and
 match_dev_by_label
Message-ID: <X71FPpCgw9t3JfIr@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-20-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-20-hch@lst.de>

On Tue, Nov 24, 2020 at 02:27:25PM +0100, Christoph Hellwig wrote:
> Avoid a totally pointless goto label, and use the same style of
> comparism for both helpers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

