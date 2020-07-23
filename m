Return-Path: <SRS0=8jzL=BC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC6FC433E3
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2020 21:57:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 059BB206E3
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2020 21:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 059BB206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyjDV-0007rT-0T; Thu, 23 Jul 2020 21:57:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rt52=BC=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1jyjDT-0007rO-Qw
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 21:57:27 +0000
X-Inumbo-ID: 7d893882-cd2f-11ea-8799-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d893882-cd2f-11ea-8799-bc764e2007e4;
 Thu, 23 Jul 2020 21:57:24 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id DF90611E48C62;
 Thu, 23 Jul 2020 14:40:37 -0700 (PDT)
Date: Thu, 23 Jul 2020 14:57:22 -0700 (PDT)
Message-Id: <20200723.145722.752878326752101646.davem@davemloft.net>
To: andrea.righi@canonical.com
Subject: Re: [PATCH] xen-netfront: fix potential deadlock in xennet_remove()
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200722065211.GA841369@xps-13>
References: <20200722065211.GA841369@xps-13>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 23 Jul 2020 14:40:38 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, sstabellini@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kuba@kernel.org,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Andrea Righi <andrea.righi@canonical.com>
Date: Wed, 22 Jul 2020 08:52:11 +0200

> +static int xennet_remove(struct xenbus_device *dev)
> +{
> +	struct netfront_info *info = dev_get_drvdata(&dev->dev);
> +
> +	dev_dbg(&dev->dev, "%s\n", dev->nodename);

These kinds of debugging messages provide zero context and are so much
less useful than simply using tracepoints which are more universally
available than printk debugging facilities.

Please remove all of the dev_dbg() calls from this patch.

