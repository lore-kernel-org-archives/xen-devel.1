Return-Path: <SRS0=weQ1=FI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5BBC4361A
	for <xen-devel@archiver.kernel.org>; Fri,  4 Dec 2020 08:12:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65F6C225A9
	for <xen-devel@archiver.kernel.org>; Fri,  4 Dec 2020 08:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F6C225A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.44104.79065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6CO-0001YW-Lz; Fri, 04 Dec 2020 08:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44104.79065; Fri, 04 Dec 2020 08:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6CO-0001YP-Iw; Fri, 04 Dec 2020 08:12:16 +0000
Received: by outflank-mailman (input) for mailman id 44104;
 Fri, 04 Dec 2020 08:12:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl6CN-0001YK-4T
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:12:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9918804-8b8f-4dfe-b45d-549cfa28f48d;
 Fri, 04 Dec 2020 08:12:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 381A7AD41;
 Fri,  4 Dec 2020 08:12:12 +0000 (UTC)
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
X-Inumbo-ID: c9918804-8b8f-4dfe-b45d-549cfa28f48d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607069532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pdz82aR/B76nVYaJnJdJnWiCk6FGMQ8yB3o9EbcmnJo=;
	b=lmikxqrUNr5oRXq8nMfBBCJrQDK1tpvJ2X2kbk6KsKKH3Ie+0S3eoqHIsdluW8hX3E9+PS
	bB7481imDZGGualU08/qQ62hHIq/dkPfYqLvknvLU9zulihzX88rEiA/iGkD217ClX+HRt
	IswOME9U6y+UXTcIlRBuZ1qeeichSHk=
Subject: Re: [PATCH v4 00/11] viridian: add support for ExProcessorMasks
To: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20201202092205.906-1-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fabc2720-3cbc-0b3f-1b09-23ec25189407@suse.com>
Date: Fri, 4 Dec 2020 09:12:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201202092205.906-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Wei,

On 02.12.2020 10:21, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Paul Durrant (11):
>   viridian: don't blindly write to 32-bit registers is 'mode' is invalid
>   viridian: move flush hypercall implementation into separate function
>   viridian: move IPI hypercall implementation into separate function
>   viridian: introduce a per-cpu hypercall_vpmask and accessor
>     functions...
>   viridian: use hypercall_vpmask in hvcall_ipi()
>   viridian: use softirq batching in hvcall_ipi()
>   viridian: add ExProcessorMasks variants of the flush hypercalls
>   viridian: add ExProcessorMasks variant of the IPI hypercall
>   viridian: log initial invocation of each type of hypercall
>   viridian: add a new '_HVMPV_ex_processor_masks' bit into
>     HVM_PARAM_VIRIDIAN...
>   xl / libxl: add 'ex_processor_mask' into
>     'libxl_viridian_enlightenment'
> 
>  docs/man/xl.cfg.5.pod.in             |   8 +
>  tools/include/libxl.h                |   7 +
>  tools/libs/light/libxl_types.idl     |   1 +
>  tools/libs/light/libxl_x86.c         |   3 +
>  xen/arch/x86/hvm/viridian/viridian.c | 604 +++++++++++++++++++++------
>  xen/include/asm-x86/hvm/viridian.h   |  10 +
>  xen/include/public/hvm/params.h      |   7 +-
>  7 files changed, 516 insertions(+), 124 deletions(-)

the status of this series was one of the topics of yesterday's
community call. Since Paul's prior ping hasn't had a response by
you (possibly because you're on PTO for an extended period of
time) the plan is to get this series in with as much of
reviewing that I was able to do by, perhaps, the middle of next
week. Unless of course we hear back from you earlier, giving at
least an indication of when you might be able to look at this.

Thanks for your understanding.

Paul, I notice v4 patches 10 and 11 never arrived in my inbox.
The list archives also don't have them. Therefore I can't check
the status of the tools side changes, and I don't think I'd
want to commit those anyway without tool stack side acks, the
more that they weren't part of what I've looked at.

Jan

