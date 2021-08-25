Return-Path: <SRS0=ian9=NQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFE5C4338F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 06:49:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00CD360EFF
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 06:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00CD360EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.171818.313527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImiT-0003cI-OX; Wed, 25 Aug 2021 06:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171818.313527; Wed, 25 Aug 2021 06:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImiT-0003cB-LX; Wed, 25 Aug 2021 06:48:53 +0000
Received: by outflank-mailman (input) for mailman id 171818;
 Wed, 25 Aug 2021 06:48:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPkz=NQ=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1mImiR-0003c5-L5
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 06:48:51 +0000
Received: from mail-qt1-x82c.google.com (unknown [2607:f8b0:4864:20::82c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a4555a0-560a-44de-9657-8f786e0c3478;
 Wed, 25 Aug 2021 06:48:50 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id l24so19013315qtj.4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Aug 2021 23:48:50 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
 by smtp.gmail.com with ESMTPSA id o12sm10014806qtt.94.2021.08.24.23.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 23:48:49 -0700 (PDT)
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
X-Inumbo-ID: 1a4555a0-560a-44de-9657-8f786e0c3478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to;
        bh=ENBxngmdLQ/NL0N3ysSaUZ4vQacscEK9QX6WnH5kxyg=;
        b=c+3fF9XlhyL1XuabSU36NdbLoJJJqAFgNUbH0XRYLkiY49q5Jkvm6uYezEK5eRUqqV
         j3sVeqOTWWdmRolA40QDTX3tOX7pTy2y9gvho/DGKrJBT9ingp+mvfEzLgR4LnQlrltp
         3qXK2oa5Y5yO2ZrXH37RG4quhtYeB72bTznAvIFEASBw/T26mom9yVDkbcU/9TPBfDdJ
         oZIyjYLovPQxega6OZUoMJgw2ybvWZN70CvwkNZLV+LL+4+Vwibz9XLlRvIQqA9u5tzo
         wjk+G/9gw28xTYV3JjbRIusRnUQKnRe7SYYFPbPbdaw9D3ZbBQHpkyngDJxHUe6BBQ64
         +dLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to;
        bh=ENBxngmdLQ/NL0N3ysSaUZ4vQacscEK9QX6WnH5kxyg=;
        b=jKPuq8hQu+MYqHn5u2syT7jy1Tj1ayrtVv3Z6Wq+q2QSOQMjsjD7zblYLtrZyU8ulV
         w+cqrL22dfz5O7YLYX1sYuwmICkOk4yFxPKRi/fZXAVVHKVkr8w72OcMz4+5M6a/XGg0
         RsdDGo6+8KfWtHmsxzL/6nXyyYY8TQGa23qd2Z0yTxArSwcSYV6k3Yw7Df4O/fUjzi5a
         VAefS81ex5KjM2Zw69hcXg3qj3/6s5sBk6NffMiw9Vzhz+kxA6T8F4f1PtwWYQDEeqmZ
         ePi9rb1yceNI2h6b9dbX8sBHMfcsNNpwLYJZuANIYOR5UKOclB6Io9zpx90q1iII4nJx
         A7uw==
X-Gm-Message-State: AOAM532QUc5UFstdk/eKOJ9KTeyeQGu94r4mRTBFJxx8LYacC/r6Mmdj
	EwttK3nD1EzOj42J6y/jquM=
X-Google-Smtp-Source: ABdhPJyyrPWm2MTX8dyV1M5SN44qtCWu+Y5hVbiNci8LEvUANwoJXkQ8BoOPZihcdfcxfsogEpAjKQ==
X-Received: by 2002:ac8:7dcb:: with SMTP id c11mr39139656qte.260.1629874130385;
        Tue, 24 Aug 2021 23:48:50 -0700 (PDT)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: CGEL <cgel.zte@gmail.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	SeongJae Park <sjpark@amazon.de>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Jing Yangyang <jing.yangyang@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] drivers/xen/xenbus/xenbus_client.c: fix bugon.cocci warnings
Date: Wed, 25 Aug 2021 06:48:43 +0000
Message-Id: <20210825064843.3027-1-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210825062451.69998-1-deng.changcheng@zte.com.cn>

From: SeongJae Park <sjpark@amazon.de>

On Tue, 24 Aug 2021 23:24:51 -0700 CGEL <cgel.zte@gmail.com> wrote:

> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Use BUG_ON instead of a if condition followed by BUG.
> 
> Generated by: scripts/coccinelle/misc/bugon.cocci
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>

Reviewed-by: SeongJae Park <sjpark@amazon.de>


Thanks,
SJ

[...]

