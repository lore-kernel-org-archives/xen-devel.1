Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F06BC433ED
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 14:11:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E8461448
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 14:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05E8461448
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128302.240895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidxd-00046t-8o; Mon, 17 May 2021 14:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128302.240895; Mon, 17 May 2021 14:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidxd-00046m-5n; Mon, 17 May 2021 14:11:09 +0000
Received: by outflank-mailman (input) for mailman id 128302;
 Mon, 17 May 2021 14:11:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lidxc-00046g-6K
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 14:11:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2475df2b-71d5-4864-be04-448e29dea9fc;
 Mon, 17 May 2021 14:11:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B3985B226;
 Mon, 17 May 2021 14:11:05 +0000 (UTC)
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
X-Inumbo-ID: 2475df2b-71d5-4864-be04-448e29dea9fc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621260665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHKWqf4XFF6yDcLUh1zTWK08SLSurVXp3htCEcxP5vE=;
	b=E/smndzrybtZpCiCz9AUTl7jnNh2pkguz/VZt6nPJHhKIgSHg5e+tw9ARnJDn1EcyK2+cn
	lFybTRXBH2ocNsv/+wp+GGviqEPear+M6xfRObO9q4jdTFrboawxEbyCMWSdUqoavyooLm
	QhEcb3OMdpcAQwB8NU5o7YmQaot/KFs=
Subject: Re: [PATCH 4/8] xen/blkfront: don't trust the backend response data
 blindly
To: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <315ad8b9-8a98-8d3e-f66c-ab32af2731a8@suse.com>
Date: Mon, 17 May 2021 16:11:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513100302.22027-5-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.05.2021 12:02, Juergen Gross wrote:
> @@ -1574,10 +1580,16 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  	spin_lock_irqsave(&rinfo->ring_lock, flags);
>   again:
>  	rp = rinfo->ring.sring->rsp_prod;
> +	if (RING_RESPONSE_PROD_OVERFLOW(&rinfo->ring, rp)) {
> +		pr_alert("%s: illegal number of responses %u\n",
> +			 info->gd->disk_name, rp - rinfo->ring.rsp_cons);
> +		goto err;
> +	}
>  	rmb(); /* Ensure we see queued responses up to 'rp'. */

I think you want to insert after the barrier.

> @@ -1680,6 +1707,11 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  	spin_unlock_irqrestore(&rinfo->ring_lock, flags);
>  
>  	return IRQ_HANDLED;
> +
> + err:
> +	info->connected = BLKIF_STATE_ERROR;
> +	pr_alert("%s disabled for further use\n", info->gd->disk_name);
> +	return IRQ_HANDLED;
>  }

Am I understanding that a suspend (and then resume) can be used to
recover from error state? If so - is this intentional? If so in turn,
would it make sense to spell this out in the description?

Jan

