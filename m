Return-Path: <SRS0=Jwwc=ES=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BC1C5519F
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 17:06:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B84322240
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 17:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="f2MOydM+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B84322240
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25978.54080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdG2b-0005b4-P2; Thu, 12 Nov 2020 17:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25978.54080; Thu, 12 Nov 2020 17:05:45 +0000
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
	id 1kdG2b-0005ax-Lp; Thu, 12 Nov 2020 17:05:45 +0000
Received: by outflank-mailman (input) for mailman id 25978;
 Thu, 12 Nov 2020 17:05:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdG2a-0005as-Fd
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 17:05:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ad11b9f-5454-4460-bf9f-c1a2d8d59da0;
 Thu, 12 Nov 2020 17:05:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 035E2AEA3;
 Thu, 12 Nov 2020 17:05:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdG2a-0005as-Fd
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 17:05:44 +0000
X-Inumbo-ID: 8ad11b9f-5454-4460-bf9f-c1a2d8d59da0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8ad11b9f-5454-4460-bf9f-c1a2d8d59da0;
	Thu, 12 Nov 2020 17:05:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605200743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nou+Bbhxc7Qz00xcAcdRZYTsOU2heJ17OW97NrpU6yA=;
	b=f2MOydM+sFmDzzE6PdpnqRBsm4YjJuLBzTUM1xzhXn+ZUI/nzX7Oo4is7YoabswWHx0Ob9
	y2I+XI4fLMHMd0GBLjynLhD8VCqtnkATZwj0qo/SHsL4KORcSiAnGhSdEvE3amwUvomCLP
	S1mrVVyDgeg6Z4Z5OUUXt/7uWMuN6Nk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 035E2AEA3;
	Thu, 12 Nov 2020 17:05:43 +0000 (UTC)
Subject: Re: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Manuel Bouyer <bouyer@antioche.eu.org>
References: <20201112155715.GA5003@antioche.eu.org>
 <20201112163240.6xswol2iswikdzef@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49bf4029-ee5f-e90e-c7a1-e0a6c4da5f7a@suse.com>
Date: Thu, 12 Nov 2020 18:02:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201112163240.6xswol2iswikdzef@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.11.2020 17:32, Roger Pau Monné wrote:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -371,7 +371,12 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>              entry->updated = false;
>          }
>          else
> +        {
> +            printk("%pp offset %u len %u new_masked %d enabled %d masked %d updated %d\n",
> +                   &pdev->sbdf, offset, len, new_masked, msix->enabled, msix->masked,
> +                   entry->updated);
>              vpci_msix_arch_mask_entry(entry, pdev, entry->masked);
> +        }

What about a write of all zero as the very first write we
get to see, while msix->masked is true? I'm getting the
impression we would never have come through update_entry()
in this case, and hence vpci_msix_arch_enable_entry() - the
only function setting entry->arch.pirq to a valid value
afaics - would never have been called.

Jan

