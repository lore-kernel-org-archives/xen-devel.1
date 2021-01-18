Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581FBC43381
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 11:05:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05DC5221F8
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 11:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05DC5221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69591.124665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SLQ-0000Qf-VI; Mon, 18 Jan 2021 11:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69591.124665; Mon, 18 Jan 2021 11:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SLQ-0000QY-S3; Mon, 18 Jan 2021 11:05:12 +0000
Received: by outflank-mailman (input) for mailman id 69591;
 Mon, 18 Jan 2021 11:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1SLP-0000QT-Jt
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 11:05:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1d8209e-ce74-4169-81a8-55c1de40fcc6;
 Mon, 18 Jan 2021 11:05:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC6F4ACF5;
 Mon, 18 Jan 2021 11:05:09 +0000 (UTC)
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
X-Inumbo-ID: c1d8209e-ce74-4169-81a8-55c1de40fcc6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610967910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lhbWKbFRqmnloTg8G0grSjUIKhDRA+6o4/NWlR5Y04=;
	b=OnRC4mPKwSmr75gTuvevDy/36yvx60hLYhIzav261hcnKNf1JpKv557IdzwT/yOLHB7f1H
	H6MOcywFm+Qog2T5c0Yv2qDcVqPiAiRkhUECsCM9GPP5sLMqxbPB8nk9gFtPSybCptlnUl
	Rs+IZHqEAytuXTIxJqy7r2KoEA93LGs=
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210115150138.36087-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
Date: Mon, 18 Jan 2021 12:05:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115150138.36087-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 16:01, Roger Pau Monne wrote:
> This is a revert of f5cfa0985673 plus a rework of the comment that
> accompanies the setting of the flag so we don't forget why it needs to
> be unconditionally set: it's indicating whether the version of Xen has
> the original issue fixed and IOMMU entries are created for
> grant/foreign maps.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Despite my earlier ack I came to think that the description and
comment still don't make it quite clear what was actually wrong
with the prior change, and hence they also don't really guard
against the same getting done again (perhaps even by me). May I
ask that you add a paragraph above and ...

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
>  
>          /*
> -         * Indicate that memory mapped from other domains (either grants or
> -         * foreign pages) has valid IOMMU entries.
> +         * Unconditionally set the flag to indicate this version of Xen has
> +         * been fixed to create IOMMU mappings for grant/foreign maps.
>           */
> -        if ( is_iommu_enabled(d) )
> -            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> +        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;

... try to clarify the "Unconditionally" here?

Jan

