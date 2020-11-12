Return-Path: <SRS0=Jwwc=ES=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32589C2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 08:53:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA2312100A
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 08:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="EbkgWtod"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA2312100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25565.53399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd8Li-000257-9G; Thu, 12 Nov 2020 08:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25565.53399; Thu, 12 Nov 2020 08:52:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd8Li-000250-68; Thu, 12 Nov 2020 08:52:58 +0000
Received: by outflank-mailman (input) for mailman id 25565;
 Thu, 12 Nov 2020 08:52:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd8Lh-00024r-Ec
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:52:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bfb13eb-c43e-4598-9622-b5447e75571c;
 Thu, 12 Nov 2020 08:52:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00881AEEF;
 Thu, 12 Nov 2020 08:52:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd8Lh-00024r-Ec
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:52:57 +0000
X-Inumbo-ID: 0bfb13eb-c43e-4598-9622-b5447e75571c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0bfb13eb-c43e-4598-9622-b5447e75571c;
	Thu, 12 Nov 2020 08:52:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605171175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1Bm1ngOP1WkNoKcvlHcwd/62nXHP9dqBvCLvVeWuzo=;
	b=EbkgWtodszxUAm6SrXLf/67WERKrmz+4wZhstM5BBskO74mVdsu7O6rjui9Hejqa1b7jMN
	yRHpXo8ngGvwagw9VwuqQ9TzH6jnGyzc+U0WMvAuvuwZBeb+vOq4fKysOkdtmANoZsxsIj
	ZI92zeQiFMCOdZ5lLfZl6XRDvl76sOU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 00881AEEF;
	Thu, 12 Nov 2020 08:52:54 +0000 (UTC)
Subject: Re: [PATCH 05/10] viridian: use softirq batching in hvcall_ipi()
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <701b30f9-9552-84c0-63fa-0837b7939f4d@suse.com>
Date: Thu, 12 Nov 2020 09:52:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111200721.30551-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 21:07, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> vlapic_ipi() uses a softirq batching mechanism to improve the efficiency of
> sending a IPIs to large number of processors. This patch modifies send_ipi()
> (the worker function called by hvcall_ipi()) to also make use of the
> mechanism when there multiple bits set the hypercall_vpmask. Hence a `nr`
> field is added to the structure to track the number of set bits.

This is kind of unusual, i.e. we don't do so elsewhere. I take it the
assumption is that using bitmap_weight() is too much overhead?

> @@ -509,6 +510,7 @@ void viridian_domain_deinit(struct domain *d)
>  
>  struct hypercall_vpmask {
>      DECLARE_BITMAP(mask, HVM_MAX_VCPUS);
> +    unsigned int nr;
>  };
>  
>  static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
> @@ -516,21 +518,24 @@ static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
>  static void vpmask_empty(struct hypercall_vpmask *vpmask)
>  {
>      bitmap_zero(vpmask->mask, HVM_MAX_VCPUS);
> +    vpmask->nr = 0;
>  }
>  
>  static void vpmask_set(struct hypercall_vpmask *vpmask, unsigned int vp)
>  {
> -    __set_bit(vp, vpmask->mask);
> +    if ( !test_and_set_bit(vp, vpmask->mask) )
> +        vpmask->nr++;

If test_and_set_bit() is the correct thing to use here (rather
than __test_and_set_bit()), the counter also needs updating
atomically.

>  }
>  
>  static void vpmask_fill(struct hypercall_vpmask *vpmask)
>  {
>      bitmap_fill(vpmask->mask, HVM_MAX_VCPUS);
> +    vpmask->nr = HVM_MAX_VCPUS;
>  }
>  
>  static bool vpmask_test(struct hypercall_vpmask *vpmask, unsigned int vp)
>  {
> -    return test_bit(vp, vpmask->mask);
> +    return vpmask->nr && test_bit(vp, vpmask->mask);

Is this in fact an improvement?

Jan

